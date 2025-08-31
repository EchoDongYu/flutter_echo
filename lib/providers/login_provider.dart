import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/services/api_service.dart';
import 'package:flutter_echo/services/storage_service.dart';

class LoginProvider extends BaseProvider {
  late CheckRegisterResp _checkRegisterResp;
  late String phoneNumber;
  bool? needCaptcha;

  int get codeType => _checkRegisterResp.qm5h5tOIsRegistered == true ? 1 : 7;

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

  void needCheckCaptcha() {
    launchRequest(() async {
      needCaptcha = await Api.needCheckCaptcha(
        mobile: phoneNumber,
        type: codeType,
      );
      if (needCaptcha != true) {
        Api.sendVerificationCode(
          mobile: phoneNumber,
          type: codeType.toString(),
        );
      }
    });
  }

  void checkCaptchaCode(String imageCode) {
    launchRequest(() async {
      await Api.checkCaptchaCode(
        mobile: phoneNumber,
        type: codeType,
        mobileSn: LocalStorage().deviceId,
        imageCode: imageCode,
      );
    });
  }
}
