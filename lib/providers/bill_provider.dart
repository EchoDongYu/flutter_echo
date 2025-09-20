import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/services/api_service.dart';

class BillModel extends BaseProvider {
  ///总待还金额
  double? get totalAmount => _totalAmount;
  double? _totalAmount;

  ///借款历史列表
  List<LoanBillResp$Ouxtd3OLoanList$Item>? get historyList => _historyList;
  List<LoanBillResp$Ouxtd3OLoanList$Item>? _historyList;

  ///获取借款历史列表
  Future<void> fetchBillListData() async {
    final billData = await launchRequest(() async {
      return await Api.getBillList();
    });
    if (billData != null) {
      _historyList = billData.ouxtd3OLoanList;
      _totalAmount = billData.y934teOTotalAmount ?? 0.0;
    }
    notifyListeners();
  }
}
