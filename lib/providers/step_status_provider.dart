import 'dart:async';

import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/services/api_service.dart';
import 'package:go_router/go_router.dart';

class StepStatusModel extends BaseProvider {
  Timer? _timer;

  void refreshSubmitResult(int total) async {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      if (timer.tick == total) {
        _timer?.cancel();
        _timer = null;
        final apiResult = await launchRequest(
          () => Api.refreshSubmitResult(),
          showLoading: false,
          toastError: false,
        );
        switch (apiResult?.bopomofoOCreditStatus) {
          case 1:
            refreshSubmitResult(total);
          case 2:
            final uriRoute = Uri(
              path: AppRouter.applyConfirm,
              queryParameters: {
                NavKey.id: apiResult?.foreyardOProductId.toString(),
              },
            );
            navigate((context) => context.push(uriRoute.toString()));
          case 3:
            pushReplacement(AppRouter.stepFailed);
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
}
