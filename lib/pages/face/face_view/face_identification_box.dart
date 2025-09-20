import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
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
          _updateHint("Por favor, continue de frente para a câmera");
        } else if (headEulerY < -15) {
          _updateHint("Por favor, continue de frente para a câmera");
        } else if (headEulerX > 15) {
          _updateHint("Por favor, continue de frente para a câmera");
        } else if (headEulerX < -15) {
          _updateHint("Por favor, continue de frente para a câmera");
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
