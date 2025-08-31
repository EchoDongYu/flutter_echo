import 'package:permission_handler/permission_handler.dart';

/// 权限管理服务类
class PermissionService {
  static final PermissionService _instance = PermissionService._internal();

  factory PermissionService() => _instance;

  PermissionService._internal();

  /// 请求所有必要权限
  Future<void> requestAllPermissions() async {
    await [
      Permission.camera,
      Permission.location,
      Permission.sms,
      Permission.phone,
      Permission.notification,
    ].request();
  }

  /// 打开应用设置页面
  Future<bool> openAppSettings() async {
    return await openAppSettings();
  }
}
