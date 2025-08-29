import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/services/api_service.dart';

class LoginProvider extends BaseProvider {
  CheckRegisterResp? _checkRegisterResp;

  Future<void> nextStep({required String mobile}) async {
    final jobOk = await launchRequest(
      onRequest: () async {
        final apiResult = await Api.isRegister(mobile: mobile);
        _checkRegisterResp = apiResult;
      },
    );
    if (jobOk) {
      navRoute = '${AppRouter.loginCode}?${NavKey.phone}=$mobile';
    } else {
      navRoute = '${AppRouter.loginCode}?${NavKey.phone}=$mobile';
    }
  }
}
