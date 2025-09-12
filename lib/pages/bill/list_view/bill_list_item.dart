

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
        return {
          "label": "Pagos",
          "color": NowColors.c0xFF3288F1,
        };
      case PaymentStatus.overdue:
        return {
          "label": "Atrasado",
          "color": NowColors.c0xFFFB4F34,
        };
      case PaymentStatus.pending:
        return {
          "label": "Pendiente",
          "color": NowColors.c0xFFFF9817,
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 顶部日期 + 状态
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Vencimiento: $vencimientoDate"),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                )
              ],
            ),
            const SizedBox(height: 8),

            // 金额
            Text(
              "Q ${amount.toStringAsFixed(2)}",
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            // 明细区域
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
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
                      )
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 12),

            // 底部按钮
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: onDetails,
                  child: const Text("查看详情"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _statusStyle["color"],
                  ),
                  onPressed: onPay,
                  child: const Text("Pagar"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

