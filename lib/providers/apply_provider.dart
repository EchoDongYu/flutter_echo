import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/services/api_service.dart';
import 'package:go_router/go_router.dart';

class ApplyModel extends BaseProvider {
  /// 13 借款目的
  static const dictType = 13;
  static Map<String, List<StepItem>?>? _stepItems;
  LoanPreInfoResp? _loanInfo;

  LoanPreInfoResp? get loanInfo => _loanInfo;

  Future<Map<String, List<StepItem>?>?> getLoanPreInfo(
    int? productId,
    double? amount,
  ) async {
    return await launchRequest(() async {
      _loanInfo = await Api.getLoanPreInfo(
        productId: productId,
        amount: amount,
      );
      if (_stepItems?.isNotEmpty == true) return _stepItems;
      final apiResult = await Api.getDictionary(dictType.toString());
      _stepItems = apiResult;
      return apiResult;
    });
  }

  void confirmLoan({
    required BankCardResp$Item? bank,
    required int? purpose,
    required String? password,
  }) async {
    final data = LoanConfirmReq(
      z38e62OOrderGid: _loanInfo?.z38e62OOrderGid,
      retiaryOLoanAmount: _loanInfo?.retiaryOLoanAmount,
      foreyardOProductId: _loanInfo?.foreyardOProductId,
      vnbh46OBankCardGid: bank?.vnbh46OBankCardGid,
      zebrineOCardNo: bank?.zebrineOCardNo,
      t1h91pOBankName: bank?.t1h91pOBankName,
      insolentOBankCode: bank?.insolentOBankCode,
      brantOPurpose: purpose,
      c4s47hOTransPassword: password,
    );
    final apiResult = await launchRequest(() => Api.confirmLoan(data));
    switch (apiResult?.suffOLoanStatus) {
      case 0:
        pushReplacement(AppRouter.applyProcess);
      case 1:
        navigate((context) => context.go(AppRouter.main));
      case 2:
        pushReplacement(AppRouter.applyFailed);
    }
  }
}
