import 'package:flutter/cupertino.dart';
import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/services/api_service.dart';

class SubmitModel extends BaseProvider {
  static const _types = [0, 6, 3, 12, 5, 1, 4, 7, 2, 8, 10];
  Map<String, List<StepItem>> stepItems = {};
  Map<String, StepItem>? selectedItem;
  Map<String, TextEditingController> stepCtrls = {};

  void init() {
    stepItems = {};
  }

  Future<void> getDictionary() async {
    return await launchRequest(() async {
      stepItems = await Api.getDictionary(_types.join(','));
    });
  }
}
