import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/bill/detail_view/bill_detail_loan_enum.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  final BillDetailLoanEnum status;
  final bool isShowOther;
  final bool isSelectedItem;
  final bool isSelectedRadio;
  final VoidCallback? onRadioTap;
  final VoidCallback? onItemTap;

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
    return InkWell(
      onTap: onItemTap,
      child: Container(
        decoration: BoxDecoration(
          color: NowColors.c0xFFF3F3F5,
          borderRadius: BorderRadius.circular(12),
          border: isSelectedItem ?
          Border.all(width: 1, color: _statusStyle["color"])
          : null,
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
                      child:  GestureDetector(
                        onTap: onRadioTap,
                        child: Image.asset(
                          isSelectedRadio ? Drawable.iconSelectOn : Drawable.iconSelectOff,
                          color: _statusStyle["color"],
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
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Cantidad pagada",
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
                        Visibility(
                          visible: isShowOther,
                          child: Column(
                            children: [
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Dias atrasados",
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
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Cargo por pago tardio",
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
