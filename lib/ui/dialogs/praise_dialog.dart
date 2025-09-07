import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 好评引导弹窗
class PraiseDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onReport;
  final VoidCallback onCancel;

  const PraiseDialog({
    super.key,
    required this.onConfirm,
    required this.onReport,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                Image.asset(
                  Drawable.imageGoodview,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      SizedBox(height: 12.h),
                      Text(
                        '¿Qué te parece\nnuestra app?',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: NowColors.c0xFF1C1F23,
                          height: 30 / 20,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Si te parece que nuestro trabajo está chilero, ¡ponénos una buena calificación!',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: NowColors.c0xFF494C4F,
                          height: 22 / 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24.h),
                      EchoPrimaryButton(
                        text: '¡Ponénos una buena nota!',
                        onPressed: onConfirm,
                      ),
                      SizedBox(height: 12.h),
                      EchoOutlinedButton(
                        text: 'Quisiera reportar un problema',
                        onPressed: onReport,
                        textColor: NowColors.c0xFF3288F1,
                        borderColor: NowColors.c0xFF3288F1,
                        filledColor: NowColors.c0xFFEFF7FF,
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 36.h),
          InkWell(
            onTap: onCancel,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Container(
              width: 28.r,
              height: 28.r,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: BoxBorder.all(color: Colors.white, width: 1.6.w),
              ),
              child: const Icon(
                Icons.close_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
