import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/bill/bill_status.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillListItem extends StatelessWidget {
  final double amount;
  final int dueDays;
  final String vencimientoDate;
  final BillStatus status;
  final VoidCallback onPagar;
  final VoidCallback onDetails;
  final Widget planListBox;

  const BillListItem({
    super.key,
    required this.amount,
    required this.dueDays,
    required this.vencimientoDate,
    required this.status,
    required this.onPagar,
    required this.onDetails,
    required this.planListBox,
  });

  bool get showPagar =>
      status == BillStatus.pagos || status == BillStatus.atrasado;

  bool get showHourglass => status == BillStatus.pendiente;

  String get _statusLabel => switch (status) {
    BillStatus.pagos => 'Pagos',
    BillStatus.atrasado => 'Atrasado',
    BillStatus.pendiente => 'Pendiente',
    BillStatus.fracaso => 'Fracaso',
    BillStatus.pagado => 'Pagado',
  };

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
          // 顶部日期 + 状态
          Row(
            children: [
              status != BillStatus.atrasado
                  ? Text(
                      'Vencimiento: $vencimientoDate',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFF77797B,
                      ),
                    )
                  : Text(
                      '$dueDays Dias Atrasados',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFFFB4F34,
                      ),
                    ),
              SizedBox(width: 4.w),
              Visibility(
                visible: showHourglass,
                child: Image.asset(
                  Drawable.iconHourglassFill,
                  width: 16,
                  height: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          // 金额
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                amount.showAmount,
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  color: NowColors.c0xFF1C1F23,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: status.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  _statusLabel,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: status.color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          // 明细区域
          planListBox,
          SizedBox(height: 12.h),
          // 底部按钮
          Row(
            spacing: 10.w,
            children: [
              Expanded(
                child: EchoOutlinedButton(
                  text: 'Ver detalles',
                  onPressed: onDetails,
                ),
              ),
              if (showPagar)
                Expanded(
                  child: EchoSecondaryButton(
                    filledColor: status.color,
                    text: 'Pagar',
                    onPressed: onPagar,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
