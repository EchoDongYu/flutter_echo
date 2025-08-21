import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_echo/common/constants.dart';

void debugLog(String message, {Object? error, StackTrace? stackTrace}) {
  if (!AppConst.production) {
    log(message, error: error, stackTrace: stackTrace);
  }
}

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void showNormalSnack(String message) {
  scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
  );
}
