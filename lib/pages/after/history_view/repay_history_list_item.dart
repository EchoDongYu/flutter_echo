import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum RepayHistoryStatus { pagos, atrasado, pendiente, fracaso, pagado }

class RepayHistoryListItem extends StatelessWidget {
  const RepayHistoryListItem({super.key, required this.status});

  final RepayHistoryStatus status;

  // 状态对应的颜色和文字
  Map<String, dynamic> get _statusStyle {
    switch (status) {
      case RepayHistoryStatus.pagos:
        return {"label": "Pagos", "color": NowColors.c0xFF3288F1};
      case RepayHistoryStatus.atrasado:
        return {"label": "Atrasado", "color": NowColors.c0xFFFB4F34};
      case RepayHistoryStatus.pendiente:
        return {"label": "Pendiente", "color": NowColors.c0xFFFF9817};
      case RepayHistoryStatus.fracaso:
        return {"label": "Fracaso", "color": NowColors.c0xFFFB4F34};
      case RepayHistoryStatus.pagado:
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "222222",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF1C1F23,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  //vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: _statusStyle["color"].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _statusStyle["label"],
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: _statusStyle["color"],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "Q 4,800.00",
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w700,
              color: NowColors.c0xFF1C1F23,
            ),
          ),
        ],
      ),
    );
  }
}
