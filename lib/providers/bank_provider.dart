import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/providers/bank_dict_provider.dart';
import 'package:flutter_echo/services/api_service.dart';
import 'package:flutter_echo/services/storage_service.dart';

class BankModel extends BankDictModel {
  String? cuiNumber;

  Future<Pair<BankVOResp?, List<DictItem>?>?> queryBankList() async {
    return await launchRequest(() async {
      cuiNumber = LocalStorage().userInfo?.merdekaOIdCard;
      if (cuiNumber?.isNotEmpty != true) {
        final userInfo = await Api.getUserBaseInfo();
        cuiNumber = userInfo.merdekaOIdCard;
      }
      final bankList = await Api.queryBankList();
      final stepItems = await getDictionary();
      return Pair(bankList, stepItems);
    });
  }

  Future<BindCardResp?> submitBank({
    required BankVOResp$Item? bank,
    required int? type,
    required List<String> inputs,
  }) async {
    final data = BindCardReq(
      exonymOBankGid: bank?.exonymOBankGid,
      t1h91pOBankName: bank?.t1h91pOBankName,
      insolentOBankCode: bank?.insolentOBankCode,
      zebrineOCardNo: inputs[0],
      exhedraOAccountType: type,
    );
    return await launchRequest(() => Api.bindBankCard(data));
  }
}
