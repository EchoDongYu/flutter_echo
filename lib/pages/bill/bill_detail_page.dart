import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/bill/detail_view/bill_detail_loan_enum.dart';
import 'package:flutter_echo/pages/bill/detail_view/bill_detail_loan_info.dart';
import 'package:flutter_echo/pages/bill/detail_view/bill_detail_loan_item.dart';
import 'package:flutter_echo/pages/bill/detail_view/bill_detail_loan_status.dart';
import 'package:flutter_echo/providers/bill_detail_provider.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

///账单详情
class BillDetailPage extends StatelessWidget {
  const BillDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final billDetailModel = context.watch<BillDetailModel>();
    final billDetailData = billDetailModel.billDetailData;
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      appBar: const CommonAppBar(title: "Detalles del préstamo"),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //账单详情-还款状态框
            BillDetailLoanStatus(
              amount: 2000000,
              vencimientoDate: '',
              status: updateBillDetailLoanStatus(1),
              loanStatusBox: const BillDetailLoanListView(),
              onPagar: () {},
              onHistory: () {},
            ),
            const SizedBox(height: 12),
            //账单详情-还款信息框
            BillDetailLoanInfo(
              detailLoanInfoDate: "2025/01/01",
              detailLoanInfoAmount: 'Q 123.33',
              detailLoanInfoCommission: 'Q 123.33',
              detailLoanInfoCharge: 'Q 123.33',
              detailLoanInfoReceived: 'Q 123.33',
              onCommission:(){
                _showBillDetailLoanDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showBillDetailLoanDialog(BuildContext context) async {

  }

}

class BillDetailLoanListView extends StatelessWidget {
  const BillDetailLoanListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BillDetailModel>(
      builder: (_, provider, _) {
        final billDetailLoanList =
            provider.billDetailData?.v08uw3ORepaymentChannelList ?? [];
        return ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: billDetailLoanList.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            // final itemData = billDetailLoanList[index];
            return BillDetailLoanItem(
              amount: 0.0,
              dueDate: "2025",
              status: updateBillDetailLoanStatus(1),
            );
          },
        );
      },
    );
  }
}

//订单展示状态(o_orderStatus)：,0打款中,1打款失败,2打款成功且未结清未逾期,3打款成功且未结清有逾期,4全结清
BillDetailLoanEnum updateBillDetailLoanStatus(int? d95091oRepaymentStatus) {
  return BillDetailLoanEnum.atrasado;
}
