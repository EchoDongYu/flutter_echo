import 'package:flutter/material.dart';
import 'package:flutter_echo/pages/after/bank_view/repay_bank_deposit_yet.dart';
import 'package:flutter_echo/pages/after/bank_view/repay_bank_pay_loan.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

///还款银行页面
class RepayBankPage extends StatelessWidget {
  const RepayBankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Reembolso bancario',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
        child: Column(
          children: [
            //偿还贷款
            RepayBankPayLoan(),
            SizedBox(height: 12.h),
            //是否存款
            RepayBankDepositYet(),
          ],
        ),
      ),
      bottomNavigationBar: WidgetHelper.buildBottomButton(
        text: 'Pagar inmediatamente',
        //todo ?? 跳转那里？
        onPressed: () => context.push(AppRouter.repayCertificate),
      ),
    );
  }
}
