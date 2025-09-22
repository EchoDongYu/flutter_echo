import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum RepayCertificateStatus { successes, progress, failure }

class RepayCertificateItem extends StatelessWidget {
  const RepayCertificateItem({super.key, required this.status});

  final RepayCertificateStatus status;

  // 状态对应的颜色和文字
  Map<String, dynamic> get _statusStyle {
    switch (status) {
      case RepayCertificateStatus.failure:
        return {"label": "Fallo", "color": NowColors.c0xFFFB4F34};
      case RepayCertificateStatus.progress:
        return {"label": "En curso", "color": NowColors.c0xFFFF9817};
      case RepayCertificateStatus.successes:
        return {"label": "Exitos", "color": NowColors.c0xFF3EB34D};
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonBox(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          CommonBox(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            color: NowColors.c0xFF3288F1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Hora de solicitud",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFFFFFFFF,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "19/07/2024 00:00:00",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFFFFFFFF,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "No. 28764457",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFFFFFFFF,
                      ),
                    ),
                    CommonBox(
                      width: 65.w,
                      height: 26.h,
                      padding: EdgeInsets.zero,
                      color: _statusStyle["color"],
                      borderWidth: 1,
                      borderColor: NowColors.c0xFFFFFFFF,
                      alignment: Alignment.center,
                      child: Text(
                        _statusStyle["label"],
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: NowColors.c0xFFFFFFFF,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CommonBox(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Depósito al banco",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFF77797B,
                      ),
                    ),
                    Text(
                      "Banco GyT continenta",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFF1C1F23,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Comprobante",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFF77797B,
                      ),
                    ),
                    CommonBox(
                      width: 44.w,
                      height: 44.h,
                      color: NowColors.c0xFFD8D8D8,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
