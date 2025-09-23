
import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:flutter/material.dart';

class IdentificationModel extends BaseProvider {
  CameraController? cameraController;
  late final FaceDetector _faceDetector;

  String _hintText = "Por favor continue sorrindo";
  String get hintText => _hintText;

  IdentificationModel() {
    _faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        enableClassification: true,
        enableTracking: true,
        enableContours: true,
        enableLandmarks: true,
      ),
    );
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
          (cam) => cam.lensDirection == CameraLensDirection.front,
    );

    cameraController = CameraController(
      frontCamera,
      ResolutionPreset.medium,
      enableAudio: false,
    );

    await cameraController!.initialize();
    cameraController!.startImageStream(_processCameraImage);

    notifyListeners();
  }

  Future<void> _processCameraImage(CameraImage image) async {
    try {
      final WriteBuffer allBytes = WriteBuffer();
      for (final Plane plane in image.planes) {
        allBytes.putUint8List(plane.bytes);
      }
      final bytes = allBytes.done().buffer.asUint8List();

      final camera = cameraController!.description;
      final imageRotation =
          InputImageRotationValue.fromRawValue(camera.sensorOrientation) ??
              InputImageRotation.rotation0deg;

      final inputImage = InputImage.fromBytes(
        bytes: bytes,
        metadata: InputImageMetadata(
          size: Size(image.width.toDouble(), image.height.toDouble()),
          rotation: imageRotation,
          format: InputImageFormatValue.fromRawValue(image.format.raw) ??
              InputImageFormat.nv21,
          bytesPerRow: image.planes.first.bytesPerRow,
        ),
      );

      final faces = await _faceDetector.processImage(inputImage);

      if (faces.isNotEmpty) {
        final face = faces.first;
        final headEulerY = face.headEulerAngleY ?? 0;
        final headEulerX = face.headEulerAngleX ?? 0;

        if (headEulerY.abs() > 15 || headEulerX.abs() > 15) {
          _updateHint("Por favor, continue de frente para a câmera");
        } else {
          _updateHint("Por favor continue sorrindo");
        }
      }
    } catch (e) {
      debugPrint("Face detection error: $e");
    }
  }

  void _updateHint(String text) {
    if (_hintText != text) {
      _hintText = text;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    cameraController?.dispose();
    _faceDetector.close();
    super.dispose();
  }
}

