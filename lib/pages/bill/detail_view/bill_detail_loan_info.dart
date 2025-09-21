import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillDetailLoanInfo extends StatelessWidget {
  const BillDetailLoanInfo({
    super.key,
    required this.date,
    required this.apply,
    required this.comision,
    required this.charge,
    required this.received,
    required this.onComision,
  });

  final String date;
  final String apply;
  final String comision;
  final String charge;
  final String received;
  final VoidCallback onComision;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
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
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: NowColors.c0xFFFF9817.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  date,
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
                child: LoanInfoBox(title: 'Monto del préstamo', text: apply),
              ),
              Flexible(
                flex: 1,
                child: InkWell(
                  onTap: onComision,
                  child: LoanInfoBox(
                    title: 'Comisión',
                    text: comision,
                    isShowIcon: true,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: LoanInfoBox(title: 'Cargo por Interés', text: charge),
              ),
              Flexible(
                flex: 1,
                child: LoanInfoBox(title: 'Cantidad reciblda', text: received),
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
  });

  final String title;
  final String text;
  final bool isShowIcon;

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
              child: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Image.asset(
                  Drawable.iconQuestion,
                  width: 14.r,
                  height: 14.r,
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
