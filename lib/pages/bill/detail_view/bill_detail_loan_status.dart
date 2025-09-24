import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/bill/bill_status.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillDetailLoanStatus extends StatelessWidget {
  final double amount;
  final String? time;
  final BillStatus status;
  final VoidCallback onPagar;
  final VoidCallback onHistory;
  final Widget planListBox;
  final bool enable;

  const BillDetailLoanStatus({
    super.key,
    required this.amount,
    required this.time,
    required this.status,
    required this.onPagar,
    required this.onHistory,
    required this.planListBox,
    required this.enable,
  });

  bool get showPagar =>
      status == BillStatus.pagos || status == BillStatus.atrasado;

  String get _statusLogo => switch (status) {
    BillStatus.pagos => Drawable.iconPagos,
    BillStatus.atrasado => Drawable.iconAtrasado,
    BillStatus.pendiente => Drawable.iconSelectOn,
    BillStatus.fracaso => Drawable.iconSelectOn,
    BillStatus.pagado => Drawable.iconSelectOn,
    BillStatus.unknown => Drawable.iconSelectOn,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                _statusLogo,
                color: status.billColor,
                width: 26.r,
                height: 26.r,
              ),
              SizedBox(width: 12.w),
              Text(
                status.label,
                style: TextStyle(
                  fontSize: 24.sp,
                  color: status.billColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        _buildCard(context),
      ],
    );
  }

  Widget _buildCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
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
                  'Vencimiento: $time',
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
                    '$time Dias Atrasados',
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
          SizedBox(height: 16.h),
          // 明细区域
          planListBox,
          SizedBox(height: 20.h),
          // 底部按钮
          Visibility(
            visible: showPagar,
            child: EchoSecondaryButton(
              text: 'Pagar inmediatamente',
              filledColor: status.billColor,
              enable: enable,
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
  final String planIndex;
  final int? status;
  final double first;
  final double second;
  final int dueDays;
  final double third;
  final String date;
  final bool isOverdue;
  final bool isSelect;
  final VoidCallback onItemTap;

  const BillDetailLoanItem(
    this.planIndex, {
    super.key,
    required this.status,
    required this.first,
    required this.second,
    required this.dueDays,
    required this.third,
    required this.date,
    required this.isOverdue,
    required this.isSelect,
    required this.onItemTap,
  });

  Color get statusColor => planColor(status);

  bool get isSettle => status == 3;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onItemTap,
      child: Container(
        decoration: BoxDecoration(
          color: NowColors.c0xFFF3F3F5,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: isSelect ? statusColor : Colors.transparent,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Text(
                  planIndex,
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
                    visible: !isSettle,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: GestureDetector(
                        onTap: onItemTap,
                        child: Image.asset(
                          isSelect
                              ? Drawable.iconSelectOn
                              : Drawable.iconSelectOff,
                          color: statusColor,
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
                        _buildTwoItem('Vencimiento', date),
                        SizedBox(height: 6.h),
                        _buildTwoItem(
                          'Monto a pagar',
                          first.showAmount,
                          status: true,
                        ),
                        SizedBox(height: 6.h),
                        _buildTwoItem('Cantidad pagada', second.showAmount),
                        Visibility(
                          visible: isOverdue,
                          child: Column(
                            children: [
                              SizedBox(height: 6.h),
                              _buildTwoItem('Dias atrasados', '$dueDays Dias'),
                              SizedBox(height: 6.h),
                              _buildTwoItem(
                                'Cargo por pago tardio',
                                third.showAmount,
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

  Widget _buildTwoItem(String first, String second, {bool status = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          first,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: NowColors.c0xFF494C4F,
          ),
        ),
        Text(
          second,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: status ? statusColor : NowColors.c0xFF1C1F23,
          ),
        ),
      ],
    );
  }
}
