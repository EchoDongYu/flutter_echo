import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepayBankBox extends StatelessWidget {
  final String bankImage;
  final String bankTitle;
  final VoidCallback onTap;

  const RepayBankBox({
    super.key,
    required this.bankImage,
    required this.bankTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CommonBox(
      onTap: onTap,
      color: NowColors.c0xFFF3F3F5,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: BoxBorder.all(color: NowColors.c0xFFD8D8D8, width: 0.6.w),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                imageUrl: bankImage,
                height: 45.h,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bankTitle,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF000000,
                ),
              ),
              SizedBox(height: 6.h),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                decoration: BoxDecoration(
                  color: NowColors.c0xFF3288F1.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 1,
                    color: NowColors.c0xFF3288F1,
                    style: BorderStyle.solid,
                  ),
                ),
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
