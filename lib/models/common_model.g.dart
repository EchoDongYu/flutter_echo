// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StepItem _$StepItemFromJson(Map<String, dynamic> json) => StepItem(
  key: (json['key'] as num).toInt(),
  value: json['value'] as String,
  type: json['type'] as String,
  sort: (json['sort'] as num).toInt(),
  l16h95: (json['l16h95'] as num).toInt(),
);

Map<String, dynamic> _$StepItemToJson(StepItem instance) => <String, dynamic>{
  'key': instance.key,
  'value': instance.value,
  'type': instance.type,
  'sort': instance.sort,
  'l16h95': instance.l16h95,
};
