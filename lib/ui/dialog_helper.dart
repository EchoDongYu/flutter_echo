import 'package:flutter/material.dart';
import 'package:flutter_echo/pages/login/code_mode_dialog.dart';
import 'package:flutter_echo/pages/user/removed_dialog.dart';
import 'package:flutter_echo/ui/dialogs/praise_dialog.dart';
import 'package:flutter_echo/ui/dialogs/upgrade_dialog.dart';
import 'package:go_router/go_router.dart';

class DialogHelper {
  /// 显示选择收取验证码方式弹窗
  static Future<int?> showCodeModeDialog({required BuildContext context}) {
    return showDialog<int>(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
          CodeModeDialog(onMethod: (value) => context.pop(value)),
    );
  }

  /// 显示版本升级弹窗
  static Future<bool?> showUpgradeDialog({required BuildContext context}) {
    return showDialog<bool>(
      context: context,
      builder: (context) => UpgradeDialog(
        onConfirm: () => context.pop(true),
        onCancel: () => context.pop(false),
      ),
    );
  }

  /// 显示好评引导弹窗
  static Future<int?> showPraiseDialog({required BuildContext context}) {
    return showDialog<int>(
      context: context,
      builder: (context) => PraiseDialog(
        onConfirm: () => context.pop(1),
        onReport: () => context.pop(2),
        onCancel: () => context.pop(),
      ),
    );
  }

  /// 显示删除被账号登录时提示弹窗
  static Future<bool?> showRemovedDialog({required BuildContext context}) {
    return showDialog<bool>(
      context: context,
      builder: (context) => RemovedDialog(onConfirm: () => context.pop(true)),
    );
  }
}
