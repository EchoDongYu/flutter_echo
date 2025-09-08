import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/services/api_service.dart';

class UserBankModel extends BaseProvider {
  BankVOResp? _bankList;

  /// 22 账户类型
  static const types = [22];
  static Map<String, List<StepItem>?>? _stepItems;

  BankVOResp? get bankList => _bankList;

  Future<void> queryBankList() async {
    _bankList = await launchRequest(() => Api.queryBankList());
  }

  Future<Map<String, List<StepItem>?>?> getDictionary() async {
    if (_stepItems?.isNotEmpty == true) return _stepItems;
    return await launchRequest(() async {
      final apiResult = await Api.getDictionary(types.join(','));
      _stepItems = apiResult;
      return apiResult;
    });
  }
}
