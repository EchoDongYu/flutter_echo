import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class NotFoundPage extends StatelessWidget {
  final Uri uri;

  const NotFoundPage({super.key, required this.uri});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          WidgetHelper.buildTopGradient(context: context, height: 55.h),
          SafeArea(
            child: Column(
              children: [
                EchoTopBar(title: 'Página no encontrada'),
                SizedBox(height: 64.h),
                Image.asset(
                  Drawable.iconStatusWrong1,
                  width: 70.r,
                  height: 70.r,
                ),
                SizedBox(height: 24.h),
                Text(uri.toString(), style: const TextStyle(fontSize: 16)),
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
