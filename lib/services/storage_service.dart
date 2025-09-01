import 'dart:convert';

import 'package:flutter_echo/common/constants.dart';
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

  /// 获取设备号
  Future<String> getDeviceId() async {
    final cacheDeviceId = _prefs.getString(AppConst.deviceIdKey);
    if (cacheDeviceId == null) {
      final deviceId = await FlutterPlatform.getDeviceId();
      await _prefs.setString(AppConst.deviceIdKey, deviceId!);
      return deviceId;
    } else {
      return cacheDeviceId;
    }
  }

  bool get isLogin {
    String? token = _prefs.getString(AppConst.tokenKey);
    return token != null && token.isNotEmpty;
  }

  bool get showDisclosure => _prefs.getBool(AppConst.disclosureKey) != true;

  String? get token => _prefs.getString(AppConst.tokenKey);

  String? get userGid => _prefs.getString(AppConst.userGidKey);

  Future<void> logout() async {
    _prefs.remove(AppConst.tokenKey);
    _prefs.remove(AppConst.userGidKey);
  }
}
