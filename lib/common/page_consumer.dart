import 'package:flutter/material.dart';
import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/api_response.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/pages/login/captcha_dialog.dart';
import 'package:flutter_echo/pages/login/device_verify_dialog.dart';
import 'package:flutter_echo/pages/user/removed_dialog.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/ui/dialogs/loading_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PageConsumer<T extends BaseProvider> extends StatefulWidget {
  final Widget? child;

  const PageConsumer({super.key, this.child});

  @override
  State<PageConsumer> createState() => _PageConsumerState<T>();
}

class _PageConsumerState<T extends BaseProvider> extends State<PageConsumer> {
  bool _showLoading = false;

  @override
  void initState() {
    LoadingDialog.initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_showLoading,
      child: Consumer<T>(
        builder: (_, provider, child) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final loading = provider.loading;
            if (loading != null) {
              provider.consumeLoading();
              if (loading) {
                setState(() => _showLoading = true);
                LoadingDialog.show(context);
              } else {
                LoadingDialog.hide();
                setState(() => _showLoading = false);
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
                // apiError.toastErrorMsg();
                await LocalStorage().logout();
                if (context.mounted) {
                  context.go(AppRouter.loginPhone);
                }
              } else if (apiError.needCaptcha) {
                // apiError.toastErrorMsg();
                provider.onCaptcha(({
                  required String? mobile,
                  required int? type,
                }) async {
                  return await CaptchaDialog.show(
                    context,
                    mobile: mobile,
                    type: type,
                  );
                });
              } else if (apiError.needVerify) {
                LocalStorage().set(AppConst.homeRefreshKey, true);
                await DeviceVerifyDialog.show(context);
              } else if (apiError.removal) {
                await RemovedDialog.show(context);
              }
            }
          });
          return child!;
        },
        child: widget.child,
      ),
    );
  }
}
