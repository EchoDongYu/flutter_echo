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
class StepItem {
  final int key;
  final String value;
  final int sort;
  final int l16h95; //o_updateTime

  const StepItem(
    this.value, {
    required this.key,
    required this.sort,
    required this.l16h95,
  });

  factory StepItem.fromJson(Map<String, dynamic> json) =>
      _$StepItemFromJson(json);

  Map<String, dynamic> toJson() => _$StepItemToJson(this);
}
