import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/services/api_service.dart';
import 'package:flutter_echo/services/storage_service.dart';

class PasswordModel extends BaseProvider {
  String? _imageCode;
  int? _codeType;

  Future<bool?> resetLoginPassword({
    required String password,
    required String verifyCode,
  }) async {
    return await launchRequest(() async {
      return Api.resetLoginPassword(
        password: password,
        verifyCode: verifyCode,
        imageCode: _imageCode,
      );
    });
  }

  Future<bool?> resetTraderPassword({
    required String password,
    required String verifyCode,
    required String cuiNumber,
  }) async {
    return await launchRequest(() async {
      return Api.resetTraderPassword(
        type: '1',
        password: password,
        verifyCode: verifyCode,
        imageCode: _imageCode,
        idCard: cuiNumber,
      );
    });
  }

  Future<bool?> setTraderPassword({required String password}) async {
    return await launchRequest(() async {
      return Api.resetTraderPassword(
        type: '0',
        password: password,
        imageCode: _imageCode,
      );
    });
  }

  Future<bool?> checkTraderPassword({
    required String password,
    required String? orderId,
  }) async {
    return await launchRequest(() async {
      return Api.checkTraderPassword(password: password, orderId: orderId);
    });
  }

  @override
  void onCaptchaCode(String code) async {
    await launchRequest(() async {
      final apiResult = await Api.checkCaptchaCode(
        mobile: LocalStorage().account,
        type: _codeType,
        imageCode: code,
      );
      if (apiResult == true) {
        _imageCode = code;
      }
    });
  }
}
