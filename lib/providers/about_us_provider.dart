import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/services/api_service.dart';

class AboutUsModel extends BaseProvider {
  /// 17 whatsapp 18 客服邮箱 21 客服热线 23 公司官网 24 公司地址
  static const dictTypes = [18, 17, 23, 24];
  static Map<String, List<DictItem>?>? _stepItems;

  Future<Map<String, List<DictItem>?>?> getDictionary() async {
    if (_stepItems?.isNotEmpty == true) return _stepItems;
    return await launchRequest(() async {
      final apiResult = await Api.getDictionary(dictTypes.join(','));
      _stepItems = apiResult;
      return apiResult;
    });
  }
}
