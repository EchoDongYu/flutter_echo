import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/services/api_service.dart';

class BankDictModel extends BaseProvider {
  /// 27 账户类型
  static const dictType = 27;
  static Map<String, List<StepItem>?>? _stepItems;

  Future<Map<String, List<StepItem>?>?> getDictionary() async {
    if (_stepItems?.isNotEmpty == true) return _stepItems;
    final apiResult = await Api.getDictionary(dictType.toString());
    _stepItems = apiResult;
    return apiResult;
  }
}
