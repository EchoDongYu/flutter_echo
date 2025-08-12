import 'package:flutter/material.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/services/storage_service.dart';

/// 应用全局状态管理
class AppProvider extends ChangeNotifier {
  final StorageService _storageService = StorageService();

  // 用户信息
  Map<String, dynamic>? _userInfo;
  bool _isLoggedIn = false;
  bool _isFirstLaunch = true;

  // 网络状态
  bool _isOnline = true;

  // Getters
  Map<String, dynamic>? get userInfo => _userInfo;

  bool get isLoggedIn => _isLoggedIn;

  bool get isFirstLaunch => _isFirstLaunch;

  bool get isOnline => _isOnline;

  /// 初始化
  Future<void> init() async {
    // 检查是否首次启动
    _isFirstLaunch =
        _storageService.getBool(AppConstants.isFirstLaunchKey) ?? true;

    // 检查登录状态
    String? token = _storageService.getString(AppConstants.tokenKey);
    _isLoggedIn = token != null && token.isNotEmpty;

    // 获取用户信息
    if (_isLoggedIn) {
      _userInfo = _storageService.getObject(AppConstants.userInfoKey);
    }

    notifyListeners();
  }

  /// 设置首次启动状态
  Future<void> setFirstLaunch(bool value) async {
    _isFirstLaunch = value;
    await _storageService.setBool(AppConstants.isFirstLaunchKey, value);
    notifyListeners();
  }

  /// 登录
  Future<void> login(Map<String, dynamic> userInfo, String token) async {
    _userInfo = userInfo;
    _isLoggedIn = true;

    // 保存到本地存储
    await _storageService.setObject(AppConstants.userInfoKey, userInfo);
    await _storageService.setString(AppConstants.tokenKey, token);

    notifyListeners();
  }

  /// 登出
  Future<void> logout() async {
    _userInfo = null;
    _isLoggedIn = false;

    // 清除本地存储
    await _storageService.remove(AppConstants.userInfoKey);
    await _storageService.remove(AppConstants.tokenKey);

    notifyListeners();
  }

  /// 更新用户信息
  Future<void> updateUserInfo(Map<String, dynamic> userInfo) async {
    _userInfo = userInfo;
    await _storageService.setObject(AppConstants.userInfoKey, userInfo);
    notifyListeners();
  }

  /// 设置网络状态
  void setOnlineStatus(bool isOnline) {
    _isOnline = isOnline;
    notifyListeners();
  }

  /// 获取用户ID
  String? get userId => _userInfo?['id'];

  /// 获取用户名
  String? get username => _userInfo?['username'];

  /// 获取用户手机号
  String? get phone => _userInfo?['phone'];

  /// 获取用户头像
  String? get avatar => _userInfo?['avatar'];
}
