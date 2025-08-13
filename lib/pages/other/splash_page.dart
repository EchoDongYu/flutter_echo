import 'package:flutter/material.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 600), () {
      if (context.mounted) context.go(AppRouter.main);
    });
    return const Placeholder();
  }
}
