import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum BillStatus { pagos, atrasado, pendiente, fracaso, pagado }

class BillListItem extends StatelessWidget {
  final double amount;
  final int dueDays;
  final String vencimientoDate;
  final BillStatus status;
  final VoidCallback onPagar;
  final VoidCallback onDetails;
  final Widget billListItemBox;

  const BillListItem({
    super.key,
    required this.amount,
    required this.dueDays,
    required this.vencimientoDate,
    required this.status,
    required this.onPagar,
    required this.onDetails,
    required this.billListItemBox,
  });

  bool get isShowPagar =>
      status == BillStatus.pagos || status == BillStatus.atrasado;

  bool get isShowFill => status == BillStatus.pendiente;

  // 状态对应的颜色和文字
  Map<String, dynamic> get _statusStyle {
    switch (status) {
      case BillStatus.pagos:
        return {"label": "Pagos", "color": NowColors.c0xFF3288F1};
      case BillStatus.atrasado:
        return {"label": "Atrasado", "color": NowColors.c0xFFFB4F34};
      case BillStatus.pendiente:
        return {"label": "Pendiente", "color": NowColors.c0xFFFF9817};
      case BillStatus.fracaso:
        return {"label": "Fracaso", "color": NowColors.c0xFFFB4F34};
      case BillStatus.pagado:
        return {"label": "Pagado", "color": NowColors.c0xFF3EB34D};
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
          // 顶部日期 + 状态
          Row(
            children: [
              status != BillStatus.atrasado
                  ? Text(
                      "Vencimiento: $vencimientoDate",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFF77797B,
                      ),
                    )
                  : Text(
                      "$dueDays Dias Atrasados",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFFFB4F34,
                      ),
                    ),
              SizedBox(width: 4.w),
              Visibility(
                visible: isShowFill,
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
                  color: _statusStyle["color"].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  _statusStyle["label"],
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: _statusStyle["color"],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          // 明细区域
          billListItemBox,
          SizedBox(height: 12.h),
          // 底部按钮
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 10.w,
            children: [
              Expanded(
                child: EchoOutlinedButton(
                  text: 'Ver detalles',
                  onPressed: onDetails,
                ),
              ),
              if (isShowPagar)
                Expanded(
                  child: EchoSecondaryButton(
                    filledColor: _statusStyle["color"],
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
