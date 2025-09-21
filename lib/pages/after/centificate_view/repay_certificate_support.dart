import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepayCertificateSupport extends StatelessWidget {
  const RepayCertificateSupport({super.key, this.onUploaded});

  final VoidCallback? onUploaded;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onUploaded,
            child: Text(
              'Historial de pagos subidos',
              style: TextStyle(
                fontSize: 14.sp,
                decoration: TextDecoration.underline,
                decorationColor: NowColors.c0xFF3288F1,
                decorationThickness: 2,
                color: NowColors.c0xFF3288F1,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 32.h),
          Divider(height: 1, color: NowColors.c0xFFF3F3F5),
          SizedBox(height: 12.h),
          Text(
            'Si tiene algún problema con el pago, póngase en contacto con nosotros.',
            style: TextStyle(
              fontSize: 14.sp,
              color: NowColors.c0xFF494C4F,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Suporte via WhatsApp',
            style: TextStyle(
              fontSize: 14.sp,
              decoration: TextDecoration.underline,
              decorationColor: NowColors.c0xFF3288F1,
              decorationThickness: 2,
              color: NowColors.c0xFF3288F1,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 56.h),
        ],
      ),
    );
  }
}
