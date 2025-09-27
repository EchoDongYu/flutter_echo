import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageNoData extends StatelessWidget {
  const PageNoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 64.h),
        Image.asset(Drawable.iconStatusHis, width: 70.r, height: 70.r),
        SizedBox(height: 24.h),
        Text(
          'Sin datos',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
            color: NowColors.c0xFF1C1F23,
            height: 26 / 18,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
