import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/bill/detail_view/bill_detail_loan_enum.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillDetailLoanStatus extends StatelessWidget {
  final double amount;
  final String vencimientoDate;
  final BillDetailLoanEnum status;
  final VoidCallback onPagar;
  final VoidCallback onHistory;
  final Widget loanStatusBox;
  final bool isShowPagar;
  final bool isShowVen;

  const BillDetailLoanStatus({
    super.key,
    required this.amount,
    required this.vencimientoDate,
    required this.status,
    required this.onPagar,
    required this.onHistory,
    required this.loanStatusBox,
    this.isShowPagar = true,
    this.isShowVen = false,
  });

  // 状态对应的颜色和文字
  Map<String, dynamic> get _statusStyle {
    switch (status) {
      case BillDetailLoanEnum.pagos:
        return {"label": "Pagos", "color": NowColors.c0xFF3288F1};
      case BillDetailLoanEnum.atrasado:
        return {"label": "Atrasado", "color": NowColors.c0xFFFB4F34};
      case BillDetailLoanEnum.pagado:
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
          !isShowVen
              ? Text(
                  "Vencimiento: $vencimientoDate",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: NowColors.c0xFF77797B,
                  ),
                )
              : Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _statusStyle["color"].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "N Dias Atrasados",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: _statusStyle["color"],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
          const SizedBox(height: 10),
          // 金额
          Text(
            "Q ${amount.toStringAsFixed(2)}",
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w700,
              color: NowColors.c0xFF1C1F23,
            ),
          ),
          const SizedBox(height: 12),
          // 明细区域
          loanStatusBox,
          const SizedBox(height: 20),
          // 底部按钮
          Visibility(
            visible: isShowPagar,
            child: SizedBox(
              height: 56,
              width: context.screenWidth,
              child: EchoSecondaryButton(
                filledColor: _statusStyle["color"],
                text: 'Pagar inmediatamente',
                onPressed: onPagar,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 56,
            width: context.screenWidth,
            child: EchoOutlinedButton(
              text: 'Historial de pagos',
              onPressed: onHistory,
            ),
          ),
        ],
      ),
    );
  }
}
