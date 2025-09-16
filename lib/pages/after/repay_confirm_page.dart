import 'package:flutter/material.dart';
import 'package:flutter_echo/pages/after/confirm_view/repay_confirm_amount_pay.dart';
import 'package:flutter_echo/pages/after/confirm_view/repay_confirm_channel.dart';
import 'package:flutter_echo/pages/after/confirm_view/repay_confirm_payment_amount.dart';
import 'package:flutter_echo/pages/after/confirm_view/repay_confirm_tips.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/ui/dialogs/prompt_dialog.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// 还款确认页面
class RepayConfirmPage extends StatelessWidget {
  const RepayConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Metodo de pago"),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
        child: Column(
          children: [
            //顶部提示
            RepayConfirmTips(),
            SizedBox(height: 12.h),
            //应付金额
            RepayConfirmAmountPay(
              amountPay: '1000000',
              amountPayVen: '2002',
              amountPayCom: 'Q 202210',
            ),
            SizedBox(height: 12.h),
            //付款金额
            RepayConfirmPaymentAmount(onChanged: (v) {}),
            SizedBox(height: 12.h),
            //主要/备用渠道
            RepayConfirmChannel(
              selectedBankRefund: true,
              selectedCashPayment: true,
              selectedInternetBanking: false,
            ),
          ],
        ),
      ),
      bottomNavigationBar: WidgetHelper.buildBottomButton(
        text: 'Pagar inmediatamente',
        onPressed: () async{
          final result = await PromptDialog.show(
            context: context,
            title: 'Consejos',
            content:"¿Estas seguro de modificarla cantidad?",
            confirmText: 'Confirmación',
            cancelText: "Cancelar",
          );
          if (result == true && context.mounted){
            //跳转还款状态页面
            //todo ?? 跳转那里？
            context.push(AppRouter.repayProcess);
          }
        },
      ),
    );
  }
}
