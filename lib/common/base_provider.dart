import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/api_response.dart';
import 'package:flutter_echo/services/api_config.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:go_router/go_router.dart';

abstract class BaseProvider extends ChangeNotifier {
  final apiService = ApiController(AppConst.baseUrl);
  bool? _loading;
  ApiResponse? _apiError;
  Function(BuildContext)? _navAction;

  /// 执行网络请求，并自动管理 loading/error
  Future<R?> launchRequest<R>(
    Future<R?> Function() action, {
    bool showLoading = true,
    bool toastError = true,
    List<String> blockCodes = const [],
    Function(ApiResponse resp)? onBlockError,
  }) async {
    R? result;
    dynamic error;
    try {
      if (showLoading) _loading = true;
      _apiError = null;
      notifyListeners();
      result = await action();
    } catch (e, s) {
      debugLog('ApiError', error: e, stackTrace: s);
      error = e;
    } finally {
      if (showLoading) _loading = false;
      notifyListeners();
      if (error != null) {
        if (error is ApiResponse) {
          if (blockCodes.contains(error.code)) {
            onBlockError?.call(error);
          } else if (ApiResponse.globalCodes.contains(error.code)) {
            _apiError = error;
            notifyListeners();
          } else if (toastError) {
            error.toastErrorMsg();
          }
        } else if (error is! DioException) {
          toast(error.toString());
        }
        error = null;
      }
    }
    return result;
  }

  bool? get loading => _loading;

  ApiResponse? get apiError => _apiError;

  Function(BuildContext)? get navAction => _navAction;

  void consumeLoading() => _loading = null;

  void consumeApiError() => _apiError = null;

  void consumeNavAction() => _navAction = null;

  void navigate(Function(BuildContext)? action) {
    _navAction = action;
    notifyListeners();
  }

  void pushReplacement(String location) =>
      navigate((context) => context.pushReplacement(location));

  void onCaptcha(
    Future<String?> Function({required String? mobile, required int? type})
    showCaptchaDialog,
  ) {}
}
