import 'dart:convert';

import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/providers/submit_provider.dart';
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
      return jsonDecode(jsonString) as Map<String, dynamic>?;
    }
    return null;
  }

  /// 删除指定键
  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  String? get token => _prefs.getString(AppConst.tokenKey);

  String? get userGid => _prefs.getString(AppConst.userGidKey);

  String? get realAccount => _prefs.getString(AppConst.accountKey);

  String? get maskAccount {
    final value = realAccount;
    if (value == null || value.length <= 4) return value;
    final start = value.substring(0, 2);
    final end = value.substring(value.length - 2);
    final middle = '*' * (value.length - 4);
    return '$start$middle$end';
  }

  UserInfoResp? get userInfo {
    final json = getObject(AppConst.userInfoKey);
    if (json == null) return null;
    return UserInfoResp.fromJson(json);
  }

  bool get isLogin {
    String? token = _prefs.getString(AppConst.tokenKey);
    return token != null && token.isNotEmpty;
  }

  /// 是否已同意披露，不再显示
  bool? get disclosure => _prefs.getBool(AppConst.disclosureKey);

  /// 获取设备号
  String? get deviceId => _prefs.getString(AppConst.deviceIdKey);

  /// kyc步骤
  int? get kycStep => _prefs.getInt(AppConst.kycStepKey);

  MainInfoResp? get mainInfo {
    final json = getObject(AppConst.mainInfoKey);
    if (json == null) return null;
    return MainInfoResp.fromJson(json);
  }

  Future<void> userLogin(LoginResp data, CheckRegisterResp? info) async {
    final dToken = data.y260zpOToken;
    if (dToken != null) await _prefs.setString(AppConst.tokenKey, dToken);
    final dUserGid = data.raiaOUserGid?.toString();
    if (dUserGid != null) await _prefs.setString(AppConst.userGidKey, dUserGid);
    final account = data.sordidOMobile;
    if (account != null) await _prefs.setString(AppConst.accountKey, account);
    final mainInfo = MainInfoResp(
      cressyOTraderPwd: info?.cressyOTraderPwd,
      fm50w8OLoginPwd: info?.fm50w8OLoginPwd,
    );
    if (info != null) await set(AppConst.mainInfoKey, mainInfo);
  }

  Future<void> logout() async {
    SubmitModel.clearCachedData();
    await _prefs.remove(AppConst.tokenKey);
    await _prefs.remove(AppConst.userGidKey);
    await _prefs.remove(AppConst.userInfoKey);
    await _prefs.remove(AppConst.accountKey);
    await _prefs.remove(AppConst.kycStepKey);
    await _prefs.remove(AppConst.kycDataKey);
  }
}
