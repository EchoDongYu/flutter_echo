import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/services/api_service.dart';

class BillModel extends BaseProvider {

  ///当前总应还金额
  double _totalAmount = 0.0;
  double get totalAmount => _totalAmount;

  ///账单列表数据
  List<BillListResp$SoberOBillList$Item>? _billListData = [];
  List<BillListResp$SoberOBillList$Item>? get billListData => _billListData;

  ///获取账单列表数据
  Future<void> fetchBillListData() async {
    var billData = await launchRequest(() async {
      return await Api.getBillListInfo();
    });
    if (billData != null) {
      _billListData = billData.soberOBillList;
      _totalAmount = billData.y934teOTotalAmount ?? 0.0;
    }
    notifyListeners();
  }
}
