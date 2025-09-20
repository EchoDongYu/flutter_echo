
import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaceIdInfoFacial extends StatelessWidget {
  const FaceIdInfoFacial({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBox(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          CommonBox(
            color: NowColors.c0xFF3288F1,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Text(
              "Foto facial",
              style: TextStyle(
                fontSize: 18.sp,
                color: NowColors.c0xFFFFFFFF,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          CommonBox(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            child: Column(
              children: [
                CommonBox(
                  borderWidth: 1,
                  borderColor: NowColors.c0xFFD8D8D8,
                  child: Column(
                    children: [
                      Image.asset(
                        Drawable.iconIdCard,
                        width: context.screenWidth,
                        height: 160.h,
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        "Haz clic para volver a subir",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: NowColors.c0xFF3288F1,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                          decorationColor:NowColors.c0xFF3288F1,
                          decorationThickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
