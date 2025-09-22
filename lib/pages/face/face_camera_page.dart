import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/providers/camera_provider.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// 授信拍照页面
class FaceCameraPage extends StatelessWidget {
  const FaceCameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cameraProvider = context.watch<CameraModel>();

    if (!cameraProvider.isReady || cameraProvider.controller == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          CameraPreview(cameraProvider.controller!),

          // 返回按钮
          Positioned(
            top: 56.h,
            left: 24.w,
            child: GestureDetector(
              onTap: () => context.pop(true),
              child: Image.asset(
                Drawable.iconReturn,
                width: 36.w,
                height: 36.h,
              ),
            ),
          ),

          // 顶部提示文字
          Positioned(
            top: 126.h,
            left: 20.w,
            right: 20.w,
            child: Text(
              "Certifique-se de que o seu documento de identidade está dentro da moldura antes de tirar a foto",
              style: TextStyle(
                color: NowColors.c0xFFFFFFFF,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // 中间矩形框
          Positioned(
            top: 230.h,
            left: 20.w,
            right: 20.w,
            child: CommonBox(
              height: 210.h,
              borderWidth: 1,
              borderColor: NowColors.c0xFFFFFFFF,
              color: NowColors.c0x00000000,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          //拍照后矩形框
          // Positioned(
          //   top: 230.h,
          //   left: 20.w,
          //   right: 20.w,
          //   child:  DottedBorder(
          //     options: RoundedRectDottedBorderOptions(
          //       dashPattern: [10, 5],
          //       strokeWidth: 2,
          //      color: NowColors.c0xFFFFFFFF,
          //       radius:Radius.circular(16),
          //     ),
          //     child: CommonBox(
          //       height: 210.h,
          //       padding: EdgeInsets.zero,
          //       color: NowColors.c0x00000000,
          //     ),
          //   ),
          // ),

          // 底部拍照按钮
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CommonBox(
              padding: EdgeInsets.symmetric(vertical: 22.h),
              color: NowColors.c0xFF000000,
              borderRadius: BorderRadius.zero,
              height: 125.h,
              child: GestureDetector(
                onTap: () async {
                  final path = await cameraProvider.takePhoto();
                  if (path != null && context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("照片已保存: $path")),
                    );
                  }
                },
                // child: Image.asset(
                //   Drawable.iconPhotoTake,
                //   width: 82.w,
                //   height: 82.h,
                // ),
                child: Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    Expanded(
                      child: Image.asset(
                        Drawable.iconPhotoFinish,
                        width: 82.w,
                        height: 82.h,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 50.w),
                        child: Image.asset(
                          Drawable.iconRefresh,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}