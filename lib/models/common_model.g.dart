// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StepItem _$StepItemFromJson(Map<String, dynamic> json) => StepItem(
  json['value'] as String,
  key: (json['key'] as num).toInt(),
  sort: (json['sort'] as num).toInt(),
  l16h95: (json['l16h95'] as num).toInt(),
);

Map<String, dynamic> _$StepItemToJson(StepItem instance) => <String, dynamic>{
  'key': instance.key,
  'value': instance.value,
  'sort': instance.sort,
  'l16h95': instance.l16h95,
};
