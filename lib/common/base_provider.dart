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
  Future<R?> launchRequest<R>(
    Future<R?> action, {
    bool showLoading = true,
    bool toastError = true,
  }) async {
    R? result;
    dynamic error;
    try {
      if (showLoading) _loading = true;
      _apiError = null;
      notifyListeners();
      result = await action;
    } catch (e, s) {
      debugLog('ApiError', error: e, stackTrace: s);
      error = e;
    } finally {
      if (showLoading) _loading = false;
      notifyListeners();
      if (error != null) {
        if (error is ApiResponse) {
          if (error.globalCode) {
            _apiError = error;
            notifyListeners();
          } else if (toastError) {
            Fluttertoast.showToast(msg: error.msg);
          }
        } else if (error is! DioException) {
          Fluttertoast.showToast(msg: error.toString());
        }
        error = null;
      }
    }
    return result;
  }

  bool? get loading => _loading;

  String? get location => _location;

  ApiResponse? get apiError => _apiError;

  void consumeLoading() => _loading = null;

  void consumeNavigation() => _location = null;

  void consumeApiError() => _apiError = null;

  void navigation(String destination) {
    _location = destination;
    notifyListeners();
  }
}
