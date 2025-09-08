import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/services/api_service.dart';

class UserBankModel extends BaseProvider {
  MyBankCardResp? _myBankCardList;

  MyBankCardResp? get myBankCardList => _myBankCardList;

  Future<void> queryBankList() async {
    _myBankCardList = await launchRequest(() => Api.queryMyBankCardList());
  }
}
