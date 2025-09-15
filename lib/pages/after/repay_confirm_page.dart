import 'package:flutter/material.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
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
      body: Column(
        children: [],
      ),
      bottomNavigationBar: WidgetHelper.buildBottomButton(
        text: 'Pagar inmediatamente',
        onPressed: () => context.push(AppRouter.repayResult),
      ),
    );
  }
}
