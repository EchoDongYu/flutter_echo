
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_data.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(explicitToJson: true)
class Event {
  @HiveField(0)
  @JsonKey(name: 'rendomizeLaunch')
  String? appStartId;//跟踪id

  @HiveField(1)
  @JsonKey(name: 'encryptClient')
  String? deviceId;//deviceId

  @HiveField(2)
  @JsonKey(name: 'raia')
  String? userGid;//userGid

  @HiveField(3)
  @JsonKey(name: 'vectorModule')
  String? moduleCode;//

  @HiveField(4)
  @JsonKey(name: 'proxyIndex')
  String? moduleId;//授信Id or 借款Id

  @HiveField(5)
  @JsonKey(name: 'bufferInflow')
  String? eventIncomeId;//每次进入页面都重新生成一个 id

  @HiveField(6)
  @JsonKey(name: 'matrixLocation')
  String? pageCode;

  @HiveField(7)
  @JsonKey(name: 'signalTrigger')
  String? eventAction;

  @HiveField(8)
  @JsonKey(name: 'maskLabel')
  String? eventName;

  @HiveField(9)
  @JsonKey(name: 'epochMarker')
  String? eventCreateTime;//操作开始时间

  @HiveField(10)
  @JsonKey(name: 'fragmentData')
  EventParam? eventParam;

  Event();

  factory Event.fromJson(Map<String,  dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);

  @override
  String toString() => JsonEncoder.withIndent('  ').convert(toJson());
}

@HiveType(typeId: 1)
@JsonSerializable(explicitToJson: true)
class EventParam {
  @HiveField(0)
  @JsonKey(name: 'oj603u')
  String? applyId;

  @HiveField(1)
  @JsonKey(name: 'v9q4m8')
  String? faceId;

  @HiveField(2)
  @JsonKey(name: 'd3n7w2')
  String? faceGroupId;

  @HiveField(3)
  @JsonKey(name: 'f1r9h5')
  String? status;


  @HiveField(4)
  @JsonKey(name: 'arrayRegistry')
  Map<String, ActionData>? actionMap;

  EventParam();

  factory EventParam.fromJson(Map<String,  dynamic> json) => _$EventParamFromJson(json);
  Map<String, dynamic> toJson() => _$EventParamToJson(this);

  @override
  String toString() => JsonEncoder.withIndent('  ').convert(toJson());
}

@HiveType(typeId: 2)
@JsonSerializable()
class ActionData {
  @HiveField(0)
  @JsonKey(name: 'statics')
  int? createTime;

  @HiveField(1)
  @JsonKey(name: 'dmza48')
  int? useTime;

  @HiveField(2)
  @JsonKey(name: 'terminalState')
  bool? isFinish;

  ActionData();

  factory ActionData.fromJson(Map<String,  dynamic> json) => _$ActionDataFromJson(json);
  Map<String, dynamic> toJson() => _$ActionDataToJson(this);

  @override
  String toString() => JsonEncoder.withIndent('  ').convert(toJson());
}