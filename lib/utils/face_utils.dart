import 'dart:math';
import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:camera/camera.dart';

class FaceConst {
  static const double ANGLE_FRONT = 15.0;
  static const double ANGLE_HEAD_LR = 20.0;
  static const double ANGLE_HEAD_TB = 15.0;
  static const double ANGLE_HEAD_TB_U = 10.0;
  static const double PROBABILITY_SMILE = 0.7;
  static const double PROBABILITY_EYES = 0.3;
  static const double RATIO_MOUSE = 0.05;
}

class FaceCenterRatio {
  static const double MIN_LEFT = 0.2;
  static const double MAX_RIGHT = 0.8;
  static const double MIN_TOP = 0.2;
  static const double MAX_BOTTOM =0.7;
  static const double WIDTH_MIN = 0.5;
  static const double WIDTH_MAX = 0.8;
}



enum LivenessAction {
  AWAITING_FRONTAL,
  SMILE,
  BLINK,
  MOUTH_OPEN,
  HEAD_NOD,
  HEAD_SHAKE,
}

// 扩展 LivenessAction，添加一个 getValue 方法来获取数字
extension LivenessActionExtension on LivenessAction {
  int get value {
    switch (this) {
      case LivenessAction.AWAITING_FRONTAL:
        return 1;
      case LivenessAction.SMILE:
        return 2;
      case LivenessAction.BLINK:
        return 3;
      case LivenessAction.MOUTH_OPEN:
        return 4;
      case LivenessAction.HEAD_NOD:
        return 5;
      case LivenessAction.HEAD_SHAKE:
        return 6;
    }
  }
}

class ActionUtils {
  // --- 状态变量 ---
  double? _lastHeadAngleY; // 摇头
  double? _leftHeadAngleY;
  double? _rightHeadAngleY;
  bool _isTurningLeft = false;
  bool _isTurningRight = false;

  double? _lastHeadAngleX; // 点头
  double? _topHeadAngleX;
  double? _bottomHeadAngleX;
  bool _isTurningUp = false;
  bool _isTurningDown = false;





  (bool, String) isWholeFace(Face face,   double imageWidth, double imageHeight) {
    final boundingBox = face.boundingBox;
    final coutours = face.contours[FaceContourType.face];
    if (coutours == null) return   (false, "");
    final top = boundingBox.top;
    final bottom = boundingBox.bottom;
    final left = coutours.points[27].x;
    final right = coutours.points[9].x;
    debugPrint("boundingBox=${boundingBox},imageWidth=${imageWidth},imageHeight=${imageHeight},left=${left},right=${right}");
    bool isWholeFace= top > 0 && bottom < imageHeight && left > 0 && right < imageHeight;

    if(!isWholeFace){ //将你的脸部移至屏幕中央
      return (false, "Baja tu rostro al centro de la pantalla");
    }
    return (true, "");
  }

  /// 计算圆形区域的内切矩形边界
  Rect getCircleInnerRect(double previewWidth, double previewHeight) {
    final double radius = previewWidth / 2;  // 圆的半径
    final double centerX = previewWidth / 2; // 圆心 X 坐标
    final double centerY = previewHeight / 2; // 圆心 Y 坐标

    final double rectSize = radius * math.sqrt(2); // 内切矩形的边长

    final double left = centerX - rectSize / 2;
    final double top = centerY - rectSize / 2;
    final double right = centerX + rectSize / 2;
    final double bottom = centerY + rectSize / 2;

    return Rect.fromLTRB(left, top, right, bottom);
  }

  /// 动作是否需要正脸前置条件
  bool actionBeforeFaceIsFront(LivenessAction action) {
    return action == LivenessAction.AWAITING_FRONTAL ||
        action == LivenessAction.SMILE ||
        action == LivenessAction.BLINK ||
        action == LivenessAction.MOUTH_OPEN;
  }

  /// 是否为头部动作
  bool actionIsHead(LivenessAction action) {
    return action == LivenessAction.HEAD_NOD ||
        action == LivenessAction.HEAD_SHAKE;
  }

  /// 是否为正脸
  bool isFront(Face face) {
    final yaw = face.headEulerAngleY  ?? 0;
    final pitch = face.headEulerAngleX  ?? 0;
    return yaw.abs()  < FaceConst.ANGLE_FRONT &&
        pitch.abs()  < FaceConst.ANGLE_FRONT;
  }

  /// 检测摇头动作
  bool detectHeadShake(Face face) {
    _lastHeadAngleY = face.headEulerAngleY;
    if (_lastHeadAngleY != null) {
      if (_lastHeadAngleY! > FaceConst.ANGLE_HEAD_LR) {
        _leftHeadAngleY = _lastHeadAngleY;
        _isTurningLeft = true;
      }
      if (_lastHeadAngleY! < -FaceConst.ANGLE_HEAD_LR) {
        _rightHeadAngleY = _lastHeadAngleY;
        _isTurningRight = true;
      }
    }
    return _isTurningLeft && _isTurningRight;
  }

  /// 检测点头动作
  bool detectHeadNod(Face face) {
    _lastHeadAngleX = face.headEulerAngleX;
    if (_lastHeadAngleX != null) {
      if (_lastHeadAngleX! < -FaceConst.ANGLE_HEAD_TB) {
        _bottomHeadAngleX = _lastHeadAngleX;
        _isTurningUp = true;
      }
      if (_lastHeadAngleX! > FaceConst.ANGLE_HEAD_TB_U) {
        _topHeadAngleX = _lastHeadAngleX;
        _isTurningDown = true;
      }
    }
    return _isTurningUp && _isTurningDown;
  }

  /// 重置状态
  void resetTurningStates() {
    _lastHeadAngleY = _leftHeadAngleY = _rightHeadAngleY = null;
    _isTurningLeft = _isTurningRight = false;

    _lastHeadAngleX = _topHeadAngleX = _bottomHeadAngleX = null;
    _isTurningUp = _isTurningDown = false;
  }

  /// 检测微笑
  bool detectSmile(Face face) {
    return (face.smilingProbability  ?? 0) > FaceConst.PROBABILITY_SMILE;
  }

  /// 检测眨眼
  bool detectBlink(Face face) {
    final leftEyeProb = face.leftEyeOpenProbability  ?? 1;
    final rightEyeProb = face.rightEyeOpenProbability  ?? 1;
    return leftEyeProb < (1 - FaceConst.PROBABILITY_EYES) &&
        rightEyeProb < (1 - FaceConst.PROBABILITY_EYES);
  }

  /// 检测张嘴
  bool detectMouthOpen(Face face) {
    return getMouthParam(face) > FaceConst.RATIO_MOUSE;
  }

  /// 计算嘴巴开合度
  double getMouthParam(Face face) {
    final upperLip = face.contours[FaceContourType.upperLipBottom]?.points;
    final lowerLip = face.contours[FaceContourType.lowerLipTop]?.points;

    if (upperLip == null || lowerLip == null || upperLip.isEmpty  || lowerLip.isEmpty)  {
      return 0;
    }

    final upperAvgY = upperLip.map((p)  => p.y).reduce((a, b) => a + b) / upperLip.length;
    final lowerAvgY = lowerLip.map((p)  => p.y).reduce((a, b) => a + b) / lowerLip.length;
    final gapPx = max(0, lowerAvgY - upperAvgY);
    final faceHeight = max(1, face.boundingBox.height.toDouble());

    return gapPx / faceHeight;
  }
}