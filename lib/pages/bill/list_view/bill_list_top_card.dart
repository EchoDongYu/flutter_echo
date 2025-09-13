import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillListTopCard extends StatelessWidget {
  const BillListTopCard({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 24.h, 6.w, 24.h),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [NowColors.c0xFF3288F1, NowColors.c0xFF4FAAFF],
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: NowColors.c0xFFFFFFFF,
                height: 28 / 18,
              ),
            ),
          ),
          const SizedBox(height: 12,),
          Text(
            value,
            style: TextStyle(
              fontSize: 36.sp,
              fontWeight: FontWeight.w700,
              color: NowColors.c0xFFFFFFFF,
              height: 38 / 30,
            ),
          ),
        ],
      ),
    );
  }
}
