import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/services/api_service.dart';

class TrackModel extends BaseProvider {
  Future<bool?> uploadTrack() async {
    await Future.delayed(Duration(seconds: 5));
    return await launchRequest(() => Api.uploadTrack(), showLoading: false);
  }
}
