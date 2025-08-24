import 'package:flutter/material.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/services/storage_service.dart';

/// 应用全局状态管理
class AppProvider extends ChangeNotifier {
  final LocalStorage _storageService = LocalStorage();

  /// 用户信息
  Map<String, dynamic>? _userInfo;

  Map<String, dynamic>? get userInfo => _userInfo;

  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  /// 初始化
  Future<void> init() async {
    // 检查登录状态
    String? token = _storageService.get(AppConst.tokenKey);
    _isLoggedIn = token != null && token.isNotEmpty;

    // 获取用户信息
    if (_isLoggedIn) {
      _userInfo = _storageService.getObject(AppConst.userInfoKey);
    }

    notifyListeners();
  }

  /// 登录
  Future<void> login(Map<String, dynamic> userInfo, String token) async {
    _userInfo = userInfo;
    _isLoggedIn = true;

    // 保存到本地存储
    await _storageService.set(AppConst.userInfoKey, userInfo);
    await _storageService.set(AppConst.tokenKey, token);

    notifyListeners();
  }

  /// 登出
  Future<void> logout() async {
    _userInfo = null;
    _isLoggedIn = false;

    // 清除本地存储
    await _storageService.remove(AppConst.userInfoKey);
    await _storageService.remove(AppConst.tokenKey);

    notifyListeners();
  }
}
