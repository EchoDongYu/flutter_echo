import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/services/api_service.dart';

class BillDetailModel extends BaseProvider {
  ///账单详情数据
  late BillDetailResp? _billDetailData;
  BillDetailResp? get billDetailData => _billDetailData;

  ///获取账单详情数据
  Future<void> fetchBillDetailData({int? loanGid}) async {
    var detailData = await launchRequest(() async {
      return await Api.getBillDetailInfo(loanGid: loanGid);
    });
    if (detailData != null) {
      _billDetailData = detailData;
    }
    notifyListeners();
  }
}