import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepayConfirmChannel extends StatelessWidget {
  const RepayConfirmChannel({
    super.key,
    this.selectedBankRefund = false,
    this.onBankRefund,
    this.selectedCashPayment = false,
    this.onCashPayment,
    this.selectedInternetBanking = false,
    this.onInternetBanking,
  });

  final bool selectedBankRefund;
  final VoidCallback? onBankRefund;
  final bool selectedCashPayment;
  final VoidCallback? onCashPayment;
  final bool selectedInternetBanking;
  final VoidCallback? onInternetBanking;

  @override
  Widget build(BuildContext context) {
    return CommonBox(
      width: context.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Canal principal",
            style: TextStyle(
              fontSize: 18.sp,
              color: NowColors.c0xFF1C1F23,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            "Si hay algún error para el reembolso en el canal principal, utilice el canal alternativo para el reembolso.",
            style: TextStyle(
              fontSize: 12.sp,
              color: NowColors.c0xFFFF9817,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 20.h),
          PickItem(
            label: "Reembolso bancario",
            selected: selectedBankRefund,
            onTap: onBankRefund,
          ),
          SizedBox(height: 32.h),
          Text(
            "Canal alternativo",
            style: TextStyle(
              fontSize: 18.sp,
              color: NowColors.c0xFF1C1F23,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "Seleccionar método de pago",
            style: TextStyle(
              fontSize: 12.sp,
              color: NowColors.c0xFF77797B,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 16.h),
          PickItem(
            label: "Pago en efectivo",
            selected: selectedCashPayment,
            onTap: onCashPayment,
          ),
          SizedBox(height: 8.h),
          PickItem(
            label: "Banca por Internet",
            selected: selectedInternetBanking,
            onTap: onInternetBanking,
          ),
        ],
      ),
    );
  }
}

class PickItem extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;
  final String iconOn;

  final String iconOff;

  const PickItem({
    super.key,
    required this.label,
    required this.selected,
    this.iconOn = Drawable.iconSelectOn,
    this.iconOff = Drawable.iconSelectOff,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: CommonBox(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        color: selected
            ? NowColors.c0xFF3288F1.withValues(alpha: 0.1)
            : NowColors.c0xFFF3F3F5,
        borderColor: selected ? NowColors.c0xFF3288F1 : NowColors.c0x00000000,
        child: Row(
          children: [
            Image.asset(selected ? iconOn : iconOff, width: 22, height: 22),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF1C1F23,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
