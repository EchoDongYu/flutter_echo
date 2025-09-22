import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/providers/step_status_provider.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// 授信倒计时风险评估页面
class StepResultPage extends StatefulWidget {
  final int? countdown;

  const StepResultPage({super.key, required this.countdown});

  @override
  State<StepResultPage> createState() => _StepResultPageState();
}

class _StepResultPageState extends State<StepResultPage> {
  late int _countdown;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StepStatusModel>().refreshSubmitResult(5);
    });
    _countdown = widget.countdown ?? 30;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdown <= 0) {
        timer.cancel();
        context.go(AppRouter.main);
      } else {
        setState(() => _countdown--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

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
                EchoTopBar(title: 'Autorizacion'),
                SizedBox(height: 64.h),
                Image.asset(
                  Drawable.iconStatusLoad2,
                  width: 70.r,
                  height: 70.r,
                ),
                SizedBox(height: 24.h),
                Text(
                  '$_countdown s',
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w500,
                    color: NowColors.c0xFF3288F1,
                    height: 38 / 28,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4.h),
                Text(
                  'Por favor, espere',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: NowColors.c0xFF1C1F23,
                    height: 34 / 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),
                Text(
                  'Nuestro sistema está evaluando su crédito y prepararemos para los productos de préstamo.',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: NowColors.c0xFF1C1F23,
                    height: 22 / 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: WidgetHelper.buildBottomButton(
        text: 'Volver al inicio',
        onPressed: () => context.go(AppRouter.main),
      ),
    );
  }
}
