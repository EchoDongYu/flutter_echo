import 'dart:async';

import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/services/api_service.dart';
import 'package:go_router/go_router.dart';

class StepStatusModel extends BaseProvider {
  Timer? _timer;

  void refreshSubmitResult(int total) async {
    _timer = Timer.periodic(Duration(seconds: total), (timer) async {
      timer.cancel();
      final apiResult = await launchRequest(
        () => Api.refreshSubmitResult(),
        showLoading: false,
        toastError: false,
      );
      switch (apiResult?.bopomofoOCreditStatus) {
        case 1:
          refreshSubmitResult(total);
          return;
        case 2:
          final productId = apiResult?.foreyardOProductId;
          final amount = apiResult?.nookieOCanBorrowAmount;
          if (productId == null || amount == null || amount <= 0) {
            navigate((context) => context.go(AppRouter.main));
            return;
          }
          final uriRoute = Uri(
            path: AppRouter.applyConfirm,
            queryParameters: {
              NavKey.id: productId.toString(),
              NavKey.amount: amount.toString(),
            },
          );
          pushReplacement(uriRoute.toString());
          return;
        case 3:
          pushReplacement(AppRouter.stepFailed);
          return;
        default:
          refreshSubmitResult(total * 2);
          return;
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
