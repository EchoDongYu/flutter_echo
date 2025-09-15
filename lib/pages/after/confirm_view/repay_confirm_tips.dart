
import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepayConfirmTips extends StatelessWidget {
  const RepayConfirmTips({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBox(
      color: NowColors.c0xFFFF9817.withValues(alpha: 0.1),
      child: Text(
          "Estimado usuario, CashiGO mantendra sus datos seguros y no los compartira con tercero",
        style: TextStyle(
          fontSize: 14.sp,
          color: NowColors.c0xFFFF9817,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
