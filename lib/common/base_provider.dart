import 'package:flutter/material.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/api_response.dart';
import 'package:flutter_echo/services/api_config.dart';
import 'package:flutter_echo/ui/dialogs/loading_dialog.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BaseProvider extends ChangeNotifier {
  final apiService = ApiController(AppConst.baseUrl);

  /// 执行网络请求，并自动管理 loading/error
  Future<void> launch<T>(
    BuildContext context, {
    required Function() onRequest,
    Function(String?, String?)? onError,
  }) async {
    try {
      LoadingDialog.show(context);
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
    }
  }
}
