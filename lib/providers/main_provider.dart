import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/services/api_service.dart';

class MainModel extends BaseProvider {
  Future<HomeInfoResp?> getHomeInfo() async {
    return await launchRequest(() async {
      return await Api.getHomeInfo();
    });
  }
}
