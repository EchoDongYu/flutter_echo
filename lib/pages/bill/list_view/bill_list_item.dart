import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum BillStatus { pagos, atrasado, pendiente, fracaso, pagado }

class BillListItem extends StatelessWidget {
  final double amount;
  final String vencimientoDate;
  final String dueDate;
  final BillStatus status;
  final VoidCallback onPagar;
  final VoidCallback onDetails;
  final bool isShowPagar;

  const BillListItem({
    super.key,
    required this.amount,
    required this.vencimientoDate,
    required this.dueDate,
    required this.status,
    required this.onPagar,
    required this.onDetails,
    this.isShowPagar = true,
  });

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
          Text(
            "Vencimiento: $vencimientoDate",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: NowColors.c0xFF77797B,
            ),
          ),
          const SizedBox(height: 10),
          // 金额
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Q ${amount.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  color: NowColors.c0xFF1C1F23,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: _statusStyle["color"].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
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
          const SizedBox(height: 12),
          // 明细区域
          Container(
            decoration: BoxDecoration(
              color: NowColors.c0xFFF3F3F5,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 3,horizontal: 6),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Monto a pagar",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: NowColors.c0xFF494C4F,
                            ),
                          ),
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
          ),
          const SizedBox(height: 20),
          // 底部按钮
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: context.screenWidth * 0.4,
                child: EchoOutlinedButton(
                  text: 'Detalles',
                  onPressed: onDetails,
                ),
              ),
              Visibility(
                visible: isShowPagar,
                child: SizedBox(
                  width: context.screenWidth * 0.4,
                  child: EchoSecondaryButton(
                    filledColor: _statusStyle["color"],
                    text: 'Pagar',
                    onPressed: onPagar,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
