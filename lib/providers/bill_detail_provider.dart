import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/providers/whatsapp_provider.dart';
import 'package:flutter_echo/services/api_service.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:go_router/go_router.dart';

class BillDetailModel extends WhatsappModel {
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

  ///渠道数据
  List<BillDetailResp$V08uw3ORepaymentChannelList$Item> get channelList =>
      _channelList;
  List<BillDetailResp$V08uw3ORepaymentChannelList$Item> _channelList = [];

  ///渠道勾选
  BillDetailResp$V08uw3ORepaymentChannelList$Item? selectedChannel;
  double? selectedValue;

  ///银行直连线下还款银行字典
  List<BankDictV0Item> get bankDictItems => _bankDictItems ?? [];
  List<BankDictV0Item>? _bankDictItems;

  ///选择银行
  BankDictV0Item? get selectedBank => _selectedBank;
  BankDictV0Item? _selectedBank;

  ///凭证图片
  Uint8List? get certPhoto => _certPhoto;
  Uint8List? _certPhoto;

  String? get loanGid => _loanGid;
  String? _loanGid;

  ///凭证记录
  RepayRecordResp? get recordList => _recordList;
  RepayRecordResp? _recordList;

  ///获取账单详情数据
  void fetchBillDetailData(String? loanGid) async {
    _loanGid = loanGid;
    final detailData = await launchRequest(() async {
      return await Api.getBillDetailInfo(loanGid);
    });
    if (detailData != null) {
      _billDetailData = detailData;
      _planList = detailData.glacisORepaymentPlanList ?? [];
      if (_planList.isNotEmpty) {
        _checkPlanList = List.generate(_planList.length, (index) {
          return _planList[index].i2jk5fOPeriodStatus != 3;
        }, growable: false);
      }
      _channelList = detailData.v08uw3ORepaymentChannelList ?? [];
      selectedChannel = _channelList.firstOrNull;
      final channelRate = selectedChannel?.kd94z7OChannelRate ?? 0;
      final totalValue = totalAmount ?? 0;
      selectedValue = totalValue + (totalValue * channelRate).truncate();
    }
    notifyListeners();
  }

  void selectPlan(int index) {
    if (index < _checkPlanList.length) {
      final uncheck = _checkPlanList[index] != true;
      if (uncheck) {
        for (int i = 0; i <= index; i++) {
          // 结清不能勾选
          _checkPlanList[i] = _planList[i].i2jk5fOPeriodStatus != 3;
        }
      } else {
        for (int i = index; i < _checkPlanList.length; i++) {
          // 逾期不能取消勾选
          _checkPlanList[i] = _planList[i].i2jk5fOPeriodStatus == 2;
        }
      }
      final channelRate = selectedChannel?.kd94z7OChannelRate ?? 0;
      final totalValue = totalAmount ?? 0;
      selectedValue = totalValue + (totalValue * channelRate).truncate();
      notifyListeners();
    }
  }

  void selectChannel(BillDetailResp$V08uw3ORepaymentChannelList$Item channel) {
    selectedChannel = channel;
    notifyListeners();
  }

  Future<void> getBankDictionary() async {
    await launchRequest(() async {
      _bankDictItems = await Api.getBankDictionary();
    });
  }

  void selectBankDict(BankDictV0Item? value) {
    _selectedBank = value;
    notifyListeners();
  }

  void confimPhoto(Uint8List? photo) {
    _certPhoto = photo;
    notifyListeners();
  }

  Future<String?> base64Str() async {
    final data = certPhoto;
    if (data == null) return null;
    final compressData = await FlutterImageCompress.compressWithList(
      data,
      minHeight: 1920,
      minWidth: 1080,
      quality: 96,
    );
    return base64Encode(compressData);
  }

  RepayApplyReq _createRepayApplyReq(double inputAmount) {
    final channelRate = selectedChannel?.kd94z7OChannelRate ?? 0;
    final totalValue = totalAmount ?? 0;
    final channelFee = min(totalValue, inputAmount) * channelRate;
    final channelFeeTru = channelFee.truncateToDouble();
    return RepayApplyReq(
      r5a4x8OLoanGid: _loanGid,
      o12sd0OAmount: inputAmount - channelFeeTru,
      g3x614ORepaymentFee: channelFeeTru,
      hm7756OCheckLoanLeftAmount: totalValue,
      bdvg46ORepaymentStage: 0,
      percherOJumpSourceType: 1,
      mahoganyORepaymentType: selectedChannel?.y28nd4OChannelType,
      oe5u39OChannelName: selectedChannel?.oe5u39OChannelName,
      worstOChannelCode: selectedChannel?.worstOChannelCode,
      // y28nd4OChannelType: selectedChannel?.y28nd4OChannelType?.toString(),
      k5j6q9OChannelAccount: selectedChannel?.k5j6q9OChannelAccount,
      fratOMark: selectedChannel?.fratOMark,
    );
  }

  Future<void> applyRepayH5(double inputAmount) async {
    final apiResult = await launchRequest(() async {
      return await Api.applyRepay(_createRepayApplyReq(inputAmount));
    });
    final url = apiResult?.parquetORedirectUrl;
    if (url != null) {
      final uriH5Repay = Uri(
        path: AppRouter.appWeb,
        queryParameters: {NavKey.title: '', NavKey.url: url},
      );
      navigate((context) => context.pushReplacement(uriH5Repay.toString()));
    }
  }

  Future<void> applyRepay({
    required List<String> inputs,
    required BankDictV0Item? bank,
    required int? date,
  }) async {
    final apiResult = await launchRequest(() async {
      final inputAmount = inputs[1].tryParseDouble ?? 0;
      final base64 = await base64Str();
      final req = _createRepayApplyReq(inputAmount).copyWith(
        t1h91pOBankName: bank?.t1h91p,
        wtpuztORepaymentTime: date,
        e77490ORequestId: inputs[0],
        lz09kpOUserName: inputs[2],
        x01y7qOBase64String: base64,
      );
      return await Api.applyRepay(req);
    });
    if (apiResult != null) {
      navigate((context) => context.go(AppRouter.repayProcess));
    }
  }
}
