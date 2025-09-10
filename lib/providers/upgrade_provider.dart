import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/services/api_service.dart';

class UpgradeModel extends BaseProvider {
  Future<MainInfoResp?> getMainBaseInfo() async {
    return await launchRequest(() async {
      return await Api.getMainBaseInfo();
    });
  }
}
