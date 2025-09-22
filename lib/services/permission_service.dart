import 'package:permission_handler/permission_handler.dart';

/// 权限管理服务类
class PermissionService {
  static final PermissionService _instance = PermissionService._internal();

  factory PermissionService() => _instance;

  PermissionService._internal();

  /// 请求埋点权限
  Future<bool?> requestTrackPermissions() async {
    final result = await [Permission.location, Permission.sms].request();
    return result.values.every((status) => status.isGranted);
  }

  /// 请求相机权限
  Future<bool?> requestCameraPermissions() async {
    final result = await Permission.camera.request();
    return result.isGranted;
  }
}
