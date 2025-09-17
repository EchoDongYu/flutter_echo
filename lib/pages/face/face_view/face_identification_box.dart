import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_echo/common/app_theme.dart';
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
      ResolutionPreset.medium,
      enableAudio: false,
    );

    await _cameraController!.initialize();
    _cameraController!.startImageStream(_processCameraImage);
    if (mounted) setState(() {});
  }

  Future<void> _processCameraImage(CameraImage image) async {
    try {
      final WriteBuffer allBytes = WriteBuffer();
      for (final Plane plane in image.planes) {
        allBytes.putUint8List(plane.bytes);
      }
      final bytes = allBytes.done().buffer.asUint8List();

      final camera = _cameraController!.description;
      final imageRotation =
          InputImageRotationValue.fromRawValue(camera.sensorOrientation) ??
          InputImageRotation.rotation0deg;

      final inputImage = InputImage.fromBytes(
        bytes: bytes,
        metadata: InputImageMetadata(
          size: Size(image.width.toDouble(), image.height.toDouble()),
          rotation: imageRotation,
          format:
              InputImageFormatValue.fromRawValue(image.format.raw) ??
              InputImageFormat.nv21,
          bytesPerRow: image.planes.first.bytesPerRow,
        ),
      );

      final faces = await _faceDetector.processImage(inputImage);

      if (faces.isNotEmpty) {
        final face = faces.first;
        final headEulerY = face.headEulerAngleY ?? 0;
        final headEulerX = face.headEulerAngleX ?? 0;

        if (headEulerY > 15) {
          _updateHint("Por favor, vire à esquerda");
        } else if (headEulerY < -15) {
          _updateHint("Por favor, vire à direita");
        } else if (headEulerX > 15) {
          _updateHint("Por favor, olhe para cima");
        } else if (headEulerX < -15) {
          _updateHint("Por favor, olhe para baixo");
        } else {
          _updateHint(widget.hintText);
        }
      }
    } catch (e) {
      debugPrint("Face detection error: $e");
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
            ClipOval(
              child: SizedBox(
                width: widget.borderSize,
                height: widget.borderSize,
                child: CameraPreview(_cameraController!),
              ),
            ),
            SizedBox(
              width: widget.borderSize + widget.strokeWidth * 2,
              height: widget.borderSize + widget.strokeWidth * 2,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  // return CustomPaint(
                  //   painter: _CircleBorderPainter(
                  //     progress: _animationController.value,
                  //     strokeWidth: widget.strokeWidth,
                  //   ),
                  // );
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

// class _CircleBorderPainter extends CustomPainter {
//   final double progress;
//   final double strokeWidth;
//
//   _CircleBorderPainter({required this.progress, required this.strokeWidth});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final rect = Offset.zero & size;
//     final paint = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth
//       ..strokeCap = StrokeCap.round;
//
//     final startAngle = -90.0 * 3.14159 / 180;
//     final sweepAngle = 2 * 3.14159 * progress;
//
//     canvas.drawArc(
//       rect.deflate(strokeWidth / 2),
//       startAngle,
//       sweepAngle,
//       false,
//       paint,
//     );
//   }
//
//   @override
//   bool shouldRepaint(_CircleBorderPainter oldDelegate) => true;
// }

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
        child: Stack(
          alignment: Alignment.center,
          children: [
            // 圆形边框
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: NowColors.c0xFF3288F1,
                  width: strokeWidth,
                ),
              ),
            ),
            // 蓝点 1
            Align(alignment: Alignment.topCenter, child: _dot()),
            // 蓝点 2
            Align(alignment: Alignment.centerRight, child: _dot()),
            // 蓝点 3
            Align(alignment: Alignment.bottomCenter, child: _dot()),
            // 蓝点 4
            Align(alignment: Alignment.centerLeft, child: _dot()),
          ],
        ),
      ),
    );
  }

  Widget _dot() {
    return Container(
      width: 10,
      height: 10,
      decoration: const BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
    );
  }
}
