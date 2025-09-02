import 'package:flutter/material.dart';
import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/api_response.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/pages/login/captcha_dialog.dart';
import 'package:flutter_echo/ui/dialogs/loading_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PageConsumer<T extends BaseProvider> extends StatelessWidget {
  final Widget? _child;

  const PageConsumer({super.key, required Widget child}) : _child = child;

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
              final navigator = Navigator.of(context, rootNavigator: true);
              if (navigator.canPop()) navigator.pop();
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
              GoRouter.of(context).go(AppRouter.loginPhone);
            } else if (apiError.needCaptcha) {
              final code = await CaptchaDialog.show(context);
              if (code != null) provider.onCaptchaCode(code);
            }
          }
        });
        return child!;
      },
      child: _child,
    );
  }
}
