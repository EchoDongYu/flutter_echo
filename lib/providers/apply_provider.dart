import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/services/api_service.dart';
import 'package:flutter_echo/services/appsflyer_service.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:go_router/go_router.dart';

class ApplyModel extends BaseProvider {
  /// 13 借款目的
  static const _dictType = '13';
  static List<DictItem>? _stepItems;
  LoanPreInfoResp? _loanInfo;

  LoanPreInfoResp? get loanInfo => _loanInfo;

  Future<List<DictItem>?> getLoanPreInfo(int? id, double? amount) async {
    final a= await launchRequest(() async {
      _loanInfo = await Api.getLoanPreInfo(productId: id, amount: amount);

      if (_stepItems?.isNotEmpty == true) return _stepItems;
      final apiResult = await Api.getDictionary(_dictType);
      _stepItems = apiResult[_dictType];
      return _stepItems;
    });
  //  commonReport();
    return a;
  }

  // Future<void> commonReport() async{
  //   debugLog('commonReportResult:start');
  //   if (_loanInfo?.firstCreditReportOFirstCreditSuccessReport == true) {
  //       //todo 上报首次授信成功事件
  //       Future<bool?> commonReportResult = Api.commonReport('0');
  //       // 使用 then() 处理结果
  //       commonReportResult
  //           .then((bool? result) {
  //             debugLog('commonReportResult:$result');
  //             if (result == true) {
  //               // 处理返回值
  //               AppsflyerService().logEvent(
  //                 AppsFlyerEvents.afFirstCreditSuccess,
  //               );
  //             }
  //           })
  //           .catchError((error) {
  //             // 错误处理
  //             debugLog('commonReportResult:$error');
  //           });
  //
  //   }
  //   debugLog('commonReportResult:next');
  // }

  void confirmLoan({
    required BankCardResp$Item? bank,
    required int? purpose,
    required String? password,
  }) async {
    final data = LoanConfirmReq(
      z38e62OOrderGid: _loanInfo?.z38e62OOrderGid,
      retiaryOLoanAmount: _loanInfo?.retiaryOLoanAmount,
      foreyardOProductId: _loanInfo?.foreyardOProductId,
      vnbh46OBankCardGid: bank?.vnbh46OBankCardGid,
      zebrineOCardNo: bank?.zebrineOCardNo,
      t1h91pOBankName: bank?.t1h91pOBankName,
      insolentOBankCode: bank?.insolentOBankCode,
      brantOPurpose: purpose,
      c4s47hOTransPassword: password,
    );
    final apiResult = await launchRequest(() => Api.confirmLoan(data));
    // if (apiResult?.u04098IsFirstLoan == true) {
    //   if (apiResult?.suffOLoanStatus == 0 || apiResult?.suffOLoanStatus == 1) {
    //     //todo 上报是否首次借款成功事件
    //     Future<bool?> commonReportResult = Api.commonReport('1');
    //     // 使用 then() 处理结果
    //     commonReportResult
    //         .then((bool? result) {
    //           debugLog('commonReportResult:$result');
    //           if (result == true) {
    //             // 处理返回值
    //             AppsflyerService().logEvent(AppsFlyerEvents.afFirstLoan);
    //           }
    //         })
    //         .catchError((error) {
    //           // 错误处理
    //           debugLog('commonReportResult:$error');
    //         });
    //   }
    // }
    switch (apiResult?.suffOLoanStatus) {
      case 0:
        pushReplacement(AppRouter.applyProcess);
        break;
      case 1:
        navigate((context) => context.go(AppRouter.main));
        break;
      case 2:
        pushReplacement(AppRouter.applyFailed);
        break;
    }
  }
}
