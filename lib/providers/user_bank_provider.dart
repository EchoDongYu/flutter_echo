import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/providers/bank_dict_provider.dart';
import 'package:flutter_echo/services/api_service.dart';

class UserBankModel extends BankDictModel {
  BankCardResp? _bankCardList;
  static List<DictItem>? _stepItems;

  BankCardResp? get bankCardList => _bankCardList;

  List<DictItem>? get stepItems => _stepItems;

  void queryBankCardList() {
    launchRequest(() async {
      _bankCardList = await Api.queryBankCardList();
      _stepItems = await getDictionary();
    });
  }

  void deleteBank(String? id) {
    launchRequest(() async {
      final deleteOk = await Api.deleteBankCard(id);
      if (deleteOk) _bankCardList = await Api.queryBankCardList();
    });
  }
}
