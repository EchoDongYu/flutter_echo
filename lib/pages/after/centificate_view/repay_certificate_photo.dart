import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepayCertificatePhoto extends StatelessWidget {
  const RepayCertificatePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBox(
      child: Column(
        children: [
          CommonBox(
            color: NowColors.c0xFFFF9817.withValues(alpha: 0.1),
            child: Text(
              "Confirmar tu depósito enviando una foto oimagen clara y legible de tu comprobante.",
              style: TextStyle(
                fontSize: 14.sp,
                color: NowColors.c0xFFFF9817,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          CommonBox(
            padding: EdgeInsets.zero,
            child: Image.asset(
              Drawable.iconLogo,
              width: context.screenWidth,
              height: 300.h,
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
