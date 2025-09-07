import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/services/api_service.dart';

class ApplyModel extends BaseProvider {
  static const _types = [13];
  LoanPreInfoResp? _loanInfo;
  Map<String, List<StepItem>?>? _stepItems;

  LoanPreInfoResp? get loanInfo => _loanInfo;

  Map<String, List<StepItem>?>? get stepItems => _stepItems;

  void getLoanPreInfo(int? productId, double? amount) async {
    await launchRequest(() async {
      _loanInfo = await Api.getLoanPreInfo(
        productId: productId,
        amount: amount,
      );
      _stepItems = await Api.getDictionary(_types.join(','));
    });
  }
}
