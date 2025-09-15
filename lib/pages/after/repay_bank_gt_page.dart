import 'package:flutter/material.dart';
import 'package:flutter_echo/pages/after/bank_view/repay_bank_card_info.dart';
import 'package:flutter_echo/pages/after/bank_view/repay_bank_deposit_yet.dart';
import 'package:flutter_echo/pages/after/bank_view/repay_bank_pay_tips.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

///还款银行页面-GT
class RepayBankGtPage extends StatelessWidget {
  const RepayBankGtPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Banco G&T continental"),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
        child: Column(
          children: [
            RepayBankCardInfo(
              bankCardInfoImageUrl: Drawable.iconBankGT,
              bankCardInfoTitle: "G&T",
              bankCardInfoText: "Banco G&T continental",
              bankCardInfoAccountNumber: "062095675",
            ),
            SizedBox(height: 12.h),
            RepayBankPayTips(),
            SizedBox(height: 12.h),
            RepayBankDepositYet(),
          ],
        ),
      ),
      bottomNavigationBar: WidgetHelper.buildBottomButton(
        text: 'Pagar inmediatamente',
        onPressed: () => context.push(AppRouter.repayCertificate),
      ),
    );
  }
}
