import 'package:json_annotation/json_annotation.dart';

part 'common_model.g.dart';

/// 通用数据模型二元组
class Pair<F, S> {
  final F first;
  final S second;

  const Pair({required this.first, required this.second});
}

/// 通用数据模型三元组
class Triple<F, S, T> {
  final F first;
  final S second;
  final T third;

  const Triple({
    required this.first,
    required this.second,
    required this.third,
  });
}

/// 字典项
@JsonSerializable()
class StepItem {
  final int key;
  final String value;
  final String type;
  final int sort;
  final int l16h95; //o_updateTime

  StepItem({
    required this.key,
    required this.value,
    required this.type,
    required this.sort,
    required this.l16h95,
  });

  factory StepItem.fromJson(Map<String, dynamic> json) =>
      _$StepItemFromJson(json);

  Map<String, dynamic> toJson() => _$StepItemToJson(this);
}
