import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      useSafeArea: false,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: UnconstrainedBox(
            child: Container(
              width: 108.r,
              height: 108.r,
              decoration: const BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SpinKitRing(color: Colors.white, lineWidth: 2.w),
                  Text(
                    'loading',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      height: 18 / 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void hide(BuildContext context) {
    final navigator = Navigator.of(context, rootNavigator: true);
    if (navigator.canPop()) navigator.pop();
  }
}
