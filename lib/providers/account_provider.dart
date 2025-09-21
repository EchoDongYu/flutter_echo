import 'dart:async';

import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/services/api_service.dart';
import 'package:flutter_echo/services/storage_service.dart';

class AccountModel extends BaseProvider {
  String? _imageCode;
  int? _codeType;
  String? _phoneNumber;
  Timer? _timer;
  int _countdown = 0;

  int get countdown => _countdown;

  void sendVerifyCode({required int type}) async {
    _phoneNumber = LocalStorage().realAccount;
    _codeType = type;
    final apiResult = await launchRequest(() {
      return Api.sendVerificationCode(
        mobile: _phoneNumber,
        type: _codeType?.toString(),
      );
    });
    if (apiResult == true) _startCountdown();
  }

  /// 开始倒计时
  void _startCountdown() {
    _timer?.cancel();
    _timer = null;
    _countdown = 60;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdown <= 0) {
        timer.cancel();
      } else {
        _countdown--;
        notifyListeners();
      }
    });
  }

  Future<bool?> resetLoginPassword({
    required String? password,
    required String? verifyCode,
  }) async {
    // _verifyCode = verifyCode;
    // _password = password;
    return await launchRequest(() async {
      return Api.resetLoginPassword(
        password: password,
        verifyCode: verifyCode,
        imageCode: _imageCode,
      );
    });
  }

  Future<bool?> resetTraderPassword({
    required String? password,
    required String? verifyCode,
    required String? cuiNumber,
  }) async {
    // _verifyCode = verifyCode;
    // _password = password;
    // _cuiNumber = cuiNumber;
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

  Future<bool?> setTraderPassword({required String? password}) async {
    // _password = password;
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

  Future<bool?> accountRemoval({
    required String? mobile,
    required String? verifyCode,
  }) async {
    return await launchRequest(() async {
      return Api.accountCancelApp(mobile: mobile, verifyCode: verifyCode);
    });
  }

  @override
  void onCaptcha(
    Future<String?> Function({required String? mobile, required int? type})
    showCaptchaDialog,
  ) async {
    _imageCode = await showCaptchaDialog(mobile: _phoneNumber, type: _codeType);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
}
