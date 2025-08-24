import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/constants.dart';

void debugLog(String message, {Object? error, StackTrace? stackTrace}) {
  if (!AppConst.production) {
    log(message, error: error, stackTrace: stackTrace);
  }
}

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void showNormalSnack(String message) {
  scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
  );
}

class FlutterPlatform {
  static const _methodChannel = MethodChannel(
    'com.credigo.rapidos.prestamos.app/channel',
  );

  static Future<Map?> pickContact() {
    return _methodChannel.invokeMethod<Map>('pickContact');
  }

  static Future<String?> getDeviceId() {
    return _methodChannel.invokeMethod<String>('getDeviceId');
  }

  /// 请求渠道:0-微信；1-ios客户端；2-android客户端；3-网页
  static String get reqChannel => switch (Platform.operatingSystem) {
    'android' => '2',
    'ios' => '1',
    _ => '-1',
  };
}
