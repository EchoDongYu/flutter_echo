import 'package:flutter_echo/utils/common_utils.dart';
import 'package:in_app_review/in_app_review.dart';

///好评服务类
class PraiseService {
  final InAppReview _inAppReview = InAppReview.instance;

  // 请求评价的方法
  Future<void> requestReview() async {
    try {
      // 检查是否可以请求好评
      if (await _inAppReview.isAvailable()) {
        // 调用 Google Play Store 提供的 API 请求好评
        await _inAppReview.requestReview();
      } else {
        // 如果无法请求好评，则可以引导用户到应用商店的评价页面
        await _inAppReview.openStoreListing();
      }
    } catch (e) {
      // 错误处理
      debugLog(e.toString());
    }
  }
}
