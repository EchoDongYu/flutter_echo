import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// 授信拍照页面
class FaceCameraPage extends StatefulWidget {
  const FaceCameraPage({super.key});

  @override
  State<FaceCameraPage> createState() => _FaceCameraPageState();
}

class _FaceCameraPageState extends State<FaceCameraPage> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(
      _cameras!.first,
      ResolutionPreset.high,
      enableAudio: false,
    );
    await _controller!.initialize();
    setState(() => _isReady = true);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _takePhoto() async {
    if (!_controller!.value.isInitialized) return;
    final file = await _controller!.takePicture();
    if (!mounted) return;
    debugPrint("file_path:${file.path}");
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          CameraPreview(_controller!),

          Positioned(
            top: 56.h,
            left: 24.w,
            child: GestureDetector(
              onTap: () {
                context.pop(true);
              },
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

          // 中间矩形框 + 遮罩
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
                onTap: _takePhoto,
                // child: Image.asset(
                //   Drawable.iconPhotoTake,
                //   width: 82.w,
                //   height: 82.h,
                // ),
                child: Row(
                  children: [
                    Expanded(child: SizedBox()),
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
