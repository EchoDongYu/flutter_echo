import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:intl/intl.dart';

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
  static const _method = MethodChannel('${AppConst.applicationId}/channel');

  static Future<Map?> pickContact() {
    return _method.invokeMethod<Map>('pickContact');
  }

  static Future<String?> getDeviceId() {
    return _method.invokeMethod<String>('getDeviceId');
  }

  /// 请求渠道:0-微信；1-ios客户端；2-android客户端；3-网页
  static String get reqChannel => switch (Platform.operatingSystem) {
    'android' => '2',
    'ios' => '1',
    _ => '-1',
  };
}

extension DateTimeFormat on DateTime {
  String get showDate => DateFormat('dd/MM/yyyy').format(this);
}

extension TimestampFormat on int {
  String get showDate => DateTime.fromMillisecondsSinceEpoch(this).showDate;

  String get showCountdown =>
      DateFormat.Hms().format(DateTime(0, 0, 0, 0, 0, this));
}

extension AmountFormat on num {
  String get showAmount => NumberFormat.currency(
    locale: AppConst.localeCode,
    symbol: 'Q',
  ).format(this);

  String get showRound => NumberFormat('###', AppConst.localeCode).format(this);
}

extension StringParse on String? {
  int? get tryParseInt => this != null ? int.tryParse(this!) : null;

  double? get tryParseDouble => this != null ? double.tryParse(this!) : null;
}
