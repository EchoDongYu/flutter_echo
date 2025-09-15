import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepayConfirmAmountPay extends StatelessWidget {
  const RepayConfirmAmountPay({
    super.key,
    required this.amountPay,
    required this.amountPayVen,
    required this.amountPayCom,
  });

  final String amountPay;
  final String amountPayVen;
  final String amountPayCom;

  @override
  Widget build(BuildContext context) {
    return CommonBox(
      gradient: LinearGradient(
        colors: [NowColors.c0xFF3288F1, NowColors.c0xFF4FAAFF],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Monto a pagar (Q)",
            style: TextStyle(
              fontSize: 14.sp,
              color: NowColors.c0xFFFFFFFF,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            amountPay,
            style: TextStyle(
              fontSize: 30.sp,
              color: NowColors.c0xFFFFFFFF,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 20.h),
          CommonBox(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vencimiento",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFF494C4F,
                      ),
                    ),
                    Text(
                      "2025",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFF1C1F23,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Comisión de pago",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFF494C4F,
                      ),
                    ),
                    Text(
                      "Q 100000",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFF1C1F23,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
