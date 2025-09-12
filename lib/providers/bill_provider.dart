import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/services/api_service.dart';

class BillModel extends BaseProvider {

  ///当前总应还金额
  double totalAmount = 0.0;

  ///账单列表数据
  List<BillListResp$SoberOBillList$Item>? billListData = [];

  ///获取账单列表数据
  Future<void> fetchBillListData() async {
    var data = await launchRequest(() async {
      return await Api.getBillListInfo();
    });
    billListData = data?.soberOBillList;
    totalAmount = data?.y934teOTotalAmount ?? 0.0;

    notifyListeners();
  }
}
