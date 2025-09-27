import 'dart:async';

import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/api_response.dart';
import 'package:flutter_echo/services/api_service.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:go_router/go_router.dart';

class VerifyModel extends BaseProvider {
  String get phoneNumber => _phoneNumber ?? '';
  String? _phoneNumber;

  bool? get needCaptcha => _needCaptcha;
  bool? _needCaptcha;

  int get countdown => _countdown;
  int _countdown = 0;

  bool get dialogOverlay => _dialogOverlay;
  bool _dialogOverlay = false;

  final int _codeType = 5;
  String? _imageCode;
  Timer? _timer;

  Future<bool?> sendVerifyCode() async {
    _phoneNumber = LocalStorage().realAccount;
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

  Future<bool?> checkVerifyCode({
    required String? verifyCode,
    String? imageCode,
  }) async {
    bool captchError = false;
    final apiResult = await launchRequest(
      () => Api.checkVerificationCode(
        mobile: _phoneNumber,
        type: _codeType,
        verifyCode: verifyCode,
        imageCode: needCaptcha == true ? imageCode : _imageCode,
      ),
      blockCodes: ApiResponse.captchaCodes,
      onBlockError: (resp) {
        resp.toastErrorMsg();
        _needCaptcha = true;
        captchError = true;
      },
    );
    if (captchError) return false;
    if (apiResult == true) navigate((context) => context.pop());
    return apiResult;
  }

  @override
  void onCaptcha(
    Future<String?> Function({required String? mobile, required int? type})
    showCaptchaDialog,
  ) async {
    _dialogOverlay = true;
    notifyListeners();
    _imageCode = await showCaptchaDialog(mobile: _phoneNumber, type: _codeType);
    _dialogOverlay = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
}
