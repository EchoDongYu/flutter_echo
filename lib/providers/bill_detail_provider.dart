import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/services/api_service.dart';

class BillDetailModel extends BaseProvider {
  ///账单详情数据
  BillDetailResp? get billDetailData => _billDetailData;
  BillDetailResp? _billDetailData;

  ///分期数据
  List<BillDetailResp$GlacisORepaymentPlanList$Item> get planList => _planList;
  List<BillDetailResp$GlacisORepaymentPlanList$Item> _planList = [];

  ///分期勾选
  List<bool?> get checkPlanList => _checkPlanList;
  List<bool?> _checkPlanList = [];

  ///渠道数据
  List<BillDetailResp$V08uw3ORepaymentChannelList$Item> get channelList =>
      _channelList;
  List<BillDetailResp$V08uw3ORepaymentChannelList$Item> _channelList = [];

  ///获取账单详情数据
  Future<void> fetchBillDetailData(String? id) async {
    final detailData = await launchRequest(() async {
      return await Api.getBillDetailInfo(id);
    });
    if (detailData != null) {
      _billDetailData = detailData;
      _planList = detailData.glacisORepaymentPlanList ?? [];
      if (_planList.isNotEmpty) {
        _checkPlanList = List.generate(_planList.length, (index) {
          return null;
        }, growable: false);
      }
      _channelList = detailData.v08uw3ORepaymentChannelList ?? [];
    }
    notifyListeners();
  }

  void checkPlan(int index) {
    if (index < _checkPlanList.length) {
      _checkPlanList[index] = _checkPlanList[index] != true;
      notifyListeners();
    }
  }
}
