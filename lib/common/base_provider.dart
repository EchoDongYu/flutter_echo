import 'package:flutter/material.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/api_response.dart';
import 'package:flutter_echo/services/api_config.dart';
import 'package:flutter_echo/ui/dialogs/loading_dialog.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class BaseProvider extends ChangeNotifier {
  final apiService = ApiController(AppConst.baseUrl);
  UiEvent? uiEvent;

  /// 执行网络请求，并自动管理 loading/error
  Future<void> launch<T>(
    BuildContext context, {
    required Function() onRequest,
    Function(String?, String?)? onError,
  }) async {
    try {
      LoadingDialog.show(context);
      uiEvent = UiEvent.loading(true);
      notifyListeners();
      await onRequest();
    } catch (e, s) {
      debugLog('ApiError', error: e, stackTrace: s);
      if (e is ApiResponse) {
        if (onError != null) {
          await onError(e.code, e.msg);
        } else {
          Fluttertoast.showToast(msg: e.msg);
        }
      }
    } finally {
      if (context.mounted) LoadingDialog.hide(context);
      uiEvent = UiEvent.loading(false);
      notifyListeners();
    }
  }

  void clearEvent() => uiEvent = null;
}

sealed class UiEvent {
  const UiEvent();

  factory UiEvent.loading(bool show) => LoadingEvent(show);

  factory UiEvent.navigate(String route) => NavEvent(route);
}

class LoadingEvent extends UiEvent {
  final bool show;

  LoadingEvent(this.show);
}

class NavEvent extends UiEvent {
  final String route;

  NavEvent(this.route);
}

void a<T extends BaseProvider>(T provider, BuildContext context) {
  final event = provider.uiEvent;
  switch(provider.uiEvent) {
    case LoadingEvent():
      LoadingDialog.show(context);
    case NavEvent():
      context.push("");
    case null:
      throw UnimplementedError();
  }
}
