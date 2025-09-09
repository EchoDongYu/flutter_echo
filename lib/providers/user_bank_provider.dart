import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/services/api_service.dart';

class UserBankModel extends BaseProvider {
  BankCardResp? _bankCardList;

  BankCardResp? get bankCardList => _bankCardList;

  Future<void> queryBankList() async {
    _bankCardList = await launchRequest(() => Api.queryBankCardList());
  }
}
