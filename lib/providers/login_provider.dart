import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/services/api_service.dart';

class LoginProvider extends BaseProvider {
  late CheckRegisterResp _checkRegisterResp;
  late String phoneNumber;

  Future<void> checkRegister(String mobile) async {
    phoneNumber = mobile;
    final jobCompleted = await launchRequest(() async {
      final apiResult = await Api.isRegister(mobile: mobile);
      _checkRegisterResp = apiResult;
    });
    if (jobCompleted) {
      if (_checkRegisterResp.qm5h5tOIsRegistered == true &&
          _checkRegisterResp.fm50w8OLoginPwd == true) {
        navigation(AppRouter.loginPassword);
      } else {
        navigation(AppRouter.loginCode);
      }
    }
  }

  Future<void> needCheckCaptcha(int type) async {
    final jobCompleted = await launchRequest(() async {
      await Api.needCheckCaptcha(mobile: phoneNumber, type: type);
    });
    if (jobCompleted) {}
  }
}
