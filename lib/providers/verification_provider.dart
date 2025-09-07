import 'dart:async';

import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/services/api_service.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:go_router/go_router.dart';

class VerifyModel extends BaseProvider {
  String? _phoneNumber;
  Timer? _timer;
  bool? _needCaptcha;
  int _countdown = 0;

  final int _codeType = 5;

  int get countdown => _countdown;

  bool? get needCaptcha => _needCaptcha;

  String get phoneNumber => _phoneNumber ?? '';

  Future<bool?> sendVerifyCode() async {
    _phoneNumber = LocalStorage().account;
    return await launchRequest(() async {
      _needCaptcha = await Api.needCheckCaptcha(
        mobile: _phoneNumber,
        type: _codeType,
      );
      return await _sendVerifyCode();
    });
  }

  void resendVerifyCode() async {
    await launchRequest(() => _sendVerifyCode());
  }

  Future<bool> _sendVerifyCode() async {
    final apiResult = await Api.sendVerificationCode(
      mobile: _phoneNumber,
      type: _codeType.toString(),
    );
    if (apiResult == true) _startCountdown();
    return apiResult;
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

  void checkVerifyCode({required String? verifyCode, String? imageCode}) async {
    await launchRequest(() async {
      final imgCode = needCaptcha == true ? imageCode : null;
      final apiResult = await Api.checkVerificationCode(
        mobile: _phoneNumber,
        type: _codeType,
        verifyCode: verifyCode,
        imageCode: imgCode,
      );
      if (apiResult == true) {
        navigate((context) => context.pop());
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
}
