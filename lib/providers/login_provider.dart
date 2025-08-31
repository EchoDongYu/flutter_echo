import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/services/api_service.dart';
import 'package:flutter_echo/services/storage_service.dart';

class LoginProvider extends BaseProvider {
  late CheckRegisterResp _checkRegister;
  late String phoneNumber;
  bool? needCaptcha;

  int get codeType => _checkRegister.qm5h5tOIsRegistered == true ? 1 : 7;

  void checkRegister(String mobile) async {
    phoneNumber = mobile;
    final apiResult = await launchRequest(Api.isRegister(mobile: mobile));
    if (apiResult != null) {
      _checkRegister = apiResult;
      if (_checkRegister.qm5h5tOIsRegistered == true &&
          _checkRegister.fm50w8OLoginPwd == true) {
        navigation(AppRouter.loginPassword);
      } else {
        navigation(AppRouter.loginCode);
      }
    }
  }

  void needCheckCaptcha() async {
    final api = Api.needCheckCaptcha(mobile: phoneNumber, type: codeType);
    needCaptcha = await launchRequest(api);
    notifyListeners();
  }

  Future<bool?> checkCaptchaCode(String imageCode) async {
    final api = Api.checkCaptchaCode(
      mobile: phoneNumber,
      type: codeType,
      mobileSn: LocalStorage().deviceId,
      imageCode: imageCode,
    );
    return await launchRequest(api);
  }
}
