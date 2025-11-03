import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_echo/ui/dialogs/prompt_dialog.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_echo/utils/face_check_utils.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class FaceIdentificationBox extends StatefulWidget {
  final String hintText;
  final double borderSize;
  final double strokeWidth;

  const FaceIdentificationBox({
    super.key,
    this.hintText = "Por favor continue sorrindo",
    this.borderSize = 260,
    this.strokeWidth = 4,
  });

  @override
  State<FaceIdentificationBox> createState() => _FaceIdentificationBoxState();
}

class _FaceIdentificationBoxState extends State<FaceIdentificationBox>
    with SingleTickerProviderStateMixin {
  CameraController? _cameraController;
  late final FaceDetector _faceDetector;
  late AnimationController _animationController;

  String _currentHint = "";

  late final FaceAnalyzer _faceAnalyzer;
  final _resultNotifier = ValueNotifier<FaceCaptureResult>(
    ActionInProgress('初始化中'),
  );

  Uint8List? image;
  String? file;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    _faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        enableClassification: true,
        enableTracking: true,
        enableContours: true,
        enableLandmarks: true,
      ),
    );

    _initializeCamera();
    _currentHint = widget.hintText;
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
      (cam) => cam.lensDirection == CameraLensDirection.front,
    );

    _cameraController = CameraController(
      frontCamera,
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup
                .nv21 // Android 平台上，使用 NV21 格式
          : ImageFormatGroup.bgra8888, // iOS 平台上，使用 BGRA8888 格式
    );

    await _cameraController!.initialize();

    _faceAnalyzer = FaceAnalyzer(
      cameraController: _cameraController!,
      resultNotifier: _resultNotifier,
    );

    _cameraController!.startImageStream(_faceAnalyzer.analyze);
    _resultNotifier.addListener(_handleDetectionUpdate);

    if (mounted) setState(() {});
  }

  void _handleDetectionUpdate() {
    final result = _faceAnalyzer.resultNotifier.value;

    if (result is ActionInProgress || result is FaceError) {
      _updateHint(result.message!); // 使用原有方法更新提示
    }
    // if (result is FaceCompleted2) {
    //   setState(() {
    //     if (image == null||file==null) {
    //       debugPrint("uint8list=${result.uint8list?.length},file=${result.file}");
    //       image = result.uint8list;
    //     //  file=result.file;
    //     }
    //
    //
    //   });
    // }

    if (result is FaceCompleted) {
      if (mounted) {
        setState(() {
          print("capturedImages==${result.capturedImages}");
          _updateHint(result.message!);
        }); // 更新状态，如果需要

        // 在下一帧显示对话框
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          // 再次检查mounted，因为可能在这一帧期间页面被关闭了
          if (!mounted) return;

          final dialogResult = await PromptDialog.show(
            context: context,
            icon: Drawable.iconStatusRight2,
            title: 'Verificación completada',
            content: '',
            confirmText: 'Regresar',
            barrierDismissible: false,
            canPop: false,
          );
          // 对话框关闭后，重置标志位，以便下次完成时可以再次弹出（如果页面没有关闭）
          // 如果用户点击了确认，并且页面仍然存在，则关闭当前页面
          if (dialogResult == true && mounted) {
            Navigator.of(context).pop(result.capturedImages.values.toList());
          }
        });
      }
    }
  }

  void _updateHint(String text) {
    if (_currentHint != text) {
      setState(() {
        _currentHint = text;
      });
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _faceDetector.close();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipOval(
                    child: Transform.scale(
                      scale: 1,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: widget.borderSize,
                          height: widget.borderSize,
                          child: CameraPreview(_cameraController!),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widget.borderSize + widget.strokeWidth * 6,
                    height: widget.borderSize + widget.strokeWidth * 6,
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return RotatingBorder(
                          controller: _animationController,
                          size: widget.borderSize + widget.strokeWidth * 2,
                          strokeWidth: widget.strokeWidth,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        Text(
          _currentHint,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class RotatingBorder extends StatelessWidget {
  final AnimationController controller;
  final double size;
  final double strokeWidth;

  const RotatingBorder({
    super.key,
    required this.controller,
    required this.size,
    required this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: controller,
      child: SizedBox(
        width: size,
        height: size,
        child: Image.asset(Drawable.iconCirculate),
      ),
    );
  }
}
