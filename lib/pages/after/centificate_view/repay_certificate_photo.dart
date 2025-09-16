import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepayCertificatePhoto extends StatelessWidget {
  const RepayCertificatePhoto({
    super.key,
    this.onTakePressed,
    this.onPhotoPressed,
    this.onPhotoTap,
  });

  final VoidCallback? onTakePressed;
  final VoidCallback? onPhotoPressed;
  final VoidCallback? onPhotoTap;

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
            onTap: onPhotoTap,
            padding: EdgeInsets.zero,
            child: Image.asset(
              Drawable.iconLogo,
              width: context.screenWidth,
              height: 300.h,
            ),
          ),
          SizedBox(height: 28.h),
          ElevatedButton(
            onPressed: onTakePressed,
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(48.h),
              backgroundColor: NowColors.c0xFF3288F1,
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Drawable.iconTake, width: 20, height: 20),
                SizedBox(width: 10.w),
                Text(
                  "Tomar fotografia",
                  style: TextStyle(
                    color: NowColors.c0xFFFFFFFF,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          OutlinedButton(
            onPressed: onPhotoPressed,
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(48.h),
              backgroundColor: NowColors.c0xFFFFFFFF,
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
              side: BorderSide(color: NowColors.c0xFFB0B1B2, width: 1),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Drawable.iconPhoto, width: 20, height: 20),
                SizedBox(width: 10.w),
                Text(
                  "Seleccionar imagen",
                  style: TextStyle(
                    color: NowColors.c0xFF1C1F23,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          // EchoOutlinedButton(text: "Volver a subir", onPressed: () {}),
        ],
      ),
    );
  }
}
