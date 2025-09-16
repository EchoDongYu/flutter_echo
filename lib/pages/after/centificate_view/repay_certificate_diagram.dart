import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepayCertificateDiagram extends StatelessWidget {
  const RepayCertificateDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonBox(
          color: NowColors.c0xFFFF9817.withValues(alpha: 0.1),
          child: Text(
            "Estimado estos son los nombres de referencias disponibles para poder darle un ejemplo y facilitar cuando completas las informaciones del préstamo que pago.",
            style: TextStyle(
              fontSize: 14.sp,
              color: NowColors.c0xFFFF9817,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        CommonBox(
          color: NowColors.c0xFFF3F3F5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "NO.de autorizacion",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: NowColors.c0xFF1C1F23,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "No.Comprobante",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: NowColors.c0xFF1C1F23,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "AUT",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: NowColors.c0xFF1C1F23,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "Codigo de autorizacion",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: NowColors.c0xFF1C1F23,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "Referencia del Clien",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: NowColors.c0xFF1C1F23,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
