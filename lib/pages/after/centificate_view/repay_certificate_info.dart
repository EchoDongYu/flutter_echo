import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepayCertificateInfo extends StatelessWidget {
  const RepayCertificateInfo({super.key, this.onInfoClick, this.onPhotoTap});

  final VoidCallback? onInfoClick;
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
            padding: EdgeInsets.zero,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: onPhotoTap,
                  child: Image.asset(
                    Drawable.iconLogo,
                    width: context.screenWidth,
                    height: 300.h,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: CommonBox(
                    padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 12.w),
                    color: NowColors.c0x00000000.withValues(alpha: 0.7),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CommonBox(
                          width: 120.w,
                          height: 26.h,
                          onTap: onInfoClick,
                          padding: EdgeInsets.zero,
                          borderWidth: 1,
                          color: NowColors.c0xFFFFFFFF,
                          borderColor: NowColors.c0xFF3288F1,
                          alignment: Alignment.center,
                          child: Text(
                            "Click para ver",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: NowColors.c0xFF3288F1,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w,),
                        Expanded(
                          child: Text(
                            "Diagrama de ejemplo de vale",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: NowColors.c0xFFFFFFFF,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
