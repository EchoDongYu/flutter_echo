import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/pages/face/face_view/face_photo_box.dart';
import 'package:flutter_echo/providers/id_card_provider.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

///人脸引导
class FaceGuideDialog extends StatelessWidget {
  const FaceGuideDialog({super.key});

  /// 显示拍照引导弹窗
  static Future<bool?> show(BuildContext context) {
    return showModalBottomSheet<bool?>(
      context: context,
      enableDrag: false,
      isDismissible: true,
      isScrollControlled: true,
      builder: (_) => FaceGuideDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonBox(
      padding: EdgeInsets.zero,
      color: NowColors.c0xFFF3F3F5,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // GestureDetector(
                //   onTap: () {
                //     context.pop(null);
                //   },
                //   child: Image.asset(
                //     Drawable.iconClear,
                //     width: 20.w,
                //     height: 20.h,
                //   ),
                // ),
                Text(
                  "Foto facial",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: NowColors.c0xFF1C1F23,
                  ),
                ),
                SizedBox(width: 12),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          CommonBox(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
            child: Column(
              children: [
                Image.asset(Drawable.imageRosto1, width: 120.w, height: 120.h),
                SizedBox(height: 36.h),
                Image.asset(Drawable.imageRosto2, width: double.infinity, height: 114.h),
              ],
            ),
          ),
          // FacePhotoBox(
          //   facePhotoUrl: Drawable.imageRosto1,
          //   faceTipsUrl: Drawable.imageRosto2,
          // ),
          SizedBox(height: 36.h),
          SafeArea(child:      CommonBox(
            height: 68.h,
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: EchoPrimaryButton(
                    text: "Toma la foto ahora",
                    onPressed: () {
                      context.pop(true);
                    },
                  ),
                ),
              ],
            ),
          ),),

        ],
      ),
    );
  }
}
