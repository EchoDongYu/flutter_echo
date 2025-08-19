/// 应用常量定义
class AppConstants {
  // 应用信息
  static const String appName = 'FlutterNow';
  static const String appVersion = '1.0.0';

  // API 配置
  static const String baseUrl = 'https://api.example.com';
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;

  // 本地存储键名
  static const String tokenKey = 'token';
  static const String userInfoKey = 'user_info';
  static const String isFirstLaunchKey = 'is_first_launch';

  // 权限相关
  static const String cameraPermission = 'camera';
  static const String locationPermission = 'location';
  static const String notificationPermission = 'notification';
  static const String smsPermission = 'sms';
  static const String phonePermission = 'phone';
  static const String networkPermission = 'network';
  static const String deviceInfoPermission = 'device_info';
  static const String appListPermission = 'app_list';

  // 电话配置
  static const int phoneLength = 8;
  static const int codeLength = 4;
}
