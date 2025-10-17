import 'dart:collection';

import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/utils/common_utils.dart';

//todo  记得更改 AndroidManifest meta-data，得设置 Appsflyer 开发者密钥
//todo main.dat 里面 init  Appsflyer 开发者密钥 记得更改
//todo 记得更改eventName
class AppsFlyerEvents {
  //首次授信成功
  static const String afFirstCreditSuccess = 'purchase';

  //首次借款
  static const String afFirstLoan = 'purchase';
}

class AppsflyerService {
  final String TAG = "AppsflyerEvent";

  // Appsflyer SDK 实例
  late AppsflyerSdk _appsflyerSdk;

  // 是否已经初始化
  bool _isInitialized = false;

  // 构造函数
  AppsflyerService._privateConstructor();

  static final AppsflyerService _instance =
      AppsflyerService._privateConstructor();

  factory AppsflyerService() {
    return _instance;
  }

  // 初始化 Appsflyer SDK
  Future<void> init(
    String devKey,
    String appId, {
    bool showDebug = true,
  }) async {
    if (_isInitialized) return;

    try {
      // 初始化 Appsflyer SDK
      _appsflyerSdk = AppsflyerSdk(
        AppsFlyerOptions(afDevKey: devKey, appId: appId, showDebug: showDebug),
      );
      await _appsflyerSdk.initSdk();

      String? afId = await _appsflyerSdk.getAppsFlyerUID();

      await LocalStorage().set(AppConst.afIdKey, afId ?? "");

      debugLog('Retrieved afid from Appsflyer SDK: $afId');
      _isInitialized = true;
      debugLog('Appsflyer SDK Initialized');
    } catch (error) {
      debugLog('Error logging event: $error');
    }
  }

  // 发送事件
  Future<void> logEvent(String eventName) async {
    try {
      if (!_isInitialized) {
        debugLog('Appsflyer SDK not initialized!');
        return;
      }
      final storage = LocalStorage();
      final userGid = storage.userGid ?? "";
      Map<String, dynamic> eventMap = HashMap();
      eventMap['userGid'] = userGid;

      if (!AppConst.production) {
        //测试环境直接打印日志
        print('$TAG:$eventName: $eventMap');
        return;
      }
      var result = await _appsflyerSdk.logEvent(eventName, eventMap);
    } catch (error) {
      debugLog('Error logging event: $error');
    }
  }
}
