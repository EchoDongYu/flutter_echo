import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// 授信拍照页面
class CertCameraPage extends StatefulWidget {
  const CertCameraPage({super.key});

  @override
  State<CertCameraPage> createState() => _CertCameraPageState();
}

class _CertCameraPageState extends State<CertCameraPage> {
  late CameraController _controller;
  late List<CameraDescription> _cameras;
  bool _isReady = false;
  Uint8List? _fileData;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(
      _cameras.first,
      ResolutionPreset.high,
      enableAudio: false,
    );
    await _controller.initialize();
    setState(() => _isReady = true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _takePhoto() async {
    if (!_controller.value.isInitialized) return;
    final file = await _controller.takePicture();
    final fileData = await file.readAsBytes();
    setState(() => _fileData = fileData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NowColors.c0xFF000000,
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (_isReady)
            if (_fileData != null)
              Image.memory(_fileData!)
            else
              CameraPreview(_controller),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(24),
                  child: GestureDetector(
                    onTap: () => context.pop(),
                    child: Image.asset(
                      Drawable.iconReturn,
                      width: 36.w,
                      height: 36.h,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 22.h),
                  alignment: Alignment.bottomCenter,
                  color: NowColors.c0xFF000000,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: _fileData == null
                        ? GestureDetector(
                            onTap: _takePhoto,
                            child: Image.asset(
                              Drawable.iconPhotoTake,
                              width: 82.w,
                              height: 82.h,
                            ),
                          )
                        : Row(
                            children: [
                              Expanded(child: SizedBox()),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => context.pop(_fileData),
                                  child: Image.asset(
                                    Drawable.iconPhotoFinish,
                                    width: 82.w,
                                    height: 82.h,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => setState(() => _fileData = null),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
