import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/services/api_service.dart';

class BankDictModel extends BaseProvider {
  /// 27 账户类型
  static const _dictType = '27';
  static List<DictItem>? _stepItems;

  Future<List<DictItem>?> getDictionary() async {
    if (_stepItems?.isNotEmpty == true) return _stepItems;
    final apiResult = await Api.getDictionary(_dictType);
    _stepItems = apiResult[_dictType];
    return _stepItems;
  }
}
