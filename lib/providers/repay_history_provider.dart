import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/services/api_service.dart';

class RepayHistoryModel extends BaseProvider {
  ///还款历史列表
  List<BillRepayResp$My4dd2ORepaymentList$Item>? get historyList =>
      _historyList;
  List<BillRepayResp$My4dd2ORepaymentList$Item>? _historyList;

  ///获取还款历史列表
  Future<void> fetchRepayListData() async {
    final billData = await launchRequest(() async {
      return await Api.getRepayList();
    });
    if (billData != null) _historyList = billData.my4dd2ORepaymentList;
    notifyListeners();
  }
}
