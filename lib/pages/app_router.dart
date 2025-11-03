import 'package:flutter_echo/common/page_consumer.dart';
import 'package:flutter_echo/common/page_consumer2.dart';
import 'package:flutter_echo/pages/after/cert_camera_page.dart';
import 'package:flutter_echo/pages/after/cert_record_page.dart';
import 'package:flutter_echo/pages/after/history_view/cert_photo_page.dart';
import 'package:flutter_echo/pages/after/repay_bank_page.dart';
import 'package:flutter_echo/pages/after/repay_certificate_page.dart';
import 'package:flutter_echo/pages/after/repay_confirm_page.dart';
import 'package:flutter_echo/pages/after/repay_history_page.dart';
import 'package:flutter_echo/pages/after/repay_result_page.dart';
import 'package:flutter_echo/pages/before/apply_confirm_page.dart';
import 'package:flutter_echo/pages/before/apply_result_page.dart';
import 'package:flutter_echo/pages/bill/bill_detail_page.dart';
import 'package:flutter_echo/pages/bill/bill_list_page.dart';
import 'package:flutter_echo/pages/face/face_camera_page.dart';
import 'package:flutter_echo/pages/face/face_id_info_page.dart';
import 'package:flutter_echo/pages/face/face_identification_page.dart';
import 'package:flutter_echo/pages/login/login_code_page.dart';
import 'package:flutter_echo/pages/login/login_password_page.dart';
import 'package:flutter_echo/pages/login/login_phone_page.dart';
import 'package:flutter_echo/pages/login/login_pwd_setup_page.dart';
import 'package:flutter_echo/pages/main/main_page.dart';
import 'package:flutter_echo/pages/other/not_found_page.dart';
import 'package:flutter_echo/pages/other/photo_view_page.dart';
import 'package:flutter_echo/pages/other/splash_page.dart';
import 'package:flutter_echo/pages/submit/step_basic_page.dart';
import 'package:flutter_echo/pages/submit/step_contact_page.dart';
import 'package:flutter_echo/pages/submit/step_result_page.dart';
import 'package:flutter_echo/pages/submit/step_status_page.dart';
import 'package:flutter_echo/pages/submit/step_work_page.dart';
import 'package:flutter_echo/pages/user/about_us_page.dart';
import 'package:flutter_echo/pages/user/feedback_page.dart';
import 'package:flutter_echo/pages/user/removal_page.dart';
import 'package:flutter_echo/pages/user/reset_password_page.dart';
import 'package:flutter_echo/pages/user/reset_pwd_login_page.dart';
import 'package:flutter_echo/pages/user/reset_pwd_trader_page.dart';
import 'package:flutter_echo/pages/user/safety_verify_page.dart';
import 'package:flutter_echo/pages/user/user_bank_page.dart';
import 'package:flutter_echo/pages/user/web_page.dart';
import 'package:flutter_echo/providers/about_us_provider.dart';
import 'package:flutter_echo/providers/account_provider.dart';
import 'package:flutter_echo/providers/apply_process_provider.dart';
import 'package:flutter_echo/providers/apply_provider.dart';
import 'package:flutter_echo/providers/bill_detail_provider.dart';
import 'package:flutter_echo/providers/bill_provider.dart';
import 'package:flutter_echo/providers/feedback_provider.dart';
import 'package:flutter_echo/providers/id_card_provider.dart';
import 'package:flutter_echo/providers/login_provider.dart';
import 'package:flutter_echo/providers/main_provider.dart';
import 'package:flutter_echo/providers/repay_history_provider.dart';
import 'package:flutter_echo/providers/repay_record_provider.dart';
import 'package:flutter_echo/providers/step_status_provider.dart';
import 'package:flutter_echo/providers/submit_provider.dart';
import 'package:flutter_echo/providers/user_bank_provider.dart';
import 'package:flutter_echo/providers/whatsapp_provider.dart';
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
  static const String stepIdInfo = '/step_id_info';
  static const String stepResult = '/step_result';
  static const String stepFailed = '/step_failed';
  static const String stepProcess = '/step_process';
  static const String faceCamera = '/face_camera';
  static const String faceIdentification = '/face_identification';
  static const String billList = '/bill_list';
  static const String billDetail = '/bill_detail';
  static const String applyConfirm = '/apply_confirm';
  static const String applyFailed = '/apply_failed';
  static const String applyProcess = '/apply_process';
  static const String repayHistory = '/repay_history';
  static const String repayConfirm = '/repay_confirm';
  static const String repayFailed = '/repay_failed';
  static const String repayProcess = '/repay_process';
  static const String repayBank = '/repay_bank';
  static const String repayCert = '/repay_cert';
  static const String certCamera = '/cert_camera';
  static const String certRecord = '/cert_record';
  static const String certPhoto = '/cert_photo';
  static const String photoView = '/photo_view';
  static const String safetyVerify = '/safety_verify';
  static const String resetPassword = '/reset_password';
  static const String resetLoginPwd = '/reset_login_pwd';
  static const String resetTraderPwd = '/reset_trader_pwd';
  static const String removalSuccess = '/removal_success';
  static const String aboutUs = '/about_us';
  static const String userBank = '/user_bank';
  static const String feedback = '/feedback';
  static const String appWeb = '/app_web';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      /// 闪屏页面 FaceIdInfoPage
      GoRoute(path: splash, builder: (context, state) => const SplashPage()),

      /// 主页面
      GoRoute(
        path: main,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => MainModel(),
          builder: (_, _) {
            return PageConsumer<MainModel>(child: const MainPage());
          },
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
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => SubmitModel()),
              ChangeNotifierProvider(create: (_) => IdCardModel()),
            ],
            child: PageConsumer2<SubmitModel,IdCardModel>(
              child: child,
            ),
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

          /// 授信表单页面-证件信息
          GoRoute(
            path: stepIdInfo,
            builder: (context, state) => const FaceIdInfoPage(),
          ),
        ],
      ),

      /// 授信倒计时页面
      GoRoute(
        path: stepProcess,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => StepStatusModel(),
          builder: (_, _) {
            final params = state.uri.queryParameters;
            final count = params[NavKey.count]?.tryParseInt;
            return PageConsumer<StepStatusModel>(
              child: StepResultPage(countdown: count),
            );
          },
        ),
      ),

      /// 授信拍照页面
      GoRoute(
        path: faceCamera,
        builder: (context, state) => const FaceCameraPage(),
      ),

      /// 授信认证页面
      GoRoute(
        path: faceIdentification,
        builder: (context, state) => const FaceIdentificationPage(),
      ),

      /// 授信失败页面
      GoRoute(
        path: stepFailed,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => WhatsappModel(),
          builder: (_, _) {
            return PageConsumer<WhatsappModel>(child: const StepFailedPage());
          },
        ),
      ),

      /// 授信处理中页面
      GoRoute(
        path: stepResult,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => StepStatusModel(),
          builder: (_, _) {
            final params = state.uri.queryParameters;
            final count = params[NavKey.count]?.tryParseInt;
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
            final productId = params[NavKey.id]?.tryParseInt;
            final amount = params[NavKey.amount]?.tryParseDouble;
            return PageConsumer<ApplyModel>(
              child: ApplyConfirmPage(productId: productId, amount: amount),
            );
          },
        ),
      ),

      /// 借款失败页面
      GoRoute(
        path: applyFailed,
        builder: (context, state) => const ApplyFailedPage(),
      ),

      /// 借款处理中页面
      GoRoute(
        path: applyProcess,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => ApplyProcessModel(),
          builder: (_, _) {
            return PageConsumer<ApplyProcessModel>(child: ApplyProcessPage());
          },
        ),
      ),

      /// 还款失败页面
      GoRoute(
        path: repayFailed,
        builder: (context, state) => const RepayFailedPage(),
      ),

      /// 还款处理中页面
      GoRoute(
        path: repayProcess,
        builder: (context, state) => const RepayProcessPage(),
      ),

      /// 还款历史页面
      GoRoute(
        path: repayHistory,
        builder: (context, state) {
          final id = state.uri.queryParameters[NavKey.id];
          return ChangeNotifierProvider(
            create: (_) => RepayHistoryModel()..fetchRepayListData(id),
            builder: (context, state) {
              return PageConsumer<RepayHistoryModel>(
                child: RepayHistoryPage(loanGid: id),
              );
            },
          );
        },
      ),

      /// 账单列表页面
      GoRoute(
        path: billList,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => BillModel()..fetchBillListData(),
          builder: (context, state) {
            return PageConsumer<BillModel>(child: const BillListPage());
          },
        ),
      ),

      /// 账单详情模块
      ShellRoute(
        builder: (context, state, child) {
          final id = state.uri.queryParameters[NavKey.id];
          return ChangeNotifierProvider(
            create: (_) => BillDetailModel()..fetchBillDetailData(id),
            builder: (_, _) => PageConsumer<BillDetailModel>(child: child),
          );
        },
        routes: [
          /// 账单详情页面
          GoRoute(
            path: billDetail,
            builder: (context, state) => const BillDetailPage(),
          ),

          /// 还款确认页面
          GoRoute(
            path: repayConfirm,
            builder: (context, state) => const RepayConfirmPage(),
          ),

          /// 还款银行页面
          GoRoute(
            path: repayBank,
            builder: (context, state) => const RepayBankPage(),
          ),

          /// 还款凭证页面
          GoRoute(
            path: repayCert,
            builder: (context, state) => const RepayCertificatePage(),
          ),

          /// 图片预览
          GoRoute(
            path: certPhoto,
            builder: (context, state) => const CertPhotoPage(),
          ),
        ],
      ),

      /// 凭证记录页面
      GoRoute(
        path: certRecord,
        builder: (context, state) {
          final id = state.uri.queryParameters[NavKey.id];
          return ChangeNotifierProvider(
            create: (_) => RepayRecordModel()..queryRepaymentRecord(id),
            builder: (context, state) {
              return PageConsumer<RepayRecordModel>(
                child: CertRecordPage(loanGid: id),
              );
            },
          );
        },
      ),

      /// 凭证拍照页面
      GoRoute(
        path: certCamera,
        builder: (context, state) => const CertCameraPage(),
      ),

      /// 安全验证页面
      GoRoute(
        path: safetyVerify,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => AccountModel(),
          builder: (_, _) {
            return PageConsumer<AccountModel>(child: const SafetyVerifyPage());
          },
        ),
      ),

      /// 账号注销成功页面
      GoRoute(
        path: removalSuccess,
        builder: (context, state) => const RemovalPage(),
      ),

      /// 重置密码页面
      GoRoute(
        path: resetPassword,
        builder: (context, state) {
          final params = state.uri.queryParameters;
          final status = params[NavKey.status]?.tryParseInt;
          return ResetPasswordPage(status: status);
        },
      ),

      /// 重置登录密码页面
      GoRoute(
        path: resetLoginPwd,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => AccountModel(),
          builder: (_, _) {
            return PageConsumer<AccountModel>(child: const ResetLoginPwdPage());
          },
        ),
      ),

      /// 重置交易密码页面
      GoRoute(
        path: resetTraderPwd,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => AccountModel(),
          builder: (_, _) {
            return PageConsumer<AccountModel>(
              child: const ResetTraderPwdPage(),
            );
          },
        ),
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
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => UserBankModel(),
          builder: (_, _) {
            return PageConsumer<UserBankModel>(child: const UserBankPage());
          },
        ),
      ),

      /// 意见反馈页面
      GoRoute(
        path: feedback,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => FeedbackModel(),
          builder: (_, _) {
            return PageConsumer<FeedbackModel>(child: const FeedbackPage());
          },
        ),
      ),

      /// H5页面
      GoRoute(
        path: appWeb,
        builder: (context, state) {
          final params = state.uri.queryParameters;
          final title = params[NavKey.title];
          final url = params[NavKey.url];
          return CommonWebPage(title: title, url: url!);
        },
      ),

      /// 图片预览
      GoRoute(
        path: photoView,
        builder: (context, state) {
          final url = state.uri.queryParameters['url'];
          return PhotoViewPage(url: url);
        },
      ),
    ],

    /// 错误页面
    errorBuilder: (context, state) => NotFoundPage(uri: state.uri),
    observers: [routeObserver],
  );
}

/// 导航参数
class NavKey {
  static const String count = "countdown";
  static const String status = "status";
  static const String id = "id";
  static const String amount = "amount";
  static const String title = "title";
  static const String url = "url";
}
