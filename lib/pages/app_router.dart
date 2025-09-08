import 'package:flutter_echo/common/page_consumer.dart';
import 'package:flutter_echo/pages/after/repay_confirm_page.dart';
import 'package:flutter_echo/pages/after/repay_status_page.dart';
import 'package:flutter_echo/pages/before/apply_confirm_page.dart';
import 'package:flutter_echo/pages/before/apply_status_page.dart';
import 'package:flutter_echo/pages/login/login_code_page.dart';
import 'package:flutter_echo/pages/login/login_password_page.dart';
import 'package:flutter_echo/pages/login/login_phone_page.dart';
import 'package:flutter_echo/pages/login/login_pwd_setup_page.dart';
import 'package:flutter_echo/pages/main/main_page.dart';
import 'package:flutter_echo/pages/other/demo_page.dart';
import 'package:flutter_echo/pages/other/not_found_page.dart';
import 'package:flutter_echo/pages/other/splash_page.dart';
import 'package:flutter_echo/pages/submit/step_basic_page.dart';
import 'package:flutter_echo/pages/submit/step_contact_page.dart';
import 'package:flutter_echo/pages/submit/step_result_page.dart';
import 'package:flutter_echo/pages/submit/step_status_page.dart';
import 'package:flutter_echo/pages/submit/step_work_page.dart';
import 'package:flutter_echo/pages/user/about_us_page.dart';
import 'package:flutter_echo/pages/user/reset_login_pwd_page.dart';
import 'package:flutter_echo/pages/user/reset_trader_pwd_page.dart';
import 'package:flutter_echo/pages/user/safety_verify_page.dart';
import 'package:flutter_echo/pages/user/user_bank_page.dart';
import 'package:flutter_echo/providers/about_us_provider.dart';
import 'package:flutter_echo/providers/apply_provider.dart';
import 'package:flutter_echo/providers/login_provider.dart';
import 'package:flutter_echo/providers/main_provider.dart';
import 'package:flutter_echo/providers/step_status_provider.dart';
import 'package:flutter_echo/providers/submit_provider.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// 应用路由配置
class AppRouter {
  static const String splash = '/splash';
  static const String main = '/main';
  static const String loginPhone = '/login_phone';
  static const String loginCode = '/login_code';
  static const String loginPassword = '/login_password';
  static const String loginPwdSetup = '/login_pwd_setup';
  static const String stepBasic = '/step_basic';
  static const String stepWork = '/step_work';
  static const String stepContact = '/step_contact';
  static const String stepResult = '/step_result';
  static const String stepFailed = '/step_failed';
  static const String stepProcess = '/step_process';
  static const String applyConfirm = '/apply_confirm';
  static const String repayConfirm = '/repay_confirm';
  static const String safetyVerify = '/safety_verify';
  static const String resetLoginPwd = '/reset_login_pwd';
  static const String resetTraderPwd = '/reset_trader_pwd';
  static const String aboutUs = '/about_us';
  static const String userBank = '/user_bank';
  static const String demo = '/demo';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      /// 闪屏页面
      GoRoute(path: splash, builder: (context, state) => const SplashPage()),

      /// 主页面
      GoRoute(
        path: main,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => MainModel(),
          builder: (_, _) => PageConsumer<MainModel>(child: const MainPage()),
        ),
      ),

      /// 登录模块
      ShellRoute(
        builder: (context, state, child) {
          return ChangeNotifierProvider(
            create: (_) => LoginModel(),
            builder: (_, _) => PageConsumer<LoginModel>(child: child),
          );
        },
        routes: [
          /// 登录页面-手机号输入
          GoRoute(
            path: loginPhone,
            builder: (context, state) => const LoginPhonePage(),
          ),

          /// 登录页面-验证码输入
          GoRoute(
            path: loginCode,
            builder: (context, state) => const LoginCodePage(),
          ),

          /// 登录页面-密码输入
          GoRoute(
            path: loginPassword,
            builder: (context, state) => const LoginPasswordPage(),
          ),

          /// 设置登录密码页面
          GoRoute(
            path: loginPwdSetup,
            builder: (context, state) => const LoginPwdSetupPage(),
          ),
        ],
      ),

      /// 授信模块
      ShellRoute(
        builder: (context, state, child) {
          return ChangeNotifierProvider(
            create: (_) => SubmitModel(),
            builder: (_, _) => PageConsumer<SubmitModel>(child: child),
          );
        },
        routes: [
          /// 授信表单页面-基本信息
          GoRoute(
            path: stepBasic,
            builder: (context, state) => const StepBasicPage(),
          ),

          /// 授信表单页面-工作信息
          GoRoute(
            path: stepWork,
            builder: (context, state) => const StepWorkPage(),
          ),

          /// 授信表单页面-联系人信息
          GoRoute(
            path: stepContact,
            builder: (context, state) => const StepContactPage(),
          ),
        ],
      ),

      /// 授信倒计时页面
      GoRoute(
        path: stepResult,
        builder: (context, state) {
          final count = state.uri.queryParameters[NavKey.count]?.tryParseInt;
          return StepResultPage(countdown: count);
        },
      ),

      /// 授信失败页面
      GoRoute(
        path: stepFailed,
        builder: (context, state) => const StepFailedPage(),
      ),

      /// 授信处理中页面
      GoRoute(
        path: stepProcess,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => StepStatusModel(),
          builder: (_, _) {
            final count = state.uri.queryParameters[NavKey.count]?.tryParseInt;
            return PageConsumer<StepStatusModel>(
              child: StepProcessPage(countdown: count),
            );
          },
        ),
      ),

      /// 借款确认页面
      GoRoute(
        path: applyConfirm,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => ApplyModel(),
          builder: (_, _) {
            final params = state.uri.queryParameters;
            final id = params[NavKey.id]?.tryParseInt;
            final amount = params[NavKey.amount]?.tryParseDouble;
            return PageConsumer<ApplyModel>(
              child: ApplyConfirmPage(productId: id, amount: amount),
            );
          },
        ),
      ),

      /// 借款状态页面
      GoRoute(
        path: applyConfirm,
        builder: (context, state) => const ApplyStatusPage(),
      ),

      /// 还款确认页面
      GoRoute(
        path: repayConfirm,
        builder: (context, state) => const RepayConfirmPage(),
      ),

      /// 还款状态页面
      GoRoute(
        path: applyConfirm,
        builder: (context, state) => const RepayStatusPage(),
      ),

      /// 安全验证页面
      GoRoute(
        path: safetyVerify,
        builder: (context, state) => const SafetyVerifyPage(),
      ),

      /// 重置登录密码页面
      GoRoute(
        path: resetLoginPwd,
        builder: (context, state) => const ResetLoginPwdPage(),
      ),

      /// 重置交易密码页面
      GoRoute(
        path: resetTraderPwd,
        builder: (context, state) => const ResetTraderPwdPage(),
      ),

      /// 关于我们页面
      GoRoute(
        path: aboutUs,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => AboutUsModel(),
          builder: (_, _) {
            return PageConsumer<AboutUsModel>(child: const AboutUsPage());
          },
        ),
      ),

      /// 用户银行卡页面
      GoRoute(
        path: userBank,
        builder: (context, state) => const UserBankPage(),
      ),

      /// 测试入口
      GoRoute(path: demo, builder: (context, state) => const DemoPage()),
    ],

    /// 错误页面
    errorBuilder: (context, state) => NotFoundPage(uri: state.uri),
  );
}

/// 导航参数
class NavKey {
  static const String count = "countdown";
  static const String status = "status";
  static const String id = "id";
  static const String amount = "amount";
}
