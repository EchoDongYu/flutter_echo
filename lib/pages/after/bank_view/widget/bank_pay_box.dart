import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankPayBox extends StatelessWidget {
  const BankPayBox({
    super.key,
    required this.backImageUrl,
    required this.backTitle,
    this.onTap,
  });

  final String backImageUrl;
  final String backTitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CommonBox(
      height: 76.h,
      onTap: onTap,
      color: NowColors.c0xFFF3F3F5,
      child: Row(
        children: [
          Image.asset(backImageUrl, width: 72.w, height: 44.h),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                backTitle,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF000000,
                ),
              ),
              CommonBox(
                width: 100.w,
                height: 18.h,
                padding: EdgeInsets.zero,
                color: NowColors.c0xFF3288F1.withValues(alpha: 0.1),
                child: Text(
                  "Costo: ¡Gratis!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: NowColors.c0xFF3288F1,
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Image.asset(Drawable.iconMineNext, width: 20.w, height: 20.h),
        ],
      ),
    );
  }
}
