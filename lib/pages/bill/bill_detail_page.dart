import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/bill/detail_view/bill_detail_Loan_info.dart';
import 'package:flutter_echo/pages/bill/detail_view/bill_detail_Loan_status.dart';
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
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      appBar: const CommonAppBar(title: "Detalles del préstamo"),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //账单详情-还款状态框
            BillDetailLoanStatus(),
            const SizedBox(height: 12),
            //账单详情-还款信息框
            BillDetailLoanInfo(
              detailLoanInfoDate: "2025/01/01",
              detailLoanInfoAmount: 'Q 123.33',
              detailLoanInfoCommission: 'Q 123.33',
              detailLoanInfoCharge: 'Q 123.33',
              detailLoanInfoReceived: 'Q 123.33',
            ),
          ],
        ),
      ),
    );
  }
}
