import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/services/api_service.dart';

class WhatsappModel extends BaseProvider {
  static String? _whatsapp;

  Future<String?> getDictionary() async {
    if (_whatsapp?.isNotEmpty == true) return _whatsapp;
    return await launchRequest(() async {
      final apiResult = await Api.getDictionary('17');
      final value = apiResult['17']?.firstOrNull?.value;
      _whatsapp = value;
      return value;
    });
  }
}
