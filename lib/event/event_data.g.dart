// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventAdapter extends TypeAdapter<Event> {
  @override
  final int typeId = 0;

  @override
  Event read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Event()
      ..appStartId = fields[0] as String?
      ..deviceId = fields[1] as String?
      ..userGid = fields[2] as String?
      ..moduleCode = fields[3] as String?
      ..moduleId = fields[4] as String?
      ..eventIncomeId = fields[5] as String?
      ..pageCode = fields[6] as String?
      ..eventAction = fields[7] as String?
      ..eventName = fields[8] as String?
      ..eventCreateTime = fields[9] as String?
      ..eventParam = fields[10] as EventParam?;
  }

  @override
  void write(BinaryWriter writer, Event obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.appStartId)
      ..writeByte(1)
      ..write(obj.deviceId)
      ..writeByte(2)
      ..write(obj.userGid)
      ..writeByte(3)
      ..write(obj.moduleCode)
      ..writeByte(4)
      ..write(obj.moduleId)
      ..writeByte(5)
      ..write(obj.eventIncomeId)
      ..writeByte(6)
      ..write(obj.pageCode)
      ..writeByte(7)
      ..write(obj.eventAction)
      ..writeByte(8)
      ..write(obj.eventName)
      ..writeByte(9)
      ..write(obj.eventCreateTime)
      ..writeByte(10)
      ..write(obj.eventParam);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EventParamAdapter extends TypeAdapter<EventParam> {
  @override
  final int typeId = 1;

  @override
  EventParam read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventParam()
      ..applyId = fields[0] as String?
      ..faceId = fields[1] as String?
      ..faceGroupId = fields[2] as String?
      ..status = fields[3] as String?
      ..actionMap = (fields[4] as Map?)?.cast<String, ActionData>();
  }

  @override
  void write(BinaryWriter writer, EventParam obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.applyId)
      ..writeByte(1)
      ..write(obj.faceId)
      ..writeByte(2)
      ..write(obj.faceGroupId)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.actionMap);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventParamAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ActionDataAdapter extends TypeAdapter<ActionData> {
  @override
  final int typeId = 2;

  @override
  ActionData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActionData()
      ..createTime = fields[0] as int?
      ..useTime = fields[1] as int?
      ..isFinish = fields[2] as bool?;
  }

  @override
  void write(BinaryWriter writer, ActionData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.createTime)
      ..writeByte(1)
      ..write(obj.useTime)
      ..writeByte(2)
      ..write(obj.isFinish);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActionDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event()
  ..appStartId = json['rendomizeLaunch'] as String?
  ..deviceId = json['encryptClient'] as String?
  ..userGid = json['raia'] as String?
  ..moduleCode = json['vectorModule'] as String?
  ..moduleId = json['proxyIndex'] as String?
  ..eventIncomeId = json['bufferInflow'] as String?
  ..pageCode = json['matrixLocation'] as String?
  ..eventAction = json['signalTrigger'] as String?
  ..eventName = json['maskLabel'] as String?
  ..eventCreateTime = json['epochMarker'] as String?
  ..eventParam = json['fragmentData'] == null
      ? null
      : EventParam.fromJson(json['fragmentData'] as Map<String, dynamic>);

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'rendomizeLaunch': instance.appStartId,
      'encryptClient': instance.deviceId,
      'raia': instance.userGid,
      'vectorModule': instance.moduleCode,
      'proxyIndex': instance.moduleId,
      'bufferInflow': instance.eventIncomeId,
      'matrixLocation': instance.pageCode,
      'signalTrigger': instance.eventAction,
      'maskLabel': instance.eventName,
      'epochMarker': instance.eventCreateTime,
      'fragmentData': instance.eventParam?.toJson(),
    };

EventParam _$EventParamFromJson(Map<String, dynamic> json) => EventParam()
  ..applyId = json['oj603u'] as String?
  ..faceId = json['v9q4m8'] as String?
  ..faceGroupId = json['d3n7w2'] as String?
  ..status = json['f1r9h5'] as String?
  ..actionMap = (json['arrayRegistry'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, ActionData.fromJson(e as Map<String, dynamic>)),
  );

Map<String, dynamic> _$EventParamToJson(EventParam instance) =>
    <String, dynamic>{
      'oj603u': instance.applyId,
      'v9q4m8': instance.faceId,
      'd3n7w2': instance.faceGroupId,
      'f1r9h5': instance.status,
      'arrayRegistry':
          instance.actionMap?.map((k, e) => MapEntry(k, e.toJson())),
    };

ActionData _$ActionDataFromJson(Map<String, dynamic> json) => ActionData()
  ..createTime = (json['statics'] as num?)?.toInt()
  ..useTime = (json['dmza48'] as num?)?.toInt()
  ..isFinish = json['terminalState'] as bool?;

Map<String, dynamic> _$ActionDataToJson(ActionData instance) =>
    <String, dynamic>{
      'statics': instance.createTime,
      'dmza48': instance.useTime,
      'terminalState': instance.isFinish,
    };
