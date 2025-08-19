import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 图形验证码弹窗
class CaptchaDialog extends StatefulWidget {
  final VoidCallback onClosing;
  final Function(String) onConfirm;

  const CaptchaDialog({
    super.key,
    required this.onConfirm,
    required this.onClosing,
  });

  @override
  State<CaptchaDialog> createState() => _CaptchaDialogState();
}

class _CaptchaDialogState extends State<CaptchaDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: widget.onClosing,
      enableDrag: false,
      backgroundColor: NowColors.c0xFFF3F3F5,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) => SingleChildScrollView(
        child: Column(children: [_buildContent(), _buildBottomButton()]),
      ),
    );
  }

  /// 构建主要内容区域
  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        children: [
          SizedBox(
            height: 56.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 4.w),
                InkWell(
                  onTap: widget.onClosing,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    width: 24.r,
                    height: 24.r,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: BoxBorder.all(
                        color: NowColors.c0xFF1C1F23,
                        width: 1.6.w,
                      ),
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      color: NowColors.c0xFF1C1F23,
                      size: 16,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  'Código de verificación gráfico',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: NowColors.c0xFF1C1F23,
                    height: 24 / 18,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: NowColors.c0xFFFFF9EA,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              child: Text(
                'Esta verificacion se utiliza para comprobar que no eres un robot y para evitar envios automatizados de spam.',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: NowColors.c0xFFFF9817,
                  height: 18 / 13,
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: NowStyles.cardShadows,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recordatorio: la imagen de arriba contiene 4 caracteres, ingrese correctamente el código de verificación.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: NowColors.c0xFF494C4F,
                    height: 18 / 12,
                  ),
                ),
                SizedBox(height: 16.h),
                StepInputField(
                  controller: _controller,
                  hintText: 'Código de verificación',
                  maxLength: AppConstants.codeLength,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  suffix: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      width: 104.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        border: Border.all(
                          color: NowColors.c0xFFC7C7C7,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
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
              ],
            ),
          ),
          SizedBox(height: 36.h),
        ],
      ),
    );
  }

  /// 构建底部按钮
  Widget _buildBottomButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border.all(color: const Color(0xD9FFFFFF), width: 1),
        boxShadow: NowStyles.bottomShadows,
      ),
      child: EchoPrimaryButton(
        text: 'Código de verificación',
        onPressed: () => widget.onConfirm(_controller.text),
      ),
    );
  }
}
