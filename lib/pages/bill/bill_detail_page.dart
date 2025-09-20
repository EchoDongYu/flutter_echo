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
class BillDetailPage extends StatefulWidget {
  final String? billId;

  const BillDetailPage({super.key, this.billId});

  @override
  State<BillDetailPage> createState() => _BillDetailPageState();
}

class _BillDetailPageState extends State<BillDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BillDetailModel>().fetchBillDetailData(widget.billId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final billDetailModel = context.watch<BillDetailModel>();
    final billInfo = billDetailModel.billDetailData;
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      appBar: const CommonAppBar(title: 'Detalles del préstamo'),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //账单详情-还款状态框
            BillDetailLoanStatus(
              amount: billInfo?.wantonlyOLoanLeftAmount ?? 0.0,
              dueDays: billInfo?.coandaODueDays ?? 0,
              vencimientoDate: billInfo?.encloseOOrderTime?.showDate ?? '',
              status: billStatus(billInfo?.cherubimOOrderStatus),
              planListBox: const BillDetailPlanListView(),
              onPagar: () {
                //跳转还款页面
                context.push(AppRouter.repayConfirm);
              },
              onHistory: () {
                //跳转还款历史列表
                context.push(AppRouter.repayHistory);
              },
            ),
            SizedBox(height: 12.h),
            //账单详情-还款信息框
            BillDetailLoanInfo(
              detailLoanInfoDate: '2025/01/01',
              detailLoanInfoAmount: 'Q 123.33',
              detailLoanInfoCommission: 'Q 123.33',
              detailLoanInfoCharge: 'Q 123.33',
              detailLoanInfoReceived: 'Q 123.33',
              onCommission: () {
                _showBillDetailLoanDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  ///费用详情-弹框
  Future<void> _showBillDetailLoanDialog(BuildContext context) async {
    await BoxDialog.show(
      context: context,
      title: 'Comisión',
      btnText: 'Confirmar',
      centerLayout: BillDetailLoanDetail(
        serviceCharge: 'Q 15',
        creditInquiryFee: 'Q 15',
        transferFee: 'Q 15',
        iva: 'Q 15',
      ),
      onConfirm: () {
        context.pop(true);
      },
    );
  }
}

class BillDetailPlanListView extends StatelessWidget {
  const BillDetailPlanListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BillDetailModel>(
      builder: (_, provider, _) {
        final planList =
            provider.billDetailData?.glacisORepaymentPlanList ?? [];
        return ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: planList.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            final itemData = planList[index];
            return BillDetailLoanItem(
              amount: 0.0,
              dueDate: '2025',
              status: billStatus(itemData.i2jk5fOPeriodStatus),
            );
          },
        );
      },
    );
  }
}
