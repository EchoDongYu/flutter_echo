import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/api_response.dart';
import 'package:flutter_echo/services/api_config.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BaseProvider extends ChangeNotifier {
  final apiService = ApiController(AppConst.baseUrl);
  bool? _loading;
  String? _location;
  ApiResponse? _apiError;

  /// 执行网络请求，并自动管理 loading/error
  Future<bool> launchRequest(
    Future Function() action, {
    bool showLoading = true,
    bool toastError = true,
    Function(String?, String?)? onError,
  }) async {
    dynamic error;
    try {
      if (showLoading) _loading = true;
      _apiError = null;
      notifyListeners();
      await action();
      return true;
    } catch (e, s) {
      debugLog('ApiError', error: e, stackTrace: s);
      error = e;
      return false;
    } finally {
      if (showLoading) _loading = false;
      notifyListeners();
      if (error != null) {
        if (error is ApiResponse) {
          if (!_handleApiError(error)) {
            if (toastError) Fluttertoast.showToast(msg: error.msg);
            onError?.call(error.code, error.msg);
          }
        } else if (!error is DioException) {
          Fluttertoast.showToast(msg: error.toString());
        }
        error = null;
      }
    }
  }

  /// 全局响应code处理，返回是否拦截
  bool _handleApiError(ApiResponse apiResp) {
    return false;
  }

  bool? get loading => _loading;

  String? get location => _location;

  ApiResponse? get apiError => _apiError;

  void consumeLoading() => _loading = null;

  void consumeNavigation() => _location = null;

  void navigation(String destination) {
    _location = destination;
    notifyListeners();
  }
}
