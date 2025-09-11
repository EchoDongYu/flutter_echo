import 'dart:async';

import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/api_response.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/services/api_service.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:go_router/go_router.dart';

class LoginModel extends BaseProvider {
  CheckRegisterResp? _checkRegister;
  String? _phoneNumber;
  String? _verifyCode;
  String? _imageCode;
  String? _password;
  int? _dType;
  Timer? _timer;
  int _countdown = 0;
  int _loginStep = 0;

  int? get _codeType {
    final isRegistered = _checkRegister?.qm5h5tOIsRegistered;
    if (isRegistered == null) return null;
    return isRegistered ? 7 : 1;
  }

  String get phoneNumber => _phoneNumber ?? '';

  int get countdown => _countdown;

  void checkRegister(String mobile) async {
    _loginStep = 0;
    if (_countdown > 0 && _phoneNumber == mobile) {
      navigate((context) => context.push(AppRouter.loginCode));
      return;
    } else {
      _timer?.cancel();
      _timer = null;
      _countdown = 0;
    }
    _phoneNumber = mobile;
    final api = Api.isRegister(mobile: mobile);
    final apiResult = await launchRequest(() => api);
    if (apiResult != null) {
      _checkRegister = apiResult;
      if (_checkRegister?.qm5h5tOIsRegistered == true &&
          _checkRegister?.fm50w8OLoginPwd == true &&
          _checkRegister?.j1mnl2OExistLoginPwd == true) {
        // 已注册&密码登录&已设置密码
        navigate((context) => context.push(AppRouter.loginPassword));
      } else {
        navigate((context) => context.push(AppRouter.loginCode));
      }
    }
  }

  Future<bool?> sendVerifyCode() async {
    if (_countdown > 0) return true;
    return await launchRequest(() async {
      final need = await Api.needCheckCaptcha(
        mobile: _phoneNumber,
        type: _codeType,
      );
      if (need == true) {
        throw ApiResponse.needCaptchaError();
      } else {
        return await _sendVerifyCode();
      }
    });
  }

  void resendVerifyCode(int? method) async {
    _dType = method;
    await launchRequest(() => _sendVerifyCode());
  }

  Future<bool> _sendVerifyCode() async {
    final apiResult = await Api.sendVerificationCode(
      mobile: _phoneNumber,
      type: _codeType?.toString(),
      dType: _dType,
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

  Future<bool?> checkVerifyCode(String code) async {
    return await launchRequest(() async {
      _verifyCode = code;
      return await _checkVerifyCode();
    });
  }

  Future<bool> _checkVerifyCode() async {
    _loginStep = 1;
    final apiResult = await Api.checkVerificationCode(
      mobile: _phoneNumber,
      type: _codeType,
      verifyCode: _verifyCode,
      imageCode: _imageCode,
    );
    if (apiResult == true) {
      if (_checkRegister?.fm50w8OLoginPwd == true &&
          _checkRegister?.j1mnl2OExistLoginPwd == false) {
        // 密码登录&未设置密码
        pushReplacement(AppRouter.loginPwdSetup);
      } else {
        await _registerOrLogin();
      }
    }
    return apiResult;
  }

  void userLogin(String password, {String? confirmPassword}) async {
    if (confirmPassword != null && password != confirmPassword) {
      toast(msg: 'La contraseña introducida dos veces no coincide');
      return;
    }
    _password = password;
    await launchRequest(() => _registerOrLogin());
  }

  Future<void> _registerOrLogin() async {
    _loginStep = 2;
    LoginResp loginResult;
    if (_checkRegister?.qm5h5tOIsRegistered == true) {
      loginResult = await Api.loginUser(
        mobile: _phoneNumber,
        verifyCode: _verifyCode,
        imageCode: _imageCode,
        password: _password,
      );
    } else {
      loginResult = await Api.registerUser(
        mobile: _phoneNumber,
        verifyCode: _verifyCode,
        imageCode: _imageCode,
        password: _password,
        dType: _dType,
      );
    }
    await LocalStorage().userLogin(loginResult);
    navigate((context) => context.go(AppRouter.main));
  }

  @override
  void onCaptchaCode(String code) async {
    await launchRequest(() async {
      final apiResult = await Api.checkCaptchaCode(
        mobile: _phoneNumber,
        type: _codeType,
        imageCode: code,
      );
      if (apiResult == true) {
        _imageCode = code;
        if (_loginStep == 0) {
          await _sendVerifyCode();
        } else if (_loginStep == 1) {
          await _checkVerifyCode();
        } else if (_loginStep == 2) {
          await _registerOrLogin();
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
