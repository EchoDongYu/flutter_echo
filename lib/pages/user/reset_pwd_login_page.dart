import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/providers/account_provider.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/ui/dialogs/prompt_dialog.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// 重置登录密码页面
class ResetLoginPwdPage extends StatefulWidget {
  const ResetLoginPwdPage({super.key});

  @override
  State<ResetLoginPwdPage> createState() => _ResetLoginPwdPageState();
}

class _ResetLoginPwdPageState extends State<ResetLoginPwdPage> {
  final _controllers = List.generate(3, (index) {
    return TextEditingController();
  }, growable: false);
  final List<bool> _obscureText = [true, true];
  bool _isValid = false;

  AccountModel get accountModel =>
      Provider.of<AccountModel>(context, listen: false);

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 3; i++) {
      _controllers[i].addListener(_onInputChanged);
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  /// 输入变化监听
  void _onInputChanged() {
    final isValid =
        _controllers[0].text.length == AppConst.passwordLen &&
        _controllers[1].text.length == AppConst.passwordLen &&
        _controllers[2].text.length == AppConst.codeLen;
    if (_isValid != isValid) setState(() => _isValid = isValid);
  }

  void _resetPassword(BuildContext context) async {
    if (_controllers[0].text != _controllers[1].text) {
      toast('La contraseña introducida dos veces no coincide');
      return;
    }
    final apiResult = await accountModel.resetLoginPassword(
      password: _controllers[0].text,
      verifyCode: _controllers[2].text,
    );
    if (apiResult == true && context.mounted) {
      final result = await PromptDialog.show(
        context: context,
        icon: Drawable.iconStatusRight2,
        title: 'Resultados modificados',
        content:
            'La contraseña de inicio de sesión ha sido cambiada con éxito, por favor utilice la nueva contraseña para iniciar sesión',
        confirmText: 'Confirmación',
      );
      if (result == true && context.mounted) context.pop();
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
    return Container(
      margin: EdgeInsets.only(top: 12.h),
      padding: EdgeInsets.fromLTRB(16.w, 28.h, 16.w, 40.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: NowStyles.cardShadows,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Restablecer contraseña',
            style: TextStyle(
              color: NowColors.c0xFF1C1F23,
              fontWeight: FontWeight.w500,
              fontSize: 24.sp,
              height: 34 / 24,
            ),
          ),
          SizedBox(height: 12.h),
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 14.sp, height: 22 / 14),
              children: [
                const TextSpan(
                  text:
                      'Recuperar la contraseña de inicio de sesión del número de teléfono móvil ',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: NowColors.c0xFF77797B,
                  ),
                ),
                TextSpan(
                  text: LocalStorage().account,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: NowColors.c0xFF1C1F23,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          StepInputField(
            controller: _controllers[2],
            hintText: 'Código de verificación',
            maxLength: AppConst.codeLen,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            suffix: _buildSendBtn(),
          ),
          SizedBox(height: 12.h),
          _buildPasswordField('Contraseña de 4 dígitos', 0),
          SizedBox(height: 12.h),
          _buildPasswordField('Confirmar contraseña', 1),
          SizedBox(height: 32.h),
          EchoPrimaryButton(
            text: 'Confirmar',
            enable: _isValid,
            onPressed: () => _resetPassword(context),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField(String hintText, int index) {
    final obscureText = _obscureText[index];
    return StepInputField(
      controller: _controllers[index],
      hintText: hintText,
      maxLength: AppConst.passwordLen,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      obscureText: obscureText,
      suffix: InkWell(
        onTap: () => setState(() => _obscureText[index] = !obscureText),
        child: Image.asset(
          obscureText ? Drawable.iconEyeclose : Drawable.iconEyeopen,
          width: 20.r,
          height: 20.r,
        ),
      ),
    );
  }

  Widget _buildSendBtn() => Consumer<AccountModel>(
    builder: (context, provider, _) {
      final countdown = provider.countdown;
      final alpha = countdown > 0 ? 0.5 : 1.0;
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 7.h),
        constraints: BoxConstraints(minWidth: 100.w, minHeight: 36.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              NowColors.c0xFF3288F1.withValues(alpha: alpha),
              NowColors.c0xFF4FAAFF.withValues(alpha: alpha),
            ],
          ),
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        child: InkWell(
          onTap: () {
            if (countdown == 0) {
              provider.sendVerifyCode(type: 2);
            }
          },
          child: Text(
            countdown > 0 ? 'Reenviar (${countdown}s)' : 'Código',
            style: TextStyle(
              color: Colors.white,
              fontSize: countdown > 0 ? 11.sp : 14.sp,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    },
  );
}
