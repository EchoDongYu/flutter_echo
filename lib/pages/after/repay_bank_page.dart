import 'package:flutter/material.dart';
import 'package:flutter_echo/pages/after/bank_view/repay_bank_pay_loan.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///还款银行页面
class RepayBankPage extends StatelessWidget {
  const RepayBankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Reembolso bancario",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
        child: Column(
          children: [
            //偿还贷款
            RepayBankPayLoan(),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}
