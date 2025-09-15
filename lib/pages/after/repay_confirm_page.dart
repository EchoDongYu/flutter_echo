import 'package:flutter/material.dart';
import 'package:flutter_echo/pages/after/confirm_view/repay_confirm_tips.dart';
import 'package:flutter_echo/pages/app_router.dart';
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
      appBar: CommonAppBar(
        title: "Metodo de pago",
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
        child: Column(
          children: [
            RepayConfirmTips(),
          ],
        ),
      ),
      bottomNavigationBar: WidgetHelper.buildBottomButton(
        text: 'Pagar inmediatamente',
        onPressed: () => context.push(AppRouter.repayResult),
      ),
    );
  }
}
