import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/pages/login/captcha_dialog.dart';
import 'package:flutter_echo/providers/login_provider.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// 登录-验证码输入页面
class LoginCodePage extends StatefulWidget {
  const LoginCodePage({super.key});

  @override
  State<LoginCodePage> createState() => _LoginCodePageState();
}

class _LoginCodePageState extends State<LoginCodePage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  // 倒计时相关
  Timer? _timer;
  int _countdown = 60;
  bool _canResend = false;

  // 验证码
  String _inputCode = '';

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onCodeChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final loginProvider = Provider.of<LoginProvider>(context, listen: false);
      loginProvider.needCheckCaptcha();
    });
    //_startCountdown();
    // 为隐藏输入框添加监听器
    //_controller.addListener(_onCodeChanged);
    // 页面加载完成后自动聚焦
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _focusNode.requestFocus();
    // });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  /// 开始倒计时
  void _startCountdown() {
    setState(() {
      _countdown = 60;
      _canResend = false;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() {
          _countdown--;
        });
      } else {
        setState(() {
          _canResend = true;
        });
        timer.cancel();
      }
    });
  }

  /// 验证码输入变化监听
  void _onCodeChanged() {
    final value = _controller.text;
    setState(() {
      _inputCode = value;
    });
    // 如果输入完整，自动验证
    if (value.length == 4) {
      FocusScope.of(context).unfocus();
      _verifyCode();
    }
  }

  /// 重新发送验证码
  void _resendCode() {
    if (!_canResend) return;
    // TODO: 实现重新发送验证码逻辑
    //debugPrint('重新发送验证码到: ${widget.phoneNumber}');
    _startCountdown();
    Fluttertoast.showToast(
      msg: 'Obtener código de verificación',
      gravity: ToastGravity.CENTER,
    );
  }

  /// 验证验证码
  void _verifyCode() {
    // TODO: 实现验证码验证逻辑
    debugPrint('验证码: $_inputCode');
    if (_inputCode == '1234') {
      // 验证成功，跳转到主页面
      context.go(AppRouter.main);
    } else {
      // 验证失败
      Fluttertoast.showToast(
        msg: 'Por favor ingrese correctamente el código de verificación',
        gravity: ToastGravity.CENTER,
      );
      Future.delayed(const Duration(milliseconds: 500), () {
        _controller.clear();
        setState(() {
          _inputCode = '';
        });
        // 清空后自动聚焦
        _focusNode.requestFocus();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, provider, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          if (provider.needCaptcha == true) {
            provider.needCaptcha = null;
            final code = await CaptchaDialog.show(context: context);
            if (code != null) provider.checkCaptchaCode(code);
          }
        });
        return child!;
      },
      child: _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          WidgetHelper.buildTopGradient(
            context: context,
            height: 265.h,
            child: Image.asset(
              Drawable.bgLoginTop,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                EchoTopBar(),
                // Logo区域
                Container(
                  width: 80.r,
                  height: 80.r,
                  margin: EdgeInsets.only(top: 28.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: NowColors.c0xFF3288F1,
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.all(
                      width: 3,
                      color: Colors.white,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Image.asset(Drawable.iconLogo),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: _buildContentCard(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建内容卡片
  Widget _buildContentCard() {
    return Container(
      margin: EdgeInsets.only(top: 36.h),
      padding: EdgeInsets.fromLTRB(16.w, 28.h, 16.w, 40.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: NowStyles.cardShadows,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ingresar OTP',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: NowColors.c0xFF1C1F23,
              height: 32 / 24,
            ),
          ),
          SizedBox(height: 12.h),
          Consumer<LoginProvider>(
            builder: (context, provider, _) {
              return RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 14.sp, height: 22 / 14),
                  children: [
                    const TextSpan(
                      text: 'El código se ha enviado a ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFF77797B,
                      ),
                    ),
                    TextSpan(
                      text: provider.phoneNumber,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFF1C1F23,
                      ),
                    ),
                    const TextSpan(
                      text: ' por SMS.',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFF77797B,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 32.h),
          // 验证码输入框
          _buildCodeField(),
          SizedBox(height: 32.h),
          // 重新发送按钮
          EchoPrimaryButton(
            text: _canResend
                ? 'Reenviar el código'
                : 'Reenviar (${_countdown}s)',
            onPressed: _canResend ? _resendCode : null,
          ),
        ],
      ),
    );
  }

  /// 构建验证码输入框 - 新的实现方式
  Widget _buildCodeField() {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildCodeDisplay(0),
            _buildCodeDisplay(1),
            _buildCodeDisplay(2),
            _buildCodeDisplay(3),
          ],
        ),
        Positioned.fill(
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            textInputAction: TextInputAction.done,
            maxLength: 8,
            maxLines: 1,
            showCursor: false,
            enableInteractiveSelection: false,
            style: const TextStyle(color: Colors.transparent),
            decoration: const InputDecoration(
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              counterText: '',
            ),
          ),
        ),
      ],
    );
  }

  /// 构建单个验证码显示框
  Widget _buildCodeDisplay(int index) {
    final hasValue = index < _inputCode.length;
    final value = hasValue ? _inputCode[index] : '';
    final isActive = index == _inputCode.length;

    return Container(
      width: 56.r,
      height: 56.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: hasValue
            ? NowColors.c0xFF3288F1
            : (isActive ? NowColors.c0xFFEFF7FF : Colors.white),
        borderRadius: const BorderRadius.all(Radius.circular(56)),
        border: hasValue
            ? null
            : Border.all(
                width: 1,
                color: isActive ? NowColors.c0xFF3288F1 : NowColors.c0xFF1C1F23,
              ),
      ),
      child: Text(
        value,
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          height: 28 / 24,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
