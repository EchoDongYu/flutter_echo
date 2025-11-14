import 'package:flutter/cupertino.dart';
import 'package:flutter_echo/services/api_service.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/utils/common_utils.dart';

class MyErrorsHandler {
  // 用于处理 Flutter 错误
  void onErrorDetails(FlutterErrorDetails details) {
    // 你可以在这里进行错误报告，例如记录日志、发送报告
    String errorMessage = details.exception.toString(); // 异常信息
    String stackTrace = details.stack.toString(); // 堆栈信息

    reportErrorLog(errorMessage: errorMessage, stackTrace: stackTrace);
    //print('FlutterError fullError: $fullError}');
  }

  // 用于处理平台级错误（如 Dart 异常）
  void onError(Object error, StackTrace stack) {
    String errorMessage = error.toString(); // 异常信息
    String stackTrace = stack.toString(); // 堆栈信息
    reportErrorLog(errorMessage: errorMessage, stackTrace: stackTrace);
    // 处理平台错误，比如发送到远程日志服务
  }

  // ==== 事件上传优化 ====
  Future<void> reportErrorLog({
    String? errorMessage,
    String? stackTrace,
  }) async {
    final storage = LocalStorage();

    String fullError =
        'Error Message: $errorMessage\n\nStack Trace:\n$stackTrace';
    Map<String, dynamic> map = {};

    map['userId'] = storage.userGid;
    map['errorMessage'] = fullError;
    debugLog('uploadErrorMessage: $map');
    try {
      // 上传当前批次
      await Api.reportErrorLog(map);
    } catch (e) {
      printDebugLog("reportLogError:$e");
    }
  }
}

// 全局实例
final myErrorsHandler = MyErrorsHandler();
