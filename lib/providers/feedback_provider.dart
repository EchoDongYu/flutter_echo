import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/services/api_service.dart';

class FeedbackModel extends BaseProvider {
  /// 14 意见反馈
  static const dictType = 14;
  static Map<String, List<StepItem>?>? _stepItems;

  Future<Map<String, List<StepItem>?>?> getDictionary() async {
    if (_stepItems?.isNotEmpty == true) return _stepItems;
    return await launchRequest(() async {
      final apiResult = await Api.getDictionary(dictType.toString());
      _stepItems = apiResult;
      return apiResult;
    });
  }

  Future<bool?> submitFeedback({
    required String type,
    required String? content,
  }) async {
    return await launchRequest(() async {
      return await Api.submitFeedback(type: type, content: content);
    });
  }
}
