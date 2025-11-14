import 'dart:collection';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_echo/event/event_constants.dart';
import 'package:flutter_echo/event/event_data.dart';
import 'package:flutter_echo/services/api_service.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async'; // 引入Completer

enum FaceStatus {
  NotSubmitted("0"),
  Success("2"),
  Failure("1");

  final String value;

  const FaceStatus(this.value);
}

class EventService {
  // ==== 静态变量优化 ====
  static String? _appStartId;
  static const String _appStartIdKey = 'appStartId';
  static const String _faceGroupIdKey = 'faceGroupIdKey';
  static const String _bizOrderIdKey = 'bizOrderIdKey';
  static const String _orderIdKey = '_orderIdKey';
  static const String _eventsBoxName = 'app_eventsBox';

  static String _TAG = "EventService";

  // 使用 Completer 缓存 Hive Box 实例
  static Completer<Box<Event>>? _boxCompleter;

  //行为id 每次进入页面生成
  static String? eventIncomeId;

  //单独对face 界面行为id，因为是需要返回到ocr界面才保持数据
  static String? faceEventIncomeId;

  static String? faceGroupId; //组id ，再提交前可能会有多次人脸检测，所以需要一个组Id

  static String? _bizOrderId; //授信id
  static String? _orderId; //订单id

  static EventParam faceEventParam = EventParam();

  // 初始化方法
  static Future<void> init() async {
    // 预初始化 Hive Box（避免后续操作重复打开）
    if (_boxCompleter == null) {
      final box = await Hive.openBox<Event>(_eventsBoxName);
      _boxCompleter = Completer<Box<Event>>()..complete(box);
    }
  }

  // ==== ID 管理优化 ====

  /// 生成并缓存应用启动 ID
  static Future<void> generateAppStartId() async {
    final storage = LocalStorage();
    _appStartId = generateIdWithTimestamp();
    await storage.set(_appStartIdKey, _appStartId!);
  }

  ///生成id
  static String generateIdWithTimestamp() {
    var random = Random();
    int timestamp = DateTime.now().millisecondsSinceEpoch; // 当前时间戳（毫秒）
    int randomPart = random.nextInt(10000000); // 生成一个 7 位数的随机数
    return '$timestamp-$randomPart'; // 格式：时间戳-随机数
  }

  static String generateLoginEventPageId() {
    return generateEventPageId(EventIncomeIdPrefix.prefixLogin);
  }

  //进入页面要调用此方法 要不然行为id不会重新生成
  static String generateEventPageId(String prefix) {
    eventIncomeId = "$prefix${generateIdWithTimestamp()}";
    return eventIncomeId ?? "";
  }

  /// 获取启动 ID（内存 -> 缓存 -> 新建）
  static Future<String> getAppStartId() async {
    if (_appStartId != null) return _appStartId!;

    final prefs = await SharedPreferences.getInstance();
    _appStartId = prefs.getString(_appStartIdKey);

    if (_appStartId == null) {
      await generateAppStartId();
    }

    return _appStartId!;
  }

  // ==== Hive 操作优化 ====
  /// 获取 Hive Box（使用缓存实例）
  static Future<Box<Event>> _getEventBox() async {
    if (_boxCompleter == null) {
      await init();
    }
    return _boxCompleter!.future;
  }

  static Future<void> storeClickEvent(
    Event event, {
    String? bizOrderId,
    String? orderId,
  }) async {
    event.eventAction = EventAction.eventActionClick;
    return await storeEvent(event);
  }

  static Future<void> storeInputEvent(
    Event event, {
    String? bizOrderId,
    String? orderId,
  }) async {
    event.eventAction = EventAction.eventActionInput;
    return await storeEvent(event);
  }

  ///通用埋点方法==============
  static Future<void> storeCheckEvent(
    Event event, {
    String? bizOrderId,
    String? orderId,
  }) async {
    event.eventAction = EventAction.modelCodeCheck;
    return await storeEvent(event);
  }

  /// 存储单个事件
  /// isUseAutoGenerateEventPageId 使用是否默认生成 eventIncomeId true是，false不是
  static Future<void> storeEvent(
    Event event, {
    String eventIncomeId = "",
    String? bizOrderId,
    String? orderId,
  }) async {
    final storage = LocalStorage();
    final userGid = storage.userGid;
    final deviceId = storage.deviceId;
    event.appStartId = await getAppStartId();
    event.eventCreateTime = (DateTime.now().millisecondsSinceEpoch / 1000.0)
        .toInt()
        .toString();

    event.userGid = userGid;
    event.deviceId = deviceId;

    if (bizOrderId.isNotEmptyOrNull) {
      event.moduleId = bizOrderId;
    } else if (orderId.isNotEmptyOrNull) {
      event.moduleId = orderId;
    }

    if (eventIncomeId.isNotEmptyOrNull) {
      event.eventIncomeId = eventIncomeId;
    } else if (eventIncomeId.isNotEmptyOrNull) {
      event.eventIncomeId = eventIncomeId;
    }
    // printDebugLog("$_TAG:${event.toString()}");
    final box = await _getEventBox();
    int index = await box.add(event);
    if (index > 0) {
      printDebugLog("$_TAG:index=$index,event=${event.toString()}");
    }
  }

  /// 存储多个事件
  static Future<void> storeEvents(List<Event> events) async {
    final box = await _getEventBox();
    await box.addAll(events);
  }

  /// 获取事件 Map（带空安全处理）
  static Future<Map<int, Event>> getEvents() async {
    final box = await _getEventBox();
    return Map<int, Event>.from(box.toMap());
  }

  /// 删除事件（批量原子操作）
  static Future<void> deleteEvents(List<int> keys) async {
    if (keys.isEmpty) return;
    final box = await _getEventBox();
    await box.deleteAll(keys);
  }

  // ==== 事件上传优化 ====
  static Future<void> batchUploadEvents({
    String? overrideToken,
    String? overrideUserGid,
    int uploadMode = 1, // 新增参数：1=过滤face事件 2=上传全部
  }) async {
    final storage = LocalStorage();
    final isLogin = storage.isLogin;
    if (!isLogin) {
      return;
    }
    final eventMap = await getEvents();
    debugLog("batchUploadEvents=${eventMap.toString()}");
    if (eventMap.isEmpty) return;

    // ==== 事件过滤逻辑 ====
    Map<int, Event> filteredMap = {};
    eventMap.forEach((key, event) {
      if (uploadMode == 1) {
        // 模式1：排除 face 事件
        if (event.eventAction != 'face') {
          filteredMap[key] = event;
        }
      } else if (uploadMode == 2) {
        // 模式2：包含所有事件
        filteredMap[key] = event;
      }
    });

    if (filteredMap.isEmpty) return;
    List<int> successKeys = filteredMap.keys.toList();
    final events = filteredMap.values.toList();

    Map<String, dynamic> map = HashMap();

    map['events'] = events;

    Map<String, dynamic> extraMap = HashMap();
    extraMap['overrideToken'] = overrideToken;
    extraMap['overrideUserGid'] = overrideUserGid;

    try {
      // 上传当前批次
      bool success = await Api.submitEvent(map, extra: extraMap);
      if (success) {
        if (uploadMode == 2) {
          //上传全部才清除faceGroupId
          await removeFaceGroupId();
        }
        // 删除所有成功上传的事件
        if (successKeys.isNotEmpty) {
          await deleteEvents(successKeys);
        }
      }
    } catch (e) {
      printDebugLog("$_TAG:Failed to upload batch : $e");
    }
  }


  ///授信模块行为埋点方法===============
  ///设置biz id
  static void setBizOrderId(String bizOrderId) async {
    final storage = LocalStorage();
    _bizOrderId = bizOrderId;
    printDebugLog("$_TAG:bizOrderId=$bizOrderId");
    await storage.set("${storage.userGid}-$_bizOrderIdKey", _bizOrderId!);
  }

  /// 获取_bizOrderId
  static Future<String> getBizOrderId() async {
    if (_bizOrderId != null) return _bizOrderId!;
    final storage = LocalStorage();
    _bizOrderId = storage.get("${storage.userGid}-$_bizOrderIdKey");
    return _bizOrderId ?? "";
  }

  static Future<void> storeCreditCheckEvent(
    Event event, {
    String? bizOrderId,
    String? orderId,
  }) async {
    String? bizOrderId = await getBizOrderId();
    return await storeCheckEvent(event, bizOrderId: bizOrderId);
  }


  ///------借款模块埋点方法

  ///设置orderGid
  static void setOrderId(String orderId) async {
    final storage = LocalStorage();
    _orderId = orderId;
    printDebugLog("$_TAG:orderId=$orderId");
    await storage.set("${storage.userGid}-$_orderIdKey", orderId);
  }

  /// 获取orderGid
  static Future<String> getOrderId() async {
    if (_orderId != null) return _orderId!;
    final storage = LocalStorage();
    _orderId = storage.get("${storage.userGid}-$_orderIdKey");
    return _orderId ?? "";
  }

  ///-------------人脸埋点方法
  //生成face  EventIncomeId
  static String generateFaceEventPageId() {
    faceEventIncomeId =
        "${EventIncomeIdPrefix.prefixCredit}${DateTime.now().millisecondsSinceEpoch}";
    return faceEventIncomeId ?? "";
  }

  static Future<void> storeFaceEvent(
    Event event,
    String? applyId, {
    String status = "0", // 默认值
  }) async {
    event.eventAction = EventAction.eventActionFace;

    event.eventParam?.applyId = applyId;
    event.eventParam?.faceGroupId = await getFaceGroupId();
    event.eventParam?.faceId = faceEventIncomeId ?? "";
    event.eventParam?.status = status.toString();
    //  debugPrint('$_TAG: storeFaceEvent storeEvent: ${event.toString()}');
    return await storeEvent(event, eventIncomeId: faceEventIncomeId ?? "");
  }

  /// 生成并缓存faceGroupId
  static Future<void> generateFaceGroupId() async {
    final storage = LocalStorage();
    faceGroupId = generateIdWithTimestamp();
    await storage.set("${storage.userGid}-$_faceGroupIdKey", faceGroupId!);
  }

  /// 获取faceGroupId
  static Future<String> getFaceGroupId() async {
    if (faceGroupId != null) return faceGroupId!;
    final storage = LocalStorage();
    faceGroupId = storage.get("${storage.userGid}-$_faceGroupIdKey");
    faceGroupId ??= generateIdWithTimestamp();
    return faceGroupId!;
  }

  ///清除faceGroupId
  static Future<bool> removeFaceGroupId() async {
    faceGroupId = null;
    final storage = LocalStorage();
    return storage.remove(_faceGroupIdKey);
  }

  ///修改 最新一条face的提交数据
  static Future<void> queryAndUpdateFaceData({
    String? newStatus,
    String? applyId,
  }) async {
    try {
      debugPrint('$_TAG: queryAndUpdateFaceData applyId: $applyId');
      final box = await _getEventBox();
      final storage = LocalStorage();
      String appStartId = await getAppStartId();
      String userGid = storage.userGid ?? "";
      String eventAction = EventAction.eventActionFace;
      String faceGroupId = await getFaceGroupId();

      /// 将keys转换为列表，然后反转顺序（从大到小）
      final keys = box.keys.toList().reversed;
      for (var key in keys) {
        final event = box.get(key);
        if (event == null) continue;

        if (event.appStartId == appStartId &&
            event.userGid == userGid &&
            event.eventAction == eventAction &&
            event.eventParam?.faceGroupId == faceGroupId) {
          // 更新状态
          event.eventParam?.status = newStatus;
          if (applyId.isNotEmptyOrNull) {
            event.eventParam?.applyId = applyId;
          }
          // 保存更新：使用 box.put(key,  event)
          await box.put(key, event);
          printDebugLog(
            '$_TAG: queryAndUpdateFaceData applyId: Updated Event:$key ${event.toString()}',
          );
          printDebugLog('Updated Event:$key ${event.toString()}');
          break; // 如果只需要更新第一个匹配项，则保留 break
        }
      }
    } catch (error) {
      debugPrint('$_TAG:Error queryAndUpdateFaceData event: $error');
    }
  }
}
