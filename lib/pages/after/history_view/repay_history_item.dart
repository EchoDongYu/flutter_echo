import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RepayHistoryItem extends StatelessWidget {
  final double amount;
  final String venDate;

  ///本次还款处理后状态：0：还款中，1：还款成功,2：还款失败
  final int? status;
  final int? type;

  const RepayHistoryItem({
    super.key,
    required this.amount,
    required this.venDate,
    required this.status,
    required this.type,
  });

  Color get _statusColor {
    switch (status) {
      case 0:
        return NowColors.c0xFF3288F1;
      case 1:
        return NowColors.c0xFF3EB34D;
      case 2:
        return NowColors.c0xFFFB4F34;
      default:
        return NowColors.c0xFF3288F1;
    }
  }

  String get _statusLabel {
    switch (status) {
      case 0:
        return 'Pago pendiente';
      case 1:
        return 'Pagado';
      case 2:
        return 'Atrasado';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: NowColors.c0xFFFFFFFF,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                venDate,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF1C1F23,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: _statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  _statusLabel,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: _statusColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                amount.showAmount,
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                  color: NowColors.c0xFF1C1F23,
                ),
              ),
              if (type == 2)
                OutlinedButton(
                  onPressed: () => context.push(AppRouter.certRecord),
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size.fromHeight(26.h),
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 1.h,
                    ),
                    side: BorderSide(color: NowColors.c0xFF3288F1, width: 1),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pago por bancos',
                        style: TextStyle(
                          color: NowColors.c0xFF3288F1,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_right_rounded,
                        color: NowColors.c0xFF3288F1,
                        size: 30,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
