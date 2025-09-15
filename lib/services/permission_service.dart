import 'package:permission_handler/permission_handler.dart';

/// 权限管理服务类
class PermissionService {
  static final PermissionService _instance = PermissionService._internal();

  factory PermissionService() => _instance;

  PermissionService._internal();

  /// 请求所有必要权限
  Future<bool?> requestAllPermissions() async {
    final result = await [Permission.location].request();
    return !result.values.any((status) => status.isDenied);
  }
}
