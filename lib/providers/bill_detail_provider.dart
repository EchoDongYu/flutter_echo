import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/common_model.dart';
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

  ///总待还金额
  double? get totalAmount {
    if (_checkPlanList.every((v) => v != true)) {
      return _billDetailData?.wantonlyOLoanLeftAmount;
    }
    var amount = 0.0;
    for (int i = 0; i < _checkPlanList.length; i++) {
      if (_checkPlanList[i] == true) {
        amount += _planList[i].wantonlyOLoanLeftAmount ?? 0;
      }
    }
    return amount;
  }

  ///业务费用
  double? get businessFee {
    if (_checkPlanList.every((v) => v != true)) {
      return _billDetailData?.spriteOBusinessFee;
    }
    var amount = 0.0;
    for (int i = 0; i < _checkPlanList.length; i++) {
      if (_checkPlanList[i] == true) {
        amount += _planList[i].spriteOBusinessFee ?? 0;
      }
    }
    return amount;
  }

  ///渠道数据
  List<BillDetailResp$V08uw3ORepaymentChannelList$Item> get channelList =>
      _channelList;
  List<BillDetailResp$V08uw3ORepaymentChannelList$Item> _channelList = [];

  ///渠道勾选
  BillDetailResp$V08uw3ORepaymentChannelList$Item? selectedChannel;

  ///确认金额
  double? _confirmValue;

  ///选择银行
  BankDictV0Item? _selectedBankItem;

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
      selectedChannel = _channelList.firstOrNull;
    }
    notifyListeners();
  }

  void selectPlan(int index) {
    if (index < _checkPlanList.length) {
      _checkPlanList[index] = _checkPlanList[index] != true;
      notifyListeners();
    }
  }

  void selectChannel(BillDetailResp$V08uw3ORepaymentChannelList$Item channel) {
    selectedChannel = channel;
    notifyListeners();
  }

  void confirmAmount(double value) {
    _confirmValue = value;
  }

  Future<List<BankDictV0Item>?> getBankDictionary() async {
    return await launchRequest(() async {
      return await Api.getBankDictionary();
    });
  }

  void selectBankDict(BankDictV0Item value) {
    _selectedBankItem = value;
  }
}
