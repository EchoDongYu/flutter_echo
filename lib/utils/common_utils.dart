import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/constants.dart';
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

void toast({required String msg}) => showToast(msg);

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
}

extension TimestampFormat on int {
  String get showDate => DateTime.fromMillisecondsSinceEpoch(this).showDate;

  String get showCountdown =>
      DateFormat.Hms().format(DateTime(0, 0, 0, 0, 0, this));
}

extension AmountFormat on num {
  String get showAmount => NumberFormat.currency(symbol: 'Q ').format(this);

  String get showRound => NumberFormat('#,###').format(this);
}

extension StringParse on String? {
  int? get tryParseInt => this != null ? int.tryParse(this!) : null;

  double? get tryParseDouble => this != null ? double.tryParse(this!) : null;
}

extension ContextSizeExt on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  /// 获取状态栏高度
  double get statusBarHeight => MediaQuery.of(this).padding.top;

  /// 获取底部安全区域高度
  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;
}