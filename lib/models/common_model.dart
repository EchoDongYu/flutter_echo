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
