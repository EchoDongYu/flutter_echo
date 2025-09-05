import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// 借款确认页面
class ApplyConfirmPage extends StatelessWidget {
  const ApplyConfirmPage({super.key, required String productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      body: Stack(
        children: [
          WidgetHelper.buildTopGradient(context: context, height: 55.h),
          SafeArea(
            child: Column(
              children: [
                EchoTopBar(title: 'Confirmación de préstamo'),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(28.w, 64.h, 28.w, 28.h),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: WidgetHelper.buildBottomButton(
        text: 'Enviar',
        onPressed: () => context.go(AppRouter.main),
      ),
    );
  }
}
