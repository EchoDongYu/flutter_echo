import 'package:flutter/material.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/pages/login/captcha_dialog.dart';
import 'package:flutter_echo/pages/login/code_mode_dialog.dart';
import 'package:flutter_echo/pages/login/retain_login_dialog.dart';
import 'package:flutter_echo/pages/submit/confirm_step_dialog.dart';
import 'package:flutter_echo/pages/submit/dpi_number_dialog.dart';
import 'package:flutter_echo/pages/submit/pick_date_dialog.dart';
import 'package:flutter_echo/pages/submit/pick_day_dialog.dart';
import 'package:flutter_echo/pages/submit/pick_item_dialog.dart';
import 'package:flutter_echo/pages/submit/step_bank_dialog.dart';
import 'package:flutter_echo/ui/dialogs/compensation_dialog.dart';
import 'package:flutter_echo/ui/dialogs/permission_dialog.dart';
import 'package:flutter_echo/ui/prompt_dialog.dart';
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

  /// 显示选择收取验证码方式弹窗
  static Future<int?> showCodeModeDialog({required BuildContext context}) {
    return showDialog<int>(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
          CodeModeDialog(onMethod: (value) => context.pop(value)),
    );
  }

  /// 显示退出输入手机号页面挽留弹窗
  static Future<bool?> showRetainLoginDialog({required BuildContext context}) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => RetainLoginDialog(
        onAgree: () => context.pop(true),
        onDisagree: () => context.pop(false),
      ),
    );
  }

  /// 显示认证项选择弹窗
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

  /// 显示认证项确认弹窗
  static Future<bool?> showStepConfirmDialog({
    required BuildContext context,
    required List<Pair<String, String>> items,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) => ConfirmStepDialog(
        items: items,
        onConfirm: () => context.pop(true),
        onClosing: () => context.pop(false),
      ),
    );
  }

  /// 显示认证项选择日弹窗
  static Future<int?> showPickDayDialog({required BuildContext context}) {
    return showModalBottomSheet<int>(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) => PickDayDialog(
        onConfirm: (value) => context.pop(value),
        onClosing: () => context.pop(),
      ),
    );
  }

  /// 显示认证项选择日期弹窗
  static Future<DateTime?> showPickDateDialog({required BuildContext context}) {
    return showModalBottomSheet<DateTime>(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) => PickDateDialog(
        onConfirm: (value) => context.pop(value),
        onClosing: () => context.pop(),
      ),
    );
  }

  /// 显示证件号码弹窗
  static Future<bool?> showDpiNumberDialog({required BuildContext context}) {
    return showDialog<bool>(
      context: context,
      builder: (context) => DpiNumberDialog(onCancel: () => context.pop(false)),
    );
  }

  /// 显示添加银行卡弹窗
  static Future<bool?> showStepBankDialog({required BuildContext context}) {
    return showModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) => StepBankDialog(
        onConfirm: () => context.pop(true),
        onClosing: () => context.pop(false),
      ),
    );
  }
}
