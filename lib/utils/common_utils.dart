import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:url_launcher/url_launcher.dart';

void debugLog(String message, {Object? error, StackTrace? stackTrace}) {
  if (!AppConst.production) {
    log(message, error: error, stackTrace: stackTrace);
  }
}

void logLong(String msg) {
  const int chunk = 800;
  final int len = msg.length;
  for (var i = 0; i < msg.length; i += chunk) {
    log(msg.substring(i, i + chunk > len ? len : i + chunk));
  }
}


//请求日志 再logcat 窗口输出
void printDebugLog(String message) {
  if (!AppConst.production) {
    final int maxLength = 1000; // 设置每行的最大字符数
    if (message.length > maxLength) {
      // 将长消息分割为多行
      for (int i = 0; i < message.length; i += maxLength) {
        print(
          message.substring(
            i,
            i + maxLength > message.length ? message.length : i + maxLength,
          ),
        );
      }
    } else {
      print(message); // 如果消息长度小于maxLength，直接打印
    }
  }
}

void toast(String msg) => showToast(msg, radius: 20);

final routeObserver = RouteObserver<ModalRoute<void>>();

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void showNormalSnack(String message) {
  scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
  );
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

//身份证验证
bool idNumValid(String idNum) {
  return idNum.length == AppConst.idNumLen;
}

class FlutterPlatform {
  static const _method = MethodChannel('${AppConst.applicationId}/channel');

  static Future<Map> trackInfo() async {
    final result = await _method.invokeMethod<Map>('trackInfo');
    return result as Map;
  }

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
    if (phone?.startsWith('http') == true) {
      await launchUrl(Uri.parse(phone!));
    } else {
      final mobile = phone?.replaceAll('+', '');
      final Uri whatsappUri = Uri.parse('whatsapp://send?phone=$mobile');
      if (await canLaunchUrl(whatsappUri)) {
        await launchUrl(whatsappUri);
      } else {
        final Uri waUri = Uri.parse(
          'https://api.whatsapp.com/send?phone=$mobile',
        );
        await launchUrl(waUri);
      }
    }
  }
}

extension ContextNavigation on BuildContext {
  void pushH5Privacy() {
    final uriH5Privacy = Uri(
      path: AppRouter.appWeb,
      queryParameters: {
        NavKey.title: 'Politica de privacidad',
        NavKey.url: AppConst.h5Privacy,
      },
    );
    push(uriH5Privacy.toString());
  }

  void pushH5Service() {
    final uriH5Service = Uri(
      path: AppRouter.appWeb,
      queryParameters: {
        NavKey.title: 'Acuerdo de servicio',
        NavKey.url: AppConst.h5Service,
      },
    );
    push(uriH5Service.toString());
  }
}

extension DateTimeFormat on DateTime {
  String get showDate => DateFormat('dd/MM/yyyy').format(this);

  String get showDateTime => DateFormat('dd/MM/yyyy HH:mm:ss').format(this);

  int get secondSinceEpoch {
    final tzDateTime = tz.TZDateTime.fromMillisecondsSinceEpoch(
      tz.getLocation('America/Guatemala'),
      millisecondsSinceEpoch,
    );
    return (tzDateTime.millisecondsSinceEpoch / 1000.0).toInt();
  }
}

extension TimestampFormat on int {
  String get showCountdown =>
      DateFormat.Hms().format(DateTime(0, 0, 0, 0, 0, this));

  DateTime get fromSecondsSinceEpoch =>
      DateTime.fromMillisecondsSinceEpoch(this * 1000);

  String get showDate => tz.TZDateTime.fromMillisecondsSinceEpoch(
    tz.getLocation('America/Guatemala'),
    this * 1000,
  ).showDate;

  String get showDateTime => tz.TZDateTime.fromMillisecondsSinceEpoch(
    tz.getLocation('America/Guatemala'),
    this * 1000,
  ).showDateTime;
}

extension AmountFormat on num {
  String get showAmount =>
      NumberFormat.currency(symbol: 'Q ', decimalDigits: 0).format(this);

  String get showRound => NumberFormat('#,###').format(this);

  String get showInput => NumberFormat('####').format(this);
}

extension StringExtensions on String? {
  int? get tryParseInt => this != null ? int.tryParse(this!) : null;

  double? get tryParseDouble => this != null ? double.tryParse(this!) : null;
}

extension ListDictExtensions on List<DictItem> {
  DictItem? findKey(int? key) {
    for (DictItem element in this) {
      if (key == element.key) return element;
    }
    return null;
  }
}

extension IterableExtensions<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

extension ContextSizeExtensions on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;
}

extension BankCardExtensions on BankCardResp$Item {
  String get bankValue {
    final name = t1h91pOBankName ?? '';
    final number = zebrineOCardNo ?? '';
    if (number.length < 3) return name;
    final end = number.substring(number.length - 3);
    return '$t1h91pOBankName(*$end)';
  }
}

// 扩展方法定义（放在公共工具类）
extension ListSafety<T> on List<T> {
  T? getOrNull(int index) =>
      (index >= 0 && index < length) ? this[index] : null;
}


/// 字符串非空验证扩展
extension NotEmptyValidation on String? {
  /// 检查字符串是否为有效非空内容
  ///
  /// 验证条件：
  /// 1. 非 null
  /// 2. 非空字符串 ("" 无效)
  /// 3. 非纯空白字符 ("   " 无效)
  ///
  /// 返回值：
  /// true - 字符串含有有效内容
  /// false - 字符串为空或无效
  bool get isNotEmptyOrNull {
    if (this == null) return false;       // 空值检查
    if (this!.isEmpty) return false;      // 空字符串检查
    return this!.trim().isNotEmpty;       // 空白字符检查
  }
}