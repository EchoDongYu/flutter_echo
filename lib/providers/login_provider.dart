import 'package:flutter/material.dart';
import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/services/api_service.dart';
import 'package:go_router/go_router.dart';

class LoginProvider extends BaseProvider {
  CheckRegisterResp? _checkRegisterResp;

  void nextStep(BuildContext context, {required String mobile}) => launch(
    context,
    onRequest: () async {
      final check = await Api.isRegister(mobile: mobile);
      _checkRegisterResp = check;
      if (context.mounted) {
        context.push('${AppRouter.loginCode}?${NavKey.phone}=$mobile');
      }
    },
  );
}
