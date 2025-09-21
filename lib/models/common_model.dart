import 'package:json_annotation/json_annotation.dart';

part 'common_model.g.dart';

/// 通用数据模型二元组
class Pair<F, S> {
  final F first;
  final S second;

  const Pair(this.first, this.second);
}

/// 通用数据模型三元组
class Triple<F, S, T> {
  final F first;
  final S second;
  final T third;

  const Triple(this.first, this.second, this.third);
}

/// 字典项
@JsonSerializable()
class DictItem {
  final int key;
  final String value;
  final String? type;
  final int? sort;
  final int? l16h95; //o_updateTime

  const DictItem({
    required this.key,
    required this.value,
    required this.type,
    required this.sort,
    required this.l16h95,
  });

  factory DictItem.fromJson(Map<String, dynamic> json) =>
      _$DictItemFromJson(json);

  Map<String, dynamic> toJson() => _$DictItemToJson(this);
}

/// 银行直连线下还款银行字典
@JsonSerializable()
class BankDictItem {
  final int key;
  final List<BankDictV0Item> value;
  final String? type;
  final int? sort;
  final int? l16h95;

  const BankDictItem({
    required this.key,
    required this.value,
    required this.type,
    required this.sort,
    required this.l16h95,
  });

  factory BankDictItem.fromJson(Map<String, dynamic> json) =>
      _$BankDictItemFromJson(json);

  Map<String, dynamic> toJson() => _$BankDictItemToJson(this);
}

@JsonSerializable()
class BankDictV0Item {
  final String? exhedra;
  final int? kd94z7;
  final String? yca98c;
  final String? t1h91p;
  final String? m871v6;
  final String? ruschuk;
  final String? k5j6q9;

  const BankDictV0Item({
    required this.exhedra,
    required this.kd94z7,
    required this.yca98c,
    required this.t1h91p,
    required this.m871v6,
    required this.ruschuk,
    required this.k5j6q9,
  });

  factory BankDictV0Item.fromJson(Map<String, dynamic> json) =>
      _$BankDictV0ItemFromJson(json);

  Map<String, dynamic> toJson() => _$BankDictV0ItemToJson(this);
}
