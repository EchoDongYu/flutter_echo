import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum PaymentDetailItemStatus { pagos, atrasado, pendiente, fracaso, pagado }

class BillDetailLoanItem extends StatelessWidget {
  const BillDetailLoanItem({
    super.key,
    required this.status,
    required this.amount,
    required this.dueDate,
  });

  final double amount;
  final String dueDate;
  final PaymentDetailItemStatus status;

  // 状态对应的颜色和文字
  Map<String, dynamic> get _statusStyle {
    switch (status) {
      case PaymentDetailItemStatus.pagos:
        return {"label": "Pagos", "color": NowColors.c0xFF3288F1};
      case PaymentDetailItemStatus.atrasado:
        return {"label": "Atrasado", "color": NowColors.c0xFFFB4F34};
      case PaymentDetailItemStatus.pendiente:
        return {"label": "Pendiente", "color": NowColors.c0xFFFF9817};
      case PaymentDetailItemStatus.fracaso:
        return {"label": "Fracaso", "color": NowColors.c0xFFFB4F34};
      case PaymentDetailItemStatus.pagado:
        return {"label": "Pagado", "color": NowColors.c0xFF3EB34D};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: NowColors.c0xFFF3F3F5,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: _statusStyle["color"]),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 36,
              height: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _statusStyle["color"],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Text(
                "1/10",
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
              left: 48,
              top: 12,
              right: 12,
              bottom: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vencimiento",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFF494C4F,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Monto a pagar",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFF494C4F,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Cantidad pagada",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFF494C4F,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      dueDate,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFF000000,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Q ${amount.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: _statusStyle["color"],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Q ${amount.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: _statusStyle["color"],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
