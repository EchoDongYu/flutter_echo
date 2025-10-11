import 'package:flutter/material.dart';
import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/api_response.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/pages/login/captcha_dialog.dart';
import 'package:flutter_echo/pages/login/device_verify_dialog.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/ui/dialogs/loading_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PageConsumer2<T1 extends BaseProvider, T2 extends BaseProvider> extends StatefulWidget {
  final Widget? child;

  const PageConsumer2({super.key, this.child});

  @override
  State<PageConsumer2> createState() => _PageConsumerState<T1, T2>();
}

class _PageConsumerState<T1 extends BaseProvider, T2 extends BaseProvider> extends State<PageConsumer2> {
  bool _showLoading = false;

  @override
  void initState() {
    super.initState();
    LoadingDialog.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_showLoading,
      child: Consumer2<T1, T2>(
        builder: (_, provider1, provider2, child) {
          // 处理 loading 状态、导航动作、API 错误的逻辑
          _handleProviderStates(provider1);
          _handleProviderStates(provider2);

          return child!;
        },
        child: widget.child,
      ),
    );
  }

  // 提取的公共方法：处理 loading、navAction、apiError
  void _handleProviderStates(BaseProvider provider) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleLoading(provider);
      _handleNavAction(provider);
      _handleApiError(provider);
    });
  }

  // 处理 Loading 状态
  void _handleLoading(BaseProvider provider) {
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
  }

  // 处理 NavAction
  void _handleNavAction(BaseProvider provider) {
    final navAction = provider.navAction;
    if (navAction != null) {
      provider.consumeNavAction();
      navAction.call(context);
    }
  }

  // 处理 API 错误
  void _handleApiError(BaseProvider provider) async {
    final apiError = provider.apiError;
    if (apiError != null) {
      provider.consumeApiError();
      if (apiError.needLogin) {
        apiError.toastErrorMsg();
        await LocalStorage().logout();
        if (context.mounted) {
          context.go(AppRouter.loginPhone);
        }
      } else if (apiError.needCaptcha) {
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
      }
    }
  }
}
