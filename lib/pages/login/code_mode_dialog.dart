import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// 选择收取验证码方式弹窗
class CodeModeDialog extends StatelessWidget {
  final Function(int?) onMethod;

  const CodeModeDialog({super.key, required this.onMethod});

  /// 显示选择收取验证码方式弹窗
  static Future<int?> show(BuildContext context) {
    return showDialog<int>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CodeModeDialog(onMethod: (value) => context.pop(value));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 32.h, 16.w, 24.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Elige cómo enviar tu código',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: NowColors.c0xFF1C1F23,
                height: 24 / 18,
              ),
            ),
            SizedBox(height: 32.h),
            EchoPrimaryButton(
              text: 'Recibelo por SMS',
              onPressed: () => onMethod(0),
            ),
            SizedBox(height: 12.h),
            EchoPrimaryButton(
              text: 'Recibelo por WhatsApp',
              onPressed: () => onMethod(1),
            ),
          ],
        ),
      ),
    );
  }
}
