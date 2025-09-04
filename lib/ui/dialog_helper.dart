import 'package:flutter/material.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/pages/login/code_mode_dialog.dart';
import 'package:flutter_echo/pages/login/device_verify_dialog.dart';
import 'package:flutter_echo/pages/submit/confirm_step_dialog.dart';
import 'package:flutter_echo/pages/submit/dpi_number_dialog.dart';
import 'package:flutter_echo/pages/submit/pick_date_dialog.dart';
import 'package:flutter_echo/pages/submit/step_bank_dialog.dart';
import 'package:flutter_echo/pages/user/removed_dialog.dart';
import 'package:flutter_echo/ui/dialogs/compensation_dialog.dart';
import 'package:flutter_echo/ui/dialogs/disclosure_dialog.dart';
import 'package:flutter_echo/ui/dialogs/praise_dialog.dart';
import 'package:flutter_echo/ui/dialogs/prompt_dialog.dart';
import 'package:flutter_echo/ui/dialogs/upgrade_dialog.dart';
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
      builder: (context) => DisclosureDialog(
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

  /// 显示更换设备验证弹窗
  static Future<Map?> showDeviceVerifyDialog({required BuildContext context}) {
    return showModalBottomSheet<Map>(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) => AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 100),
        child: DeviceVerifyDialog(
          phoneNumber: '1234567890',
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
