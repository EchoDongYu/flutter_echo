import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/pages/face/face_view/face_photo_box.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

///拍照引导
class FaceGuideDialog extends StatelessWidget {
  const FaceGuideDialog({super.key, required this.type});

  final int type;

  /// 显示拍照引导弹窗
  static Future<bool?> show(BuildContext context, int type) {
    return showModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (_) => FaceGuideDialog(type: type,),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop(true);
                  },
                  child: Image.asset(
                    Drawable.iconClear,
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
                Text(
                  "Frente do Bl",
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
          type == 1 ? FacePhotoBox(
            facePhotoUrl: Drawable.iconIdCard,
            faceTipsUrl: Drawable.iconIdFront,
          ) :  FacePhotoBox(
            facePhotoUrl: Drawable.iconIdCardBack,
            faceTipsUrl: Drawable.iconIdBack,
          ),
          SizedBox(height: 36.h),
          CommonBox(
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
                  child: EchoOutlinedButton(
                    text: "Seleccionar imagen",
                    onPressed: () {
                      context.pop(true);
                    },
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: EchoPrimaryButton(
                    text: "Tomar fotografia",
                    onPressed: () {
                      context.push(AppRouter.faceCamera);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
