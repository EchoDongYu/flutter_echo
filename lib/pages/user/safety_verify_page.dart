import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 安全验证页面
class SafetyVerifyPage extends StatefulWidget {
  const SafetyVerifyPage({super.key});

  @override
  State<SafetyVerifyPage> createState() => _SafetyVerifyPageState();
}

class _SafetyVerifyPageState extends State<SafetyVerifyPage> {
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _codeCtrl = TextEditingController();

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
            controller: _phoneCtrl,
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
          ),
          SizedBox(height: 12.h),
          StepInputField(
            controller: _codeCtrl,
            hintText: 'Código de verificación',
            maxLength: AppConst.codeLength,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            suffix: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 7.h),
              constraints: BoxConstraints(minWidth: 72.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: const [NowColors.c0xFF3288F1, NowColors.c0xFF4FAAFF],
                ),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              child: Text(
                'Reenviar (59s)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 32.h),
          EchoPrimaryButton(text: 'Próximo passo', onPressed: () {}),
        ],
      ),
    );
  }
}
