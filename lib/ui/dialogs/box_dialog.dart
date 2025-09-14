import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 通用提示弹窗
class BoxDialog extends StatelessWidget {
  final String title;
  final String btnText;
  final VoidCallback onConfirm;
  final Widget centerLayout;

  const BoxDialog({
    super.key,
    required this.title,
    required this.btnText,
    required this.onConfirm,
    required this.centerLayout,
  });

  /// 显示通用提示弹窗
  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String btnText,
    required VoidCallback onConfirm,
    required Widget centerLayout,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => BoxDialog(
        title: title,
        onConfirm: onConfirm,
        btnText:btnText,
        centerLayout: centerLayout,
      ),
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
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: NowColors.c0xFF1C1F23,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16.h),
            centerLayout,
            SizedBox(height: 24.h),
            EchoOutlinedButton(
              text: btnText,
              onPressed: onConfirm,
              textColor: NowColors.c0xFF3288F1,
              borderColor: NowColors.c0xFF3288F1,
              filledColor: NowColors.c0xFFEFF7FF,
            ),
          ],
        ),
      ),
    );
  }
}
