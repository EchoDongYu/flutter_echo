import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/bill/bill_status.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillDetailLoanStatus extends StatelessWidget {
  final double amount;
  final int dueDays;
  final String vencimientoDate;
  final BillStatus status;
  final VoidCallback onPagar;
  final VoidCallback onHistory;
  final Widget planListBox;

  const BillDetailLoanStatus({
    super.key,
    required this.amount,
    required this.dueDays,
    required this.vencimientoDate,
    required this.status,
    required this.onPagar,
    required this.onHistory,
    required this.planListBox,
  });

  bool get showPagar =>
      status == BillStatus.pagos || status == BillStatus.atrasado;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 12.h),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: NowColors.c0xFFFFFFFF,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 顶部日期 + 状态
          status != BillStatus.atrasado
              ? Text(
                  'Vencimiento: $vencimientoDate',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: NowColors.c0xFF77797B,
                  ),
                )
              : Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: NowColors.c0xFFFB4F34.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '$dueDays Dias Atrasados',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: NowColors.c0xFFFB4F34,
                    ),
                  ),
                ),
          SizedBox(height: 10.h),
          // 金额
          Text(
            amount.showAmount,
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w700,
              color: NowColors.c0xFF1C1F23,
            ),
          ),
          SizedBox(height: 12.h),
          // 明细区域
          planListBox,
          SizedBox(height: 12.h),
          // 底部按钮
          Visibility(
            visible: showPagar,
            child: EchoSecondaryButton(
              filledColor: status.color,
              text: 'Pagar inmediatamente',
              onPressed: onPagar,
            ),
          ),
          SizedBox(height: 10.h),
          EchoOutlinedButton(text: 'Historial de pagos', onPressed: onHistory),
        ],
      ),
    );
  }
}

class BillDetailLoanItem extends StatelessWidget {
  const BillDetailLoanItem({
    super.key,
    required this.status,
    required this.amount,
    required this.dueDate,
    this.isShowOther = false,
    this.isSelectedItem = false,
    this.isSelectedRadio = false,
    this.onRadioTap,
    this.onItemTap,
  });

  final double amount;
  final String dueDate;
  final BillStatus status;
  final bool isShowOther;
  final bool isSelectedItem;
  final bool isSelectedRadio;
  final VoidCallback? onRadioTap;
  final VoidCallback? onItemTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onItemTap,
      child: Container(
        decoration: BoxDecoration(
          color: NowColors.c0xFFF3F3F5,
          borderRadius: BorderRadius.circular(12),
          border: isSelectedItem
              ? Border.all(width: 1, color: status.color)
              : null,
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: status.color,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Text(
                  '1/10',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: NowColors.c0xFFFFFFFF,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                top: 12,
                right: 12,
                bottom: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: isSelectedItem,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: GestureDetector(
                        onTap: onRadioTap,
                        child: Image.asset(
                          isSelectedRadio
                              ? Drawable.iconSelectOn
                              : Drawable.iconSelectOff,
                          color: status.color,
                          width: 22.r,
                          height: 22.r,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vencimiento',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: NowColors.c0xFF494C4F,
                              ),
                            ),
                            Text(
                              dueDate,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: NowColors.c0xFF000000,
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
                              'Monto a pagar',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: NowColors.c0xFF494C4F,
                              ),
                            ),
                            Text(
                              amount.showAmount,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: status.color,
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
                              'Cantidad pagada',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: NowColors.c0xFF494C4F,
                              ),
                            ),
                            Text(
                              amount.showAmount,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: status.color,
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: isShowOther,
                          child: Column(
                            children: [
                              SizedBox(height: 6.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Dias atrasados',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: NowColors.c0xFF494C4F,
                                    ),
                                  ),
                                  Text(
                                    amount.showAmount,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: status.color,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Cargo por pago tardio',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: NowColors.c0xFF494C4F,
                                    ),
                                  ),
                                  Text(
                                    amount.showAmount,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: status.color,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
