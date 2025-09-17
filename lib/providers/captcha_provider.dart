import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/services/api_service.dart';

class CaptchaModel extends BaseProvider {
  Future<bool?> checkCaptchaCode({
    required String? mobile,
    required int? type,
    required String? imageCode,
  }) async {
    return await launchRequest(
      () => Api.checkCaptchaCode(
        mobile: mobile,
        type: type,
        imageCode: imageCode,
      ),
      blockCodes: [],
    );
  }
}
