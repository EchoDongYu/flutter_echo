import 'package:flutter/material.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/ui/dialogs/captcha_dialog.dart';
import 'package:flutter_echo/ui/dialogs/compensation_dialog.dart';
import 'package:flutter_echo/ui/dialogs/permission_dialog.dart';
import 'package:flutter_echo/ui/dialogs/pick_item_dialog.dart';
import 'package:flutter_echo/ui/dialogs/prompt_dialog.dart';
import 'package:go_router/go_router.dart';

class DialogHelper {
  /// 显示通用提示弹窗
  static Future<bool?> showPromptDialog({
    required BuildContext context,
    required String title,
    required String content,
    required String confirmText,
    String? cancelText,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => PromptDialog(
        title: title,
        content: content,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: () => context.pop(true),
        onCancel: () => context.pop(false),
      ),
    );
  }

  /// 显示授权声明弹窗
  static Future<bool?> showPermissionDialog({required BuildContext context}) {
    return showModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) => PermissionDialog(
        onAgree: () => context.pop(true),
        onDisagree: () => context.pop(false),
      ),
    );
  }

  /// 显示授权声明补偿弹窗
  static Future<bool?> showCompensationDialog({required BuildContext context}) {
    return showModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) => CompensationDialog(
        onConfirm: () => context.pop(true),
        onClosing: () => context.pop(false),
      ),
    );
  }

  /// 显示图形验证码弹窗
  static Future<String?> showCaptchaDialog({required BuildContext context}) {
    return showModalBottomSheet<String>(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) => AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 100),
        child: CaptchaDialog(
          onConfirm: (code) => context.pop(code),
          onClosing: () => context.pop(),
        ),
      ),
    );
  }

  /// 显示认证项弹窗
  static Future<StepItem?> showPickItemDialog({
    required BuildContext context,
    required List<StepItem> items,
  }) {
    return showModalBottomSheet<StepItem>(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) => PickItemDialog(
        items: items,
        onConfirm: (item) => context.pop(item),
        onClosing: () => context.pop(),
      ),
    );
  }
}
