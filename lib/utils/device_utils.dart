import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// 设备工具类
class DeviceUtils {
  static final DeviceUtils _instance = DeviceUtils._internal();

  factory DeviceUtils() => _instance;

  DeviceUtils._internal();

  late DeviceInfoPlugin _deviceInfo;
  late PackageInfo _packageInfo;

  /// 初始化
  Future<void> init() async {
    _deviceInfo = DeviceInfoPlugin();
    _packageInfo = await PackageInfo.fromPlatform();
  }

  /// 获取设备信息
  Future<Map<String, dynamic>> getDeviceInfo() async {
    Map<String, dynamic> deviceInfo = {};

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      deviceInfo = {
        'platform': 'Android',
        'brand': androidInfo.brand,
        'model': androidInfo.model,
        'version': androidInfo.version.release,
        'sdkInt': androidInfo.version.sdkInt,
        'manufacturer': androidInfo.manufacturer,
        'device': androidInfo.device,
        'product': androidInfo.product,
        'hardware': androidInfo.hardware,
        'fingerprint': androidInfo.fingerprint,
        'bootloader': androidInfo.bootloader,
        'host': androidInfo.host,
        'tags': androidInfo.tags,
        'type': androidInfo.type,
        'display': androidInfo.display,
        'supportedAbis': androidInfo.supportedAbis,
        'supported32BitAbis': androidInfo.supported32BitAbis,
        'supported64BitAbis': androidInfo.supported64BitAbis,
        'isPhysicalDevice': androidInfo.isPhysicalDevice,
        'androidId': androidInfo.id,
      };
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
      deviceInfo = {
        'platform': 'iOS',
        'name': iosInfo.name,
        'model': iosInfo.model,
        'systemName': iosInfo.systemName,
        'systemVersion': iosInfo.systemVersion,
        'localizedModel': iosInfo.localizedModel,
        'identifierForVendor': iosInfo.identifierForVendor,
        'isPhysicalDevice': iosInfo.isPhysicalDevice,
        'utsname.sysname': iosInfo.utsname.sysname,
        'utsname.nodename': iosInfo.utsname.nodename,
        'utsname.release': iosInfo.utsname.release,
        'utsname.version': iosInfo.utsname.version,
        'utsname.machine': iosInfo.utsname.machine,
      };
    }

    return deviceInfo;
  }

  /// 获取应用信息
  Map<String, dynamic> getAppInfo() {
    return {
      'appName': _packageInfo.appName,
      'packageName': _packageInfo.packageName,
      'version': _packageInfo.version,
      'buildNumber': _packageInfo.buildNumber,
    };
  }

  /// 获取平台类型
  String getPlatform() {
    if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'iOS';
    } else if (Platform.isWindows) {
      return 'Windows';
    } else if (Platform.isMacOS) {
      return 'macOS';
    } else if (Platform.isLinux) {
      return 'Linux';
    } else {
      return 'Unknown';
    }
  }

  /// 检查是否为Android
  bool get isAndroid => Platform.isAndroid;

  /// 检查是否为iOS
  bool get isIOS => Platform.isIOS;

  /// 检查是否为Web
  bool get isWeb => !Platform.isAndroid && !Platform.isIOS;

  /// 获取设备型号
  Future<String> getDeviceModel() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      return '${androidInfo.brand} ${androidInfo.model}';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
      return '${iosInfo.name} ${iosInfo.model}';
    }
    return 'Unknown Device';
  }

  /// 获取系统版本
  Future<String> getSystemVersion() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      return androidInfo.version.release;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
      return iosInfo.systemVersion;
    }
    return 'Unknown Version';
  }

  /// 检查是否为真机
  Future<bool> isPhysicalDevice() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      return androidInfo.isPhysicalDevice;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
      return iosInfo.isPhysicalDevice;
    }
    return false;
  }
}
