import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/services/api_service.dart';

class BankModel extends BaseProvider {
  /// 22 账户类型
  static const types = [22];
  static Map<String, List<StepItem>?>? _stepItems;
  BankVOResp? _bankList;

  BankVOResp? get bankList => _bankList;

  Future<void> queryBankList() async {
    _bankList = await launchRequest(() async {
      _stepItems = _stepItems?.isNotEmpty != true
          ? await Api.getDictionary(types.join(','))
          : _stepItems;
      return await Api.queryBankList();
    });
  }
}
