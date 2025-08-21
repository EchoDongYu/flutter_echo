import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';

extension ContextExtension on BuildContext {
  void showSuccessSnack(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: NowColors.c0xFF3EB34D,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void showErrorSnack(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: NowColors.c0xFFFB4F34,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void showNormalSnack(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }
}
