import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/resource_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// 登录手机号输入页面
class LoginPhonePage extends StatefulWidget {
  const LoginPhonePage({super.key});

  @override
  State<LoginPhonePage> createState() => _LoginPhonePageState();
}

class _LoginPhonePageState extends State<LoginPhonePage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isPhoneValid = false;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onPhoneChanged);
    _controller.addListener(_onFocusChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  /// 手机号输入变化监听
  void _onPhoneChanged() {
    final phoneValid = _controller.text.length == 8;
    if (_isPhoneValid != phoneValid) {
      setState(() {
        _isPhoneValid = phoneValid;
      });
    }
  }

  /// 焦点变化监听
  void _onFocusChanged() {
    final expanded = _controller.text.isNotEmpty || _focusNode.hasFocus;
    if (_isExpanded != expanded) {
      setState(() {
        _isExpanded = expanded;
      });
    }
  }

  /// 下一步按钮点击
  void _onNextPressed() {
    if (!_isPhoneValid) return;
    final phone = _controller.text;
    context.push('${AppRouter.loginCode}?${NavKey.phone}=$phone');
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
                EchoTopBar(title: 'Iniciar sesión Registrarse'),
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
        children: [
          Text(
            'Utilice su número de teléfono para registrarse/ entrar',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: NowColors.c0xFF1C1F23,
              height: 30 / 20,
            ),
          ),
          SizedBox(height: 32.h),
          // 手机号输入框
          _buildPhoneField(),
          SizedBox(height: 32.h),
          // 发送按钮
          EchoPrimaryButton(
            text: 'Iniciar sesión',
            onPressed: _isPhoneValid ? _onNextPressed : null,
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneField() {
    return StepInputField(
      controller: _controller,
      hintText: 'Número de teléfono',
      maxLength: AppConstants.phoneLength,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      showCounter: true,
      prefix: Container(
        margin: EdgeInsets.only(right: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: NowColors.c0xFFEFF7FF,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: NowColors.c0xFF3288F1, width: 0.5),
        ),
        child: Text(
          '+502',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: NowColors.c0xFF3288F1,
            height: 14 / 12,
          ),
        ),
      ),
    );
  }
}
