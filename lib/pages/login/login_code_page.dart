import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/format_utils.dart';
import 'package:flutter_echo/utils/resource_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

/// 登录验证码输入页面
class LoginCodePage extends StatefulWidget {
  /// 手机号码
  final String phoneNumber;

  const LoginCodePage({super.key, required this.phoneNumber});

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
    _startCountdown();
    // 为隐藏输入框添加监听器
    _controller.addListener(_onCodeChanged);
    // 页面加载完成后自动聚焦
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
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
    debugPrint('重新发送验证码到: ${widget.phoneNumber}');
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
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 308.h,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [NowColors.c0xFF3288F1, NowColors.c0xFF4FAAFF],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),
            child: Image.asset(R.drawable('login_top_bg')),
          ),
          SafeArea(
            child: Column(
              children: [
                EchoTopBar(),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 12.w),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Logo区域
                          Container(
                            width: 80.w,
                            height: 80.h,
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
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          // 内容区域
                          _buildContentCard(),
                        ],
                      ),
                    ),
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
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 14.sp, height: 22 / 14),
              children: [
                const TextSpan(
                  text:
                      'Hemos enviado un código de verificación a tu número de telefóno ',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: NowColors.c0xFF77797B,
                  ),
                ),
                TextSpan(
                  text: FormatUtils.blurPhone(widget.phoneNumber),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: NowColors.c0xFF1C1F23,
                  ),
                ),
                const TextSpan(
                  text: ' vía SMS',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: NowColors.c0xFF77797B,
                  ),
                ),
              ],
            ),
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
      width: 56.w,
      height: 56.w,
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
