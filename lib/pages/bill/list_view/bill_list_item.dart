import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';

enum PaymentStatus { paid, overdue, pending }

class BillListItem extends StatelessWidget {
  final double amount;
  final String vencimientoDate;
  final String dueDate;
  final PaymentStatus status;
  final VoidCallback onPay;
  final VoidCallback onDetails;

  const BillListItem({
    super.key,
    required this.amount,
    required this.vencimientoDate,
    required this.dueDate,
    required this.status,
    required this.onPay,
    required this.onDetails,
  });

  // 状态对应的颜色和文字
  Map<String, dynamic> get _statusStyle {
    switch (status) {
      case PaymentStatus.paid:
        return {"label": "Pagos", "color": NowColors.c0xFF3288F1};
      case PaymentStatus.overdue:
        return {"label": "Atrasado", "color": NowColors.c0xFFFB4F34};
      case PaymentStatus.pending:
        return {"label": "Pendiente", "color": NowColors.c0xFFFF9817};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: NowColors.c0xFFFFFFFF,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 顶部日期 + 状态
          Text("Vencimiento: $vencimientoDate"),

          const SizedBox(height: 12),

          // 金额
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Q ${amount.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _statusStyle["color"].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _statusStyle["label"],
                  style: TextStyle(
                    color: _statusStyle["color"],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // 明细区域
          Container(
            decoration: BoxDecoration(
              color: NowColors.c0xFFF3F3F5,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    width: 36,
                    height: 24,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: _statusStyle["color"].withOpacity(0.1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Text("1/1"),
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
                          const Text("Vencimiento"),
                          const SizedBox(height: 4),
                          const Text("Monto a pagar"),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(dueDate),
                          Text(
                            "Q ${amount.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: _statusStyle["color"],
                              fontWeight: FontWeight.bold,
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

          const SizedBox(height: 24),

          // 底部按钮
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: onPay,
                child: Container(
                  height: 48,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: NowColors.c0xFFFFFFFF,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    border: BoxBorder.all(
                      color: NowColors.c0xFFC7C7C7,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    "查看详情",
                    style: TextStyle(
                      fontSize: 16,
                      color: NowColors.c0xFF1C1F23,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: onDetails,
                child: Container(
                  height: 48,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: _statusStyle["color"],
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  child: Text(
                    "Pagar",
                    style: TextStyle(
                      fontSize: 16,
                      color: NowColors.c0xFFFFFFFF,
                    ),
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
