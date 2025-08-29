import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/services/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginProvider extends BaseProvider {
  CheckRegisterResp? _checkRegisterResp;
  String? phoneNumber;

  Future<void> checkRegister(String mobile) async {
    phoneNumber = mobile;
    final jobCompleted = await launchRequest(() async {
      final apiResult = await Api.isRegister(mobile: mobile);
      _checkRegisterResp = apiResult;
    });
    final deviceChangeMsg = _checkRegisterResp?.assabODeviceChangeMsg;
    if (deviceChangeMsg != null) {
      Fluttertoast.showToast(msg: deviceChangeMsg);
    } else if (jobCompleted) {
      navigation(AppRouter.loginCode);
    }
  }
}
