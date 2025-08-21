import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Dialog(
          alignment: Alignment.center,
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 136.w),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: SpinKitCircle(color: NowColors.c0xFF3288F1),
          ),
        ),
      ),
    );
  }

  static void hide(BuildContext context) {
    final navigatorState = Navigator.of(context, rootNavigator: true);
    if (navigatorState.canPop()) navigatorState.pop();
  }
}
