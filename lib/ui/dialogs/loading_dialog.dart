import 'package:flutter/material.dart';
import 'package:flutter_echo/ui/widgets/loading_ring.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingDialog {
  static OverlayEntry? _overlayEntry;

  static void show(BuildContext context) {
    if (_overlayEntry != null) hide();
    final overlayEntry = OverlayEntry(
      builder: (context) => PopScope(
        canPop: false,
        child: Stack(
          children: [
            // 半透明遮罩，阻止点击穿透
            ModalBarrier(color: Colors.black54, dismissible: false),
            Center(
              child: Container(
                width: 108.w,
                padding: EdgeInsets.only(top: 20.h, bottom: 16.h),
                decoration: const BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 12.h,
                  children: [
                    SpinKitRing(color: Colors.white, lineWidth: 2.w),
                    Text(
                      'loading',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        height: 18 / 12,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    _overlayEntry = overlayEntry;
    Overlay.of(context, rootOverlay: true).insert(overlayEntry);
  }

  static void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  static void dispose() {
    if (_overlayEntry != null) hide();
  }
}
