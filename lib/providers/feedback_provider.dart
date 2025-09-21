import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/services/api_service.dart';

class FeedbackModel extends BaseProvider {
  /// 14 意见反馈
  static const _dictType = '14';
  static List<DictItem>? _stepItems;

  Future<List<DictItem>?> getDictionary() async {
    if (_stepItems?.isNotEmpty == true) return _stepItems;
    return await launchRequest(() async {
      final apiResult = await Api.getDictionary(_dictType);
      _stepItems = apiResult[_dictType];
      return apiResult[_dictType];
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
