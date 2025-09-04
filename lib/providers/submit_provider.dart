import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/services/api_service.dart';

class SubmitModel extends BaseProvider {
  static const _types = [0, 6, 3, 12, 5, 1, 4, 7, 2, 8, 10];
  Map<String, List<StepItem>?>? _stepItems;

  Future<Map<String, List<StepItem>?>?> getDictionary() async {
    if (_stepItems?.isNotEmpty == true) return _stepItems;
    return await launchRequest(() async {
      final apiResult = await Api.getDictionary(_types.join(','));
      _stepItems = apiResult;
      return apiResult;
    });
  }
}
