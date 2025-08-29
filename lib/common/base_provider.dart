import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/api_response.dart';
import 'package:flutter_echo/services/api_config.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BaseProvider extends ChangeNotifier {
  final apiService = ApiController(AppConst.baseUrl);
  LoadingEvent? loading;
  String? navRoute;
  String? errorCode;
  ApiResponse? apiError;

  /// 执行网络请求，并自动管理 loading/error
  Future<bool> launchRequest({
    bool showLoading = true,
    bool consumeError = true,
    required Future Function() onRequest,
  }) async {
    dynamic error;
    try {
      if (showLoading) loading = LoadingEvent.showLoading();
      errorCode = null;
      notifyListeners();
      await onRequest();
      return true;
    } catch (e, s) {
      debugLog('ApiError', error: e, stackTrace: s);
      error = e;
      return false;
    } finally {
      if (showLoading) loading = LoadingEvent.closeLoading();
      notifyListeners();
      if (error != null) {
        if (error is ApiResponse) {
          onApiResponseError(error);
        } else if (error! is DioException) {
          Fluttertoast.showToast(msg: error.toString());
        }
        error = null;
      }
    }
  }

  void onApiResponseError(ApiResponse apiResp) {
    Fluttertoast.showToast(msg: apiResp.msg);
  }
}

class LoadingEvent {
  final bool value;

  LoadingEvent(this.value);

  factory LoadingEvent.showLoading() => LoadingEvent(true);

  factory LoadingEvent.closeLoading() => LoadingEvent(false);
}
