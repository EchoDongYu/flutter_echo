import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/providers/login_provider.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

/// 登录-密码输入页面
class LoginPasswordPage extends StatefulWidget {
  const LoginPasswordPage({super.key});

  @override
  State<LoginPasswordPage> createState() => _LoginPasswordPageState();
}

class _LoginPasswordPageState extends State<LoginPasswordPage> {
  final TextEditingController _controller = TextEditingController();
  bool _obscureText = true;
  bool _isPasswordValid = false;

  LoginModel get loginModel => Provider.of<LoginModel>(context, listen: false);

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPasswordChanged() {
    final passwordValid = _controller.text.isNotEmpty;
    if (_isPasswordValid != passwordValid) {
      setState(() => _isPasswordValid = passwordValid);
    }
  }

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
            'Ingrese la contraseña para iniciar sesión',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: NowColors.c0xFF1C1F23,
              height: 34 / 24,
            ),
          ),
          SizedBox(height: 12.h),
          Consumer<LoginModel>(
            builder: (context, provider, _) {
              return RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 14.sp, height: 22 / 14),
                  children: [
                    const TextSpan(
                      text: 'Ingrese el número de teléfono móvil ',
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
                      text: ' puntos iniciar sesión contraseña',
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
          _buildPasswordField(),
          SizedBox(height: 12.h),
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 13.sp, height: 18 / 13),
              children: [
                const TextSpan(
                  text: 'Recuperar contraseña, ',
                  style: TextStyle(
                    color: NowColors.c0xFF494C4F,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const TextSpan(
                  text: 'haga chic aqui',
                  style: TextStyle(
                    color: NowColors.c0xFF3288F1,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          EchoPrimaryButton(
            text: 'Iniciar sesión',
            enable: _isPasswordValid,
            onPressed: () {
              FocusScope.of(context).unfocus();
              loginModel.userLogin(_controller.text);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField() {
    return StepInputField(
      controller: _controller,
      hintText: 'Contraseña de 4 dígitos',
      maxLength: 4,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      obscureText: _obscureText,
      suffix: InkWell(
        onTap: () => setState(() => _obscureText = !_obscureText),
        child: Image.asset(
          _obscureText ? Drawable.iconEyeclose : Drawable.iconEyeopen,
          width: 20.r,
          height: 20.r,
        ),
      ),
    );
  }
}
