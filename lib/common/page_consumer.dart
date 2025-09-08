import 'package:flutter/material.dart';
import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/api_response.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/pages/login/captcha_dialog.dart';
import 'package:flutter_echo/pages/login/device_verify_dialog.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/ui/dialogs/loading_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PageConsumer<T extends BaseProvider> extends StatefulWidget {
  final Widget? _child;

  const PageConsumer({super.key, required Widget child}) : _child = child;

  @override
  State<PageConsumer> createState() => _PageConsumerState<T>();
}

class _PageConsumerState<T extends BaseProvider> extends State<PageConsumer> {
  @override
  void dispose() {
    LoadingDialog.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, provider, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final loading = provider.loading;
          if (loading != null) {
            provider.consumeLoading();
            if (loading) {
              LoadingDialog.show(context);
            } else {
              LoadingDialog.hide();
            }
          }
          final navAction = provider.navAction;
          if (navAction != null) {
            provider.consumeNavAction();
            navAction.call(context);
          }
        });
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          final apiError = provider.apiError;
          if (apiError != null) {
            provider.consumeApiError();
            if (apiError.needLogin) {
              Fluttertoast.showToast(msg: apiError.msg);
              LocalStorage().logout();
              GoRouter.of(context).go(AppRouter.loginPhone);
            } else if (apiError.needCaptcha) {
              final code = await CaptchaDialog.show(context);
              if (code != null) provider.onCaptchaCode(code);
            } else if (apiError.needVerify) {
              await DeviceVerifyDialog.show(context);
            }
          }
        });
        return child!;
      },
      child: widget._child,
    );
  }
}
