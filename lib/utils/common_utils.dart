import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';
import 'package:url_launcher/url_launcher.dart';

void debugLog(String message, {Object? error, StackTrace? stackTrace}) {
  if (!AppConst.production) {
    log(message, error: error, stackTrace: stackTrace);
  }
}

void toast(String msg) => showToast(msg);

final routeObserver = RouteObserver<ModalRoute<void>>();

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void showNormalSnack(String message) {
  scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
  );
}

/// 手机号脱敏展示，前2 后2
String maskPhoneNumber(String phone) {
  if (phone.length <= 4) return phone;
  final start = phone.substring(0, 2);
  final end = phone.substring(phone.length - 2);
  final middle = '*' * (phone.length - 4);
  return '$start$middle$end';
}

// 匹配 emoji 的常见 Unicode 区间
final emojiReg = RegExp(
  r'[\u{1F600}-\u{1F64F}]|' // 表情符号
  r'[\u{1F300}-\u{1F5FF}]|' // 符号 & 图形
  r'[\u{1F680}-\u{1F6FF}]|' // 交通 & 地图
  r'[\u{2600}-\u{26FF}]|' // 杂项符号
  r'[\u{2700}-\u{27BF}]', // 符号
  unicode: true,
);

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

  static Future<void> launchWhatsApp(String? phone) async {
    final Uri whatsappUri = Uri.parse('whatsapp://send?phone=$phone');
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    } else {
      final Uri waUri = Uri.parse(
        'https://wa.me/${phone?.replaceAll('+', '')}',
      );
      await launchUrl(waUri);
    }
  }
}

extension ContextNav on BuildContext {
  void pushH5Privacy() {
    final uriRoute = Uri(
      path: AppRouter.appWeb,
      queryParameters: {
        NavKey.title: 'Politica de privacidad',
        NavKey.url: AppConst.h5Privacy,
      },
    );
    push(uriRoute.toString());
  }

  void pushH5Service() {
    final uriRoute = Uri(
      path: AppRouter.appWeb,
      queryParameters: {
        NavKey.title: 'Acuerdo de servicio',
        NavKey.url: AppConst.h5Service,
      },
    );
    push(uriRoute.toString());
  }
}

extension DateTimeFormat on DateTime {
  String get showDate => DateFormat('dd/MM/yyyy').format(this);

  int get secondSinceEpoch => (millisecondsSinceEpoch / 1000.0).toInt();
}

extension TimestampFormat on int {
  String get showCountdown =>
      DateFormat.Hms().format(DateTime(0, 0, 0, 0, 0, this));

  DateTime get fromSecondsSinceEpoch =>
      DateTime.fromMillisecondsSinceEpoch(this * 1000);

  String get showDate => fromSecondsSinceEpoch.showDate;
}

extension AmountFormat on num {
  String get showAmount => NumberFormat.currency(symbol: 'Q ').format(this);

  String get showRound => NumberFormat('#,###').format(this);
}

extension StringParse on String? {
  int? get tryParseInt => this != null ? int.tryParse(this!) : null;

  double? get tryParseDouble => this != null ? double.tryParse(this!) : null;
}

extension ListExt on List<StepItem> {
  StepItem? findKey(int? key) {
    for (StepItem element in this) {
      if (key == element.key) return element;
    }
    return null;
  }
}
