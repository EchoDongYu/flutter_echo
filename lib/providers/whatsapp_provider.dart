import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/services/api_service.dart';

class WhatsappModel extends BaseProvider {
  /// 17 whatsapp
  static const _dictType = '17';
  static String? _whatsapp;

  Future<String?> getDictionary() async {
    if (_whatsapp?.isNotEmpty == true) return _whatsapp;
    return await launchRequest(() async {
      final apiResult = await Api.getDictionary(_dictType);
      final value = apiResult[_dictType]?.firstOrNull?.value;
      _whatsapp = value;
      return value;
    });
  }
}
