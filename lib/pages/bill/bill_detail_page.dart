import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/pages/bill/bill_status.dart';
import 'package:flutter_echo/pages/bill/detail_view/bill_detail_loan_detail.dart';
import 'package:flutter_echo/pages/bill/detail_view/bill_detail_loan_info.dart';
import 'package:flutter_echo/pages/bill/detail_view/bill_detail_loan_status.dart';
import 'package:flutter_echo/providers/bill_detail_provider.dart';
import 'package:flutter_echo/ui/dialogs/box_dialog.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

///账单详情
class BillDetailPage extends StatelessWidget {
  const BillDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final billDetailModel = context.watch<BillDetailModel>();
    final billInfo = billDetailModel.billDetailData;
    final planList = billDetailModel.planList;
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      appBar: const CommonAppBar(title: 'Detalles del préstamo'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(12.w, 0.h, 12.w, 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //账单详情-还款状态框
              BillDetailLoanStatus(
                amount: billInfo?.wantonlyOLoanLeftAmount ?? 0.0,
                time: billDateTime(billInfo?.cherubimOOrderStatus, planList),
                status: billStatus(billInfo?.cherubimOOrderStatus),
                planListBox: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: planList.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final planItem = planList[index];
                    return BillDetailLoanItem(
                      '${planItem.ih2upqOCtPeriod}/${planItem.ez64t7OPeriodCount}',
                      status: planItem.i2jk5fOPeriodStatus,
                      first: planItem.wantonlyOLoanLeftAmount ?? 0,
                      second: planItem.gatemanORepaymentAmount ?? 0,
                      dueDays: planItem.clansmanODueDay ?? 0,
                      third: planItem.faciendOOverdueFee ?? 0,
                      date: planItem.r5k31qODueTime?.showDate ?? '',
                      isOverdue: planItem.slackOIsOverdue == true,
                      isSelect: billDetailModel.checkPlanList[index] == true,
                      onItemTap: () => billDetailModel.selectPlan(index),
                    );
                  },
                ),
                onPagar: () => context.push(AppRouter.repayConfirm),
                onHistory: () => context.push(AppRouter.repayHistory),
              ),
              SizedBox(height: 12.h),
              //账单详情-还款信息框
              BillDetailLoanInfo(
                date: billInfo?.n410zdOLoanTime?.showDate ?? '',
                apply: billInfo?.retiaryOLoanAmount?.showAmount ?? '',
                comision: billInfo?.spriteOBusinessFee?.showAmount ?? '',
                charge: billInfo?.centiareOServiceFee?.showAmount ?? '',
                received: billInfo?.pluralOReceiveAmount?.showAmount ?? '',
                onComision: () => _showBillDetailLoanDialog(
                  context,
                  child: BillDetailLoanDetail(
                    serviceCharge: 'Q 0',
                    creditInquiryFee: 'Q 0',
                    transferFee: 'Q 0',
                    iva: 'Q 0',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///费用详情-弹框
  Future<void> _showBillDetailLoanDialog(
    BuildContext context, {
    required Widget child,
  }) async {
    await BoxDialog.show(
      context: context,
      title: 'Comisión',
      btnText: 'Confirmar',
      centerLayout: child,
      onConfirm: () => context.pop(true),
    );
  }
}
