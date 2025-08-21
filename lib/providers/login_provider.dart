import 'package:flutter/material.dart';
import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/services/api_service.dart';

class LoginProvider extends BaseProvider {
  void nextStep(BuildContext context, {required String mobile}) => launch(
    context,
    onRequest: () async {
      final check = await Api.isRegister(mobile: mobile);
      check.qm5h5tOIsRegistered;
    },
    onError: (code, msg) async {},
  );
}
