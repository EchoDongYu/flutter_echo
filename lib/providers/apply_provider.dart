import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/services/api_service.dart';

class ApplyModel extends BaseProvider {
  /// 13 借款目的
  static const dictType = 13;
  static Map<String, List<StepItem>?>? _stepItems;
  LoanPreInfoResp? _loanInfo;

  LoanPreInfoResp? get loanInfo => _loanInfo;

  Map<String, List<StepItem>?>? get stepItems => _stepItems;

  void getLoanPreInfo(int? productId, double? amount) async {
    await launchRequest(() async {
      _loanInfo = await Api.getLoanPreInfo(
        productId: productId,
        amount: amount,
      );
      _stepItems = await Api.getDictionary(dictType.toString());
    });
  }
}
