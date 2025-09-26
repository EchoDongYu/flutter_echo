import 'package:flutter/material.dart';
import 'package:flutter_echo/ui/widgets/loading_ring.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingDialog {
  static int _loadingCount = 0;
  static OverlayEntry? _overlayEntry;

  static void show(BuildContext context) {
    _loadingCount++;
    if (_overlayEntry != null) return;
    final overlayEntry = OverlayEntry(
      builder: (_) => Stack(
        children: [
          // 半透明遮罩，阻止点击穿透
          ModalBarrier(color: Colors.transparent, dismissible: false),
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
                    'Cargando...',
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
    );
    _overlayEntry = overlayEntry;
    Overlay.of(context, rootOverlay: true).insert(overlayEntry);
  }

  static void hide() {
    if (_loadingCount <= 0) return;
    _loadingCount--;
    if (_loadingCount == 0) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  static void initState() {
    _loadingCount = 0;
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
