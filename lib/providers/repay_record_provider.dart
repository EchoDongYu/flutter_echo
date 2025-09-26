import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/services/api_service.dart';

class RepayRecordModel extends BaseProvider {
  ///凭证记录
  RepayRecordResp? get recordList => _recordList;
  RepayRecordResp? _recordList;

  Future<void> queryRepaymentRecord(String? loanGid) async {
    launchRequest(() async {
      final req = RepayRecordReq(r5a4x8OLoanGid: loanGid);
      _recordList = await Api.queryRepaymentRecord(req);
    });
  }
}
