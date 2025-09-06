import 'dart:convert';

import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 本地存储服务类
class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();

  factory LocalStorage() => _instance;

  LocalStorage._internal();

  late SharedPreferences _prefs;

  /// 初始化
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    if (_prefs.getString(AppConst.deviceIdKey) == null) {
      final deviceId = await FlutterPlatform.getDeviceId();
      if (deviceId != null) {
        await _prefs.setString(AppConst.deviceIdKey, deviceId);
      }
    }
  }

  Future<bool> set(String key, dynamic object) async {
    return switch (object) {
      String value => _prefs.setString(key, value),
      bool value => _prefs.setBool(key, value),
      int value => _prefs.setInt(key, value),
      double value => _prefs.setDouble(key, value),
      List<String> value => _prefs.setStringList(key, value),
      _ => _prefs.setString(key, jsonEncode(object)),
    };
  }

  dynamic get(String key) {
    return _prefs.get(key);
  }

  /// 获取字符串列表
  List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }

  /// 获取JSON格式对象
  Map<String, dynamic>? getObject(String key) {
    String? jsonString = _prefs.getString(key);
    if (jsonString != null) {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    }
    return null;
  }

  /// 删除指定键
  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  String? get token => _prefs.getString(AppConst.tokenKey);

  String? get userGid => _prefs.getString(AppConst.userGidKey);

  String? get account => _prefs.getString(AppConst.accountKey);

  UserInfoResp? get userInfo {
    final userInfo = getObject(AppConst.userInfoKey);
    if (userInfo == null) return null;
    return UserInfoResp.fromJson(userInfo);
  }

  bool get isLogin {
    String? token = _prefs.getString(AppConst.tokenKey);
    return token != null && token.isNotEmpty;
  }

  /// 是否已同意披露，不再显示
  bool get showDisclosure => _prefs.getBool(AppConst.disclosureKey) != true;

  /// 获取设备号
  String? get deviceId => _prefs.getString(AppConst.deviceIdKey);

  Future<void> userLogin(LoginResp data) async {
    final dToken = data.y260zpOToken;
    if (dToken != null) await _prefs.setString(AppConst.tokenKey, dToken);
    final dUserGid = data.raiaOUserGid?.toString();
    if (dUserGid != null) await _prefs.setString(AppConst.userGidKey, dUserGid);
    final account = data.sordidOMobile;
    if (account != null) await _prefs.setString(AppConst.accountKey, account);
  }

  void logout() {
    _prefs.remove(AppConst.tokenKey);
    _prefs.remove(AppConst.userGidKey);
    _prefs.remove(AppConst.userInfoKey);
    _prefs.remove(AppConst.accountKey);
  }
}
