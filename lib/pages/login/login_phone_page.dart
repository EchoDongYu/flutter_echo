import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/providers/login_provider.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

/// 登录-手机号输入页面
class LoginPhonePage extends StatefulWidget {
  const LoginPhonePage({super.key});

  @override
  State<LoginPhonePage> createState() => _LoginPhonePageState();
}

class _LoginPhonePageState extends State<LoginPhonePage> {
  final TextEditingController _controller = TextEditingController();
  bool _isPhoneValid = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onPhoneChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
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

  /// 下一步按钮点击
  // void _onNextPressed() {
  //   if (!_isPhoneValid) return;
  //   final phone = _controller.text;
  //   context.push('${AppRouter.loginCode}?${NavKey.phone}=$phone');
  // }

  @override
  Widget build(BuildContext context) {
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
                EchoTopBar(title: 'Iniciar sesión Registrarse'),
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
                    child: _buildContentCard(context),
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
  Widget _buildContentCard(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
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
          // 手机号输入框
          _buildPhoneField(),
          SizedBox(height: 32.h),
          EchoPrimaryButton(
            text: 'Siguiente',
            onPressed: _isPhoneValid
                ? () => loginProvider.checkRegister(_controller.text)
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneField() {
    return StepInputField(
      controller: _controller,
      hintText: 'Número de teléfono',
      maxLength: AppConst.phoneLength,
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
          '+${AppConst.countryCode}',
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
