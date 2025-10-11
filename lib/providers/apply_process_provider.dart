import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/services/api_service.dart';

class ApplyProcessModel extends BaseProvider {
  //查询是否需要好评弹框
  Future<CheckFirstLoanResp?> queryFirstLoan() async {

    final data = await launchRequest(() async {
      return await Api.queryFirstLoan();
    });
    return data;
  }
}
