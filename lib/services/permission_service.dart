import 'package:permission_handler/permission_handler.dart';

/// 权限管理服务类
class PermissionService {
  static final PermissionService _instance = PermissionService._internal();

  factory PermissionService() => _instance;

  PermissionService._internal();

  /// 请求相机权限
  Future<bool> requestCameraPermission() async {
    PermissionStatus status = await Permission.camera.request();
    return status.isGranted;
  }

  /// 请求位置权限
  Future<bool> requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();
    return status.isGranted;
  }

  /// 请求通知权限
  Future<bool> requestNotificationPermission() async {
    PermissionStatus status = await Permission.notification.request();
    return status.isGranted;
  }

  /// 请求短信权限
  Future<bool> requestSmsPermission() async {
    PermissionStatus status = await Permission.sms.request();
    return status.isGranted;
  }

  /// 请求电话权限
  Future<bool> requestPhonePermission() async {
    PermissionStatus status = await Permission.phone.request();
    return status.isGranted;
  }

  /// 检查相机权限
  Future<bool> checkCameraPermission() async {
    PermissionStatus status = await Permission.camera.status;
    return status.isGranted;
  }

  /// 检查位置权限
  Future<bool> checkLocationPermission() async {
    PermissionStatus status = await Permission.location.status;
    return status.isGranted;
  }

  /// 检查通知权限
  Future<bool> checkNotificationPermission() async {
    PermissionStatus status = await Permission.notification.status;
    return status.isGranted;
  }

  /// 检查短信权限
  Future<bool> checkSmsPermission() async {
    PermissionStatus status = await Permission.sms.status;
    return status.isGranted;
  }

  /// 检查电话权限
  Future<bool> checkPhonePermission() async {
    PermissionStatus status = await Permission.phone.status;
    return status.isGranted;
  }

  /// 请求所有必要权限
  Future<Map<String, bool>> requestAllPermissions() async {
    Map<String, bool> results = {};

    results['camera'] = await requestCameraPermission();
    results['location'] = await requestLocationPermission();
    results['notification'] = await requestNotificationPermission();
    results['sms'] = await requestSmsPermission();
    results['phone'] = await requestPhonePermission();

    return results;
  }

  /// 检查所有必要权限
  Future<Map<String, bool>> checkAllPermissions() async {
    Map<String, bool> results = {};

    results['camera'] = await checkCameraPermission();
    results['location'] = await checkLocationPermission();
    results['notification'] = await checkNotificationPermission();
    results['sms'] = await checkSmsPermission();
    results['phone'] = await checkPhonePermission();

    return results;
  }

  /// 打开应用设置页面
  Future<bool> openAppSettings() async {
    return await openAppSettings();
  }

  /// 打开权限设置页面
  Future<bool> openPermissionSettings() async {
    return await openAppSettings();
  }
}
