import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';

class CameraModel extends ChangeNotifier {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isReady = false;
  bool get isReady => _isReady;
  CameraController? get controller => _controller;

  Future<void> initCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(
      _cameras!.first,
      ResolutionPreset.high,
      enableAudio: false,
    );
    await _controller!.initialize();
    _isReady = true;
    notifyListeners();
  }

  Future<String?> takePhoto() async {
    if (!(_controller?.value.isInitialized ?? false)) return null;
    final file = await _controller!.takePicture();
    debugPrint("file_path:${file.path}");
    return file.path;
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
