import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/providers/account_provider.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// 安全验证页面
class SafetyVerifyPage extends StatefulWidget {
  const SafetyVerifyPage({super.key});

  @override
  State<SafetyVerifyPage> createState() => _SafetyVerifyPageState();
}

class _SafetyVerifyPageState extends State<SafetyVerifyPage> {
  final _controllers = List.generate(2, (index) {
    return TextEditingController();
  }, growable: false);
  bool _isPhoneValid = false;
  bool _isCodeValid = false;

  AccountModel get accountModel =>
      Provider.of<AccountModel>(context, listen: false);

  @override
  void initState() {
    super.initState();
    _controllers[0].addListener(_onPhoneChanged);
    _controllers[1].addListener(_onCodeChanged);
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  /// 手机号输入变化监听
  void _onPhoneChanged() {
    final phoneValid = _controllers[0].text.length == AppConst.phoneLen;
    if (_isPhoneValid != phoneValid) {
      setState(() => _isPhoneValid = phoneValid);
    }
  }

  void _onCodeChanged() {
    final codeValid = _controllers[1].text.length == AppConst.codeLen;
    if (_isCodeValid != codeValid) {
      setState(() => _isCodeValid = codeValid);
    }
  }

  void _removal(BuildContext context) async {
    final removalOk = await accountModel.accountRemoval(
      mobile: _controllers[0].text,
      verifyCode: _controllers[1].text,
    );
    if (removalOk == true && context.mounted) {
      context.pushReplacement(AppRouter.removalSuccess);
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
            'Verificación de seguridad',
            style: TextStyle(
              color: NowColors.c0xFF1C1F23,
              fontWeight: FontWeight.w500,
              fontSize: 24.sp,
              height: 34 / 24,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Para la seguridad de su cuenta, primero debe verificar su identidad',
            style: TextStyle(
              color: NowColors.c0xFF77797B,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              height: 22 / 14,
            ),
          ),
          SizedBox(height: 32.h),
          StepInputField(
            controller: _controllers[0],
            hintText: 'Número de teléfono',
            maxLength: AppConst.phoneLen,
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
          ),
          SizedBox(height: 12.h),
          StepInputField(
            controller: _controllers[1],
            hintText: 'Código de verificación',
            maxLength: AppConst.codeLen,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            suffix: _buildSendBtn(),
          ),
          SizedBox(height: 32.h),
          EchoPrimaryButton(
            text: 'Próximo passo',
            enable: _isPhoneValid && _isCodeValid,
            onPressed: () => _removal(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSendBtn() => Consumer<AccountModel>(
    builder: (context, provider, _) {
      final countdown = provider.countdown;
      final alpha = countdown > 0 || !_isPhoneValid ? 0.5 : 1.0;
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 7.h),
        constraints: BoxConstraints(minWidth: 72.w),
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
            if (countdown == 0 && _isPhoneValid) {
              if (_controllers[0].text != LocalStorage().account) {
                toast('Ingrese el número de teléfono registrado');
              } else {
                provider.sendVerifyCode(type: 6);
              }
            }
          },
          child: Text(
            countdown > 0 ? 'Reenviar (${countdown}s)' : 'Código',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    },
  );
}
