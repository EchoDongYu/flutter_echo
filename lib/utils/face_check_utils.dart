import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/utils/face_utils.dart';

import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';

extension LivenessActionExtension on LivenessAction {
  String get instruction {
    switch (this) {
      case LivenessAction.AWAITING_FRONTAL:
        return 'Alinea tu rostro con la cámara';//请正对屏幕 Alinea tu rostro con la cámara
      case LivenessAction.SMILE:
        return 'Por favor, toma la foto del frente primero';// 请微笑 Por favor, toma la foto del frente primero
      case LivenessAction.BLINK:
        return 'Por favor, parpadea';//请眨眼 Por favor, parpadea
      case LivenessAction.MOUTH_OPEN:
        return 'Abre la boca';//请张嘴 Abre la boca
      case LivenessAction.HEAD_SHAKE:
        return 'Mueve la cabeza de lado a lado';//请摇头 Mueve la cabeza de lado a lado
      case LivenessAction.HEAD_NOD:
        return 'Asiente con la cabeza hacia arriba y abajo';// 请点头 Asiente con la cabeza hacia arriba y abajo
    }
  }
}

abstract class FaceCaptureResult {
  final String? message;

  const FaceCaptureResult(this.message);
}

class NoFaceDetected extends FaceCaptureResult {
  NoFaceDetected() : super('No se detectó ningún rostro');
}

class FaceError extends FaceCaptureResult {
  final dynamic error;

  FaceError(this.error) : super('error: $error');
}

class ActionInProgress extends FaceCaptureResult {
  final LivenessAction action;

  ActionInProgress(String super.instruction)
    : action = LivenessAction.values.firstWhere(
        (a) => a.instruction == instruction,
        orElse: () => LivenessAction.AWAITING_FRONTAL, // 默认动作
      );
}

class FaceCompleted extends FaceCaptureResult {
  final LinkedHashMap<LivenessAction, String> capturedImages;

  FaceCompleted(this.capturedImages) : super('');
}

class FaceCompleted2 extends FaceCaptureResult {
  final Uint8List? uint8list;
  final String? file;

  FaceCompleted2(this.uint8list, this.file) : super('');
}

class FaceAnalyzer {
  final int numRandomActions;
  final bool isShuffle;
  final CameraController cameraController;
  final ValueNotifier<FaceCaptureResult> resultNotifier;
  final ActionUtils actionUtils = ActionUtils();



  // 人脸检测器配置
  final FaceDetector _detector = FaceDetector(
    options: FaceDetectorOptions(
      performanceMode: FaceDetectorMode.fast,
      enableClassification: true,
      enableTracking: true,
      enableContours: true,
      enableLandmarks: true,
      minFaceSize: 0.9,
    ),
  );

  // 状态管理
  List<LivenessAction> _actionQueue = [];
  int _currentActionIndex = 0;
  bool _isCompleted = false;
  final LinkedHashMap <LivenessAction, String> _capturedImages = LinkedHashMap<LivenessAction, String>();
  DateTime _lastAnalysisTime = DateTime.now();

  FaceAnalyzer({
    required this.cameraController,
    required this.resultNotifier,
    this.numRandomActions = 2,
    this.isShuffle = true,
  }) {
    _initActionQueue();
  }

  void _initActionQueue() {
    final actionPool = List<LivenessAction>.from([
      LivenessAction.SMILE,
      LivenessAction.BLINK,
      LivenessAction.HEAD_SHAKE,
      LivenessAction.HEAD_NOD,
      LivenessAction.MOUTH_OPEN,
    ]);

    if (isShuffle) actionPool.shuffle();

    _actionQueue = [LivenessAction.AWAITING_FRONTAL]
      ..addAll(actionPool.take(numRandomActions));
  }

  double _imageWidth = 0;
  double _imageHeight = 0;

  // 全局状态标记
  bool _isCaptureInProgress = false;

  Future<void> analyze(CameraImage image) async {
    if (_isCompleted || _isCaptureInProgress) return;

    // 限流：每80ms处理一帧
    if (DateTime.now().difference(_lastAnalysisTime).inMilliseconds < 80)
      return;
    _lastAnalysisTime = DateTime.now();

    try {
      final inputImage = await detectFaces3(image);

      if (inputImage == null) {
        debugPrint("inputImage=null");
        return;
      }

      if (_needUpdateImageInfo) {
        final imageSize = inputImage.metadata!.size;
        final rotatiton = inputImage.metadata!.rotation;
        switch (rotatiton) {
          case InputImageRotation.rotation180deg:
          case InputImageRotation.rotation0deg:
            _imageWidth = imageSize.width;
            _imageHeight = imageSize.height;
            break;
          case InputImageRotation.rotation270deg:
          case InputImageRotation.rotation90deg:
            _imageWidth = imageSize.height;
            _imageHeight = imageSize.width;
            break;
        }
        _needUpdateImageInfo = false;
      }

      debugPrint("Image size: ${image.width}x${image.height}");
      debugPrint("Image format: ${inputImage.metadata?.format.toString()}");

      final faces = await _detector.processImage(inputImage);

      debugPrint("faces=${faces}");
      if (faces.isEmpty) {
        resultNotifier.value = NoFaceDetected();
        return;
      }

      await _processFaceForAction(faces.first, image);
    } catch (e) {
      debugPrint("errror==${e}");
      resultNotifier.value = FaceError(e);
    }
  }

  bool _needUpdateImageInfo = true;

  Future<void> _processFaceForAction(Face face, CameraImage image) async {
    if (_currentActionIndex >= _actionQueue.length || _isCaptureInProgress) {
      return;
    }

    final currentAction = _actionQueue[_currentActionIndex];
    // final transRect = transUtils.mapFaceToView(face, image);
    // if (transRect == null) {
    //   return;
    // }

    final (isValid, tips) = actionUtils.isWholeFace(
      face,
      _imageWidth,
      _imageHeight,
    );

    if (!isValid) {
      resultNotifier.value = ActionInProgress(tips);
      return;
    }

    // 检查正脸
    if (!actionUtils.isFront(face) &&
        actionUtils.actionBeforeFaceIsFront(currentAction)) {
      resultNotifier.value = ActionInProgress(
        LivenessAction.AWAITING_FRONTAL.instruction,
      );
      return;
    }

    // 执行动作检测
    bool actionSuccessful;
    switch (currentAction) {
      case LivenessAction.AWAITING_FRONTAL:
        actionSuccessful = actionUtils.isFront(face);
      case LivenessAction.SMILE:
        actionSuccessful = actionUtils.detectSmile(face);
      case LivenessAction.BLINK:
        actionSuccessful = actionUtils.detectBlink(face);
      case LivenessAction.MOUTH_OPEN:
        actionSuccessful = actionUtils.detectMouthOpen(face);
      case LivenessAction.HEAD_SHAKE:
        actionSuccessful = actionUtils.detectHeadShake(face);
      case LivenessAction.HEAD_NOD:
        actionSuccessful = actionUtils.detectHeadNod(face);
    }

    if (actionSuccessful) {
      debugPrint(
        'Current action actionSuccessful: ${currentAction.instruction},_currentActionIndex={$_currentActionIndex',
      );
      return await _captureAndProceed(currentAction, image);
    } else {
      resultNotifier.value = ActionInProgress(currentAction.instruction);
    }
  }

  Future<void> _captureAndProceed(
    LivenessAction action,
    CameraImage image,
  ) async {
    XFile? uiImage = await _takePhoto();
    debugPrint('Current action _actionQueue: $_actionQueue');
    debugPrint('Current action index: $_currentActionIndex，${action.instruction}');
    _capturedImages[action] = uiImage?.path ?? "";
    // 在递增之前确保不会越界
    _currentActionIndex++;

    actionUtils.resetTurningStates();
    if (_currentActionIndex < _actionQueue.length) {
      debugPrint(
        'Current action index Next: $_currentActionIndex，next action=${_actionQueue[_currentActionIndex].instruction}',
      );
    }

    debugPrint('Queue length Next : ${_actionQueue.length}');

    if (_currentActionIndex < _actionQueue.length) {
      resultNotifier.value = ActionInProgress(
        _actionQueue[_currentActionIndex].instruction,
      );
    } else {
      _isCompleted = true;
      resultNotifier.value = FaceCompleted(_capturedImages);
    }
  }

  final _orientations = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };

  Future<InputImage?> detectFaces3(CameraImage image) async {
    try {
      final WriteBuffer allBytes = WriteBuffer();
      for (Plane plane in image.planes) {
        allBytes.putUint8List(plane.bytes);
      }
      final bytes = allBytes.done().buffer.asUint8List();

      final controller = cameraController;
      final camera = cameraController.description;
      if (!controller.value.isInitialized) {
        return null;
      }

      final sensorOrientation = camera.sensorOrientation;

      var rotationCompensation =
          _orientations[controller.value.deviceOrientation];
      if (rotationCompensation == null) return null;
      if (camera.lensDirection == CameraLensDirection.front) {
        // front-facing
        rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
      } else {
        // back-facing
        rotationCompensation =
            (sensorOrientation - rotationCompensation + 360) % 360;
      }
      InputImageRotation? rotation = InputImageRotationValue.fromRawValue(
        rotationCompensation,
      );

      debugPrint("rotation=${rotation}");
      if (rotation == null) return null;

      final inputImage = InputImage.fromBytes(
        bytes: bytes,
        metadata: InputImageMetadata(
          size: Size(image.width.toDouble(), image.height.toDouble()),
          rotation: rotation,
          format: InputImageFormat.nv21,
          bytesPerRow: image.planes[0].bytesPerRow,
        ),
      );
      // if(isInit==false||file==null) {
      //   XFile? mfile = await _takePhoto();
      //   file=mfile?.path;
      //   resultNotifier.value = FaceCompleted2(
      //       bytes, mfile?.path
      //   );
      //   isInit=true;
      // }
      return inputImage;
    } catch (e) {
      debugPrint('Error in face detection: $e');
    }
  }

  Future<XFile?> _takePhoto() async {
    // 状态检查与锁定
    // if (_isCaptureInProgress) {
    //   debugPrint('_takePhoto 拍照被阻止：前次操作未完成');
    //   return null;
    // }

    try {
      _isCaptureInProgress = true;
      // await cameraController.stopImageStream(); // 暂停图像流

      final XFile? file = await cameraController.takePicture();

      return file;
    } on CameraException catch (e) {
      debugPrint('_takePhoto 相机异常: ${e.code}  - ${e.description}');
      return null;
    } finally {
      // 确保状态复位
      //  Future.delayed(const Duration(milliseconds: 300), () {
      //   _isCaptureInProgress = false;
      //   debugPrint('_takePhoto 相机资源已释放');
      // });
      _isCaptureInProgress = false;
      // await cameraController.startImageStream(analyze);
    }
  }

  // 辅助方法：CameraImage 转 Image
  Future<Image> _convertToUiImage(CameraImage image) async {
    final completer = Completer<Image>();
    decodeImageFromList(
      Uint8List.fromList(image.planes[0].bytes),
      (Image img) => completer.complete(img),
    );
    return completer.future;
  }

  void dispose() {
    _detector.close();
  }
}
