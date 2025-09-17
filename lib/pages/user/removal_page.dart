import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RemovalPage extends StatelessWidget {
  const RemovalPage({super.key});

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
                EchoTopBar(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(28.w, 64.h, 28.w, 28.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Image.asset(
                            Drawable.iconStatusRight1,
                            width: 70.r,
                            height: 70.r,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Center(
                          child: Text(
                            'Cuenta eliminada exitosamente',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w500,
                              color: NowColors.c0xFF1C1F23,
                              height: 34 / 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'La información de su perfil ha sido eliminada, su cuenta no podrá iniciar sesión.',
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
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: WidgetHelper.buildBottomButton(
        text: 'Entiendo',
        onPressed: () => context.go(AppRouter.loginPhone),
      ),
    );
  }
}
