import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillDetailLoanDetail extends StatelessWidget {
  const BillDetailLoanDetail({
    super.key,
    required this.serviceCharge,
    required this.creditInquiryFee,
    required this.transferFee,
    required this.iva,
  });

  final String serviceCharge;
  final String creditInquiryFee;
  final String transferFee;
  final String iva;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: NowColors.c0xFFF3F3F5,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Cargo por Servicio',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF1C1F23,
                ),
              ),
              Text(
                serviceCharge,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF3288F1,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Tarifa de Consulta de Crédito',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF1C1F23,
                ),
              ),
              Text(
                creditInquiryFee,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF3288F1,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Tarifa de Transferencia',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF1C1F23,
                ),
              ),
              Text(
                transferFee,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF3288F1,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'IVA',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF1C1F23,
                ),
              ),
              Text(
                iva,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF3288F1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
