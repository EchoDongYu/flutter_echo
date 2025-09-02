import 'dart:async';

import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/api_response.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/services/api_service.dart';
import 'package:flutter_echo/services/storage_service.dart';

class LoginProvider extends BaseProvider {
  late CheckRegisterResp _checkRegister;
  late String phoneNumber;
  late String verifyCode;
  String? imageCode;
  Timer? _timer;
  int countdown = 0;
  int loginStep = 0;

  int get codeType => _checkRegister.qm5h5tOIsRegistered == true ? 1 : 7;

  void checkRegister(String mobile) async {
    phoneNumber = mobile;
    final api = Api.isRegister(mobile: mobile);
    final apiResult = await launchRequest(() => api);
    if (apiResult != null) {
      _checkRegister = apiResult;
      if (_checkRegister.qm5h5tOIsRegistered == true &&
          _checkRegister.fm50w8OLoginPwd == true &&
          _checkRegister.j1mnl2OExistLoginPwd == true) {
        // 已注册&密码登录&已设置密码
        navigation(AppRouter.loginPassword);
      } else {
        navigation(AppRouter.loginCode);
      }
    }
  }

  Future<bool?> sendVerifyCode() async {
    return await launchRequest(() async {
      final need = await Api.needCheckCaptcha(
        mobile: phoneNumber,
        type: codeType,
      );
      if (need == true) {
        throw ApiResponse.needCaptchaError();
      } else {
        return await _sendVerificationCode();
      }
    });
  }

  void resendVerifyCode() async {
    await launchRequest(() => _sendVerificationCode());
  }

  Future<bool> _sendVerificationCode() async {
    final apiResult = await Api.sendVerificationCode(
      mobile: phoneNumber,
      type: codeType.toString(),
    );
    if (apiResult == true) {
      loginStep = 1;
      _startCountdown();
    }
    return apiResult;
  }

  /// 开始倒计时
  void _startCountdown() {
    _timer?.cancel();
    _timer = null;
    countdown = 60;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick == 60) {
        countdown = 0;
        _timer?.cancel();
        _timer = null;
      } else {
        countdown--;
      }
      notifyListeners();
    });
  }

  Future<bool?> checkVerifyCode(String code) async {
    return await launchRequest(() async {
      verifyCode = code;
      return await _checkVerificationCode();
    });
  }

  Future<bool> _checkVerificationCode() async {
    final apiResult = await Api.checkVerificationCode(
      mobile: phoneNumber,
      type: codeType,
      verifyCode: verifyCode,
      imageCode: imageCode,
    );
    if (apiResult == true) {
      if (_checkRegister.fm50w8OLoginPwd == true &&
          _checkRegister.j1mnl2OExistLoginPwd != true) {
        // 密码登录&未设置密码
        navigation(AppRouter.loginPwdSetup);
      } else if (_checkRegister.qm5h5tOIsRegistered == true) {
        // 注册
        final registerResult = await Api.registerUser(
          mobile: phoneNumber,
          verifyCode: verifyCode,
          imageCode: imageCode,
        );
      } else {
        // 登录
        final loginResult = await Api.loginUser(
          mobile: phoneNumber,
          verifyCode: verifyCode,
          imageCode: imageCode,
        );
      }
    }
    return apiResult;
  }

  @override
  void onCaptchaCode(String code) async {
    await launchRequest(() async {
      final apiResult = await Api.checkCaptchaCode(
        mobile: phoneNumber,
        type: codeType,
        mobileSn: LocalStorage().deviceId,
        imageCode: code,
      );
      if (apiResult == true) {
        imageCode = code;
        if (loginStep == 0) {
          await _sendVerificationCode();
        } else if (loginStep == 1) {
          await _checkVerificationCode();
        }
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
