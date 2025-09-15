
import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepayBankDepositYet extends StatelessWidget {
  const RepayBankDepositYet({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "¿Ya realizaste tu depósito?",
            style: TextStyle(
              fontSize: 18.sp,
              color: NowColors.c0xFF1C1F23,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            "Envia tu comprobante para confirmar.",
            style: TextStyle(
              fontSize: 12.sp,
              color: NowColors.c0xFF494C4F,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            "El pago se completara correctamente, si ha sido verificado por el sistema.",
            style: TextStyle(
              fontSize: 12.sp,
              color: NowColors.c0xFFFF9817,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
