// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DictItem _$DictItemFromJson(Map<String, dynamic> json) => DictItem(
  key: (json['key'] as num).toInt(),
  value: json['value'] as String,
  type: json['type'] as String?,
  sort: (json['sort'] as num?)?.toInt(),
  l16h95: (json['l16h95'] as num?)?.toInt(),
);

Map<String, dynamic> _$DictItemToJson(DictItem instance) => <String, dynamic>{
  'key': instance.key,
  'value': instance.value,
  'type': instance.type,
  'sort': instance.sort,
  'l16h95': instance.l16h95,
};

BankDictItem _$BankDictItemFromJson(Map<String, dynamic> json) => BankDictItem(
  key: (json['key'] as num).toInt(),
  value:
      (json['value'] as List<dynamic>)
          .map((e) => BankDictV0Item.fromJson(e as Map<String, dynamic>))
          .toList(),
  type: json['type'] as String?,
  sort: (json['sort'] as num?)?.toInt(),
  l16h95: (json['l16h95'] as num?)?.toInt(),
);

Map<String, dynamic> _$BankDictItemToJson(BankDictItem instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
      'type': instance.type,
      'sort': instance.sort,
      'l16h95': instance.l16h95,
    };

BankDictV0Item _$BankDictV0ItemFromJson(Map<String, dynamic> json) =>
    BankDictV0Item(
      exhedra: json['exhedra'] as String?,
      kd94z7: (json['kd94z7'] as num?)?.toInt(),
      yca98c: json['yca98c'] as String?,
      t1h91p: json['t1h91p'] as String?,
      m871v6: json['m871v6'] as String?,
      ruschuk: json['ruschuk'] as String?,
      k5j6q9: json['k5j6q9'] as String?,
    );

Map<String, dynamic> _$BankDictV0ItemToJson(BankDictV0Item instance) =>
    <String, dynamic>{
      'exhedra': instance.exhedra,
      'kd94z7': instance.kd94z7,
      'yca98c': instance.yca98c,
      't1h91p': instance.t1h91p,
      'm871v6': instance.m871v6,
      'ruschuk': instance.ruschuk,
      'k5j6q9': instance.k5j6q9,
    };
