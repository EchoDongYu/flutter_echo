import 'package:flutter/material.dart';
import 'package:flutter_echo/pages/after/after_page.dart';
import 'package:flutter_echo/pages/confirm/confirm_page.dart';
import 'package:flutter_echo/pages/login/login_code_page.dart';
import 'package:flutter_echo/pages/login/login_phone_page.dart';
import 'package:flutter_echo/pages/main/main_page.dart';
import 'package:flutter_echo/pages/other/demo_page.dart';
import 'package:flutter_echo/pages/submit/submit_page.dart';
import 'package:go_router/go_router.dart';

/// 应用路由配置
class AppRouter {
  static const String splash = '/splash';
  static const String main = '/main';
  static const String loginPhone = '/login_phone';
  static const String loginCode = '/login_code';
  static const String stepBasic = '/step_basic';
  static const String stepWork = '/step_work';
  static const String stepContact = '/step_contact';
  static const String stepResult = '/step_result';
  static const String confirm = '/confirm';
  static const String after = '/after';
  static const String demo = '/demo';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      /// 闪屏页面
      GoRoute(path: splash, builder: (context, state) => const MainPage()),

      /// 主页面
      GoRoute(path: main, builder: (context, state) => const MainPage()),

      /// 登录页面-手机号输入
      GoRoute(
        path: loginPhone,
        builder: (context, state) => const LoginPhonePage(),
      ),

      /// 登录页面-验证码输入
      GoRoute(
        path: loginCode,
        builder: (context, state) {
          final phone = state.uri.queryParameters[NavKey.phone] ?? '';
          return LoginCodePage(phoneNumber: phone);
        },
      ),

      /// 授信表单页面-基本信息
      GoRoute(path: stepBasic, builder: (context, state) => const SubmitPage()),

      /// 授信表单页面-工作信息
      GoRoute(path: stepWork, builder: (context, state) => const SubmitPage()),

      /// 授信表单页面-联系人信息
      GoRoute(
        path: stepContact,
        builder: (context, state) => const SubmitPage(),
      ),

      /// 授信状态页面
      GoRoute(
        path: stepResult,
        builder: (context, state) => const SubmitPage(),
      ),

      /// 借款页面
      GoRoute(path: confirm, builder: (context, state) => const ConfirmPage()),

      /// 还款页面
      GoRoute(path: after, builder: (context, state) => const AfterPage()),

      /// Demo
      GoRoute(path: demo, builder: (context, state) => const DemoPage()),
    ],

    /// 错误页面
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('页面未找到')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text('页面未找到: ${state.uri}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(main),
              child: const Text('返回首页'),
            ),
          ],
        ),
      ),
    ),
  );
}

/// 导航参数
class NavKey {
  static const String phone = "phone";
}
