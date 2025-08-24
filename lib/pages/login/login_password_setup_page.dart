import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 设置登录密码页面
class LoginPasswordSetupPage extends StatefulWidget {
  const LoginPasswordSetupPage({super.key});

  @override
  State<LoginPasswordSetupPage> createState() => _LoginPasswordSetupPageState();
}

class _LoginPasswordSetupPageState extends State<LoginPasswordSetupPage> {
  final List<TextEditingController> _controller = [
    TextEditingController(),
    TextEditingController(),
  ];
  final List<bool> _obscureText = [true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          WidgetHelper.buildTopGradient(context: context, height: 55.h),
          SafeArea(
            child: Column(
              children: [
                EchoTopBar(),
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
      margin: EdgeInsets.only(top: 12.h),
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
            'Establezca una contraseña de 4 dígitos',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: NowColors.c0xFF1C1F23,
              height: 34 / 24,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Recordatorio: Te has registrado exitosamente.\nPor favor establezca una contraseña de 4 dígitos. Podrás iniciar sesión con tu contraseña más tarde.',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: NowColors.c0xFF77797B,
              height: 22 / 14,
            ),
          ),
          SizedBox(height: 32.h),
          _buildPasswordField('Contraseña de 4 dígitos', 0),
          SizedBox(height: 12.h),
          _buildPasswordField('Confirmar contraseña', 1),
          SizedBox(height: 32.h),
          EchoPrimaryButton(text: 'Iniciar sesión', onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildPasswordField(String hintText, int index) {
    final obscureText = _obscureText[index];
    return StepInputField(
      controller: _controller[index],
      hintText: hintText,
      maxLength: 4,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      obscureText: obscureText,
      suffix: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: InkWell(
          onTap: () => setState(() => _obscureText[index] = !obscureText),
          child: Image.asset(
            obscureText ? Drawable.iconEyeclose : Drawable.iconEyeopen,
            width: 20.r,
            height: 20.r,
          ),
        ),
      ),
    );
  }
}
