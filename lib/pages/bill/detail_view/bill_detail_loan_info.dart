
import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillDetailLoanInfo extends StatelessWidget {
  const BillDetailLoanInfo({
    super.key,
    required this.detailLoanInfoDate,
    required this.detailLoanInfoAmount,
    required this.detailLoanInfoCommission,
    required this.detailLoanInfoCharge,
    required this.detailLoanInfoReceived,
    this.onCommission,
  });

  final String detailLoanInfoDate;
  final String detailLoanInfoAmount;
  final String detailLoanInfoCommission;
  final String detailLoanInfoCharge;
  final String detailLoanInfoReceived;
  final VoidCallback? onCommission;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: NowColors.c0xFFFFFFFF,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Fecha del préstamo',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF1C1F23,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: NowColors.c0xFFFF9817.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  detailLoanInfoDate,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: NowColors.c0xFFFF9817,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: LoanInfoBox(
                  title: 'Monto del préstamo',
                  text: detailLoanInfoAmount,
                ),
              ),
              Flexible(
                flex: 1,
                child: LoanInfoBox(
                  title: 'Comisión',
                  text: detailLoanInfoCommission,
                  isShowIcon: true,
                  iconTap: onCommission,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: LoanInfoBox(
                  title: 'Cargo por Interés',
                  text: detailLoanInfoCharge,
                ),
              ),
              Flexible(
                flex: 1,
                child: LoanInfoBox(
                  title: 'Cantidad reciblda',
                  text: detailLoanInfoReceived,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LoanInfoBox extends StatelessWidget {
  const LoanInfoBox({
    super.key,
    required this.title,
    required this.text,
    this.isShowIcon = false,
    this.iconTap,
  });

  final String title;
  final String text;
  final bool isShowIcon;
  final VoidCallback? iconTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: NowColors.c0xFF77797B,
              ),
            ),
            Visibility(
              visible: isShowIcon,
              child: GestureDetector(
                onTap: iconTap,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Image.asset(
                    Drawable.iconQuestion,
                    width: 12.r,
                    height: 12.r,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: NowColors.c0xFF1C1F23,
          ),
        ),
      ],
    );
  }
}
