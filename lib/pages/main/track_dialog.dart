import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackUploadDialog extends StatefulWidget {
  const TrackUploadDialog({super.key});

  @override
  State<TrackUploadDialog> createState() => _TrackUploadDialogState();
}

class _TrackUploadDialogState extends State<TrackUploadDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                Image.asset(
                  Drawable.imageShildsequere,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                Text(
                  'Se estan cargando datos personales para evaluar su riesgo',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: NowColors.c0xFF494C4F,
                    height: 24 / 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      SizedBox(height: 12.h),
                      Text(
                        'Se estacalculando su credito de prestamo,espere pacientemente',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: NowColors.c0xFF1C1F23,
                          height: 30 / 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 36.h),
        ],
      ),
    );
  }
}

class TrackIntroDialog extends StatelessWidget {
  const TrackIntroDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
