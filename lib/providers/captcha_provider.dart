import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/api_response.dart';
import 'package:flutter_echo/services/api_service.dart';

class CaptchaModel extends BaseProvider {
  Future<bool?> checkCaptchaCode({
    required String? mobile,
    required int? type,
    required String? imageCode,
  }) async {
    bool captchError = false;
    final apiResult = await launchRequest(
      () => Api.checkCaptchaCode(
        mobile: mobile,
        type: type,
        imageCode: imageCode,
      ),
      blockCodes: ApiResponse.captchaCodes,
      onBlockError: (resp) {
        resp.toastErrorMsg();
        captchError = resp.needCaptcha;
      },
    );
    if (captchError) return false;
    return apiResult;
  }
}
