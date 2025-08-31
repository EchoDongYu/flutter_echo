import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/services/permission_service.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    PermissionService().requestAllPermissions().then((v) {
      Future.delayed(Duration(milliseconds: 600), () {
        if (context.mounted) context.go(AppRouter.main);
      });
    });
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Drawable.iconLogo, width: 80.r, height: 80.r),
                SizedBox(height: 30.h),
                Text(
                  'CrediGo',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: NowColors.c0xFF1C1F23,
                    height: 24 / 24,
                  ),
                ),
                SizedBox(height: 90.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
