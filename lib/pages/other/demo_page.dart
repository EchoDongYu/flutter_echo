import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/pages/login/captcha_dialog.dart';
import 'package:flutter_echo/pages/login/retain_login_dialog.dart';
import 'package:flutter_echo/pages/submit/pick_item_dialog.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/ui/dialog_helper.dart';
import 'package:flutter_echo/ui/dialogs/disclosure_dialog.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/utils/context_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// 测试和演示页面
class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  List<bool> expand = [true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '测试入口',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: NowColors.c0xFF3288F1,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 5.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EchoPrimaryButton(text: "Primary", onPressed: () {}),
            EchoSecondaryButton(text: "Secondary", onPressed: () {}),
            EchoOutlinedButton(text: "Outlined", onPressed: () {}),

            ExpansionPanelList(
              elevation: 0,
              dividerColor: Colors.transparent,
              expandedHeaderPadding: EdgeInsets.zero,
              expansionCallback: (pos, value) {
                setState(() => expand[pos] = value);
              },
              children: [_buildDialogPanel(context), _buildPagePanel(context)],
            ),

            SizedBox(height: 10.h),
            // 返回主页按钮
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton.icon(
                onPressed: () => context.go(AppRouter.main),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C757D),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
                icon: const Icon(Icons.home_rounded),
                label: const Text(
                  'Home',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ExpansionPanel _buildDialogPanel(BuildContext context) {
    return ExpansionPanel(
      isExpanded: expand[0],
      canTapOnHeader: true,
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text(
            '弹窗测试',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: NowColors.c0xFF1C1F23,
            ),
          ),
        );
      },
      body: Column(
        children: [
          _buildTestButton(
            context,
            title: '删除被账号登录时提示弹窗',
            icon: Icons.auto_delete_rounded,
            color: const Color(0xFFDB8D15),
            onPressed: () => _showRemovedDialog(context),
          ),

          _buildTestButton(
            context,
            title: '版本升级弹窗',
            icon: Icons.upgrade_rounded,
            color: const Color(0xFF00D4FF),
            onPressed: () => _showUpgradeDialog(context),
          ),

          _buildTestButton(
            context,
            title: '好评引导弹窗',
            icon: Icons.reviews_rounded,
            color: const Color(0xFF00D4FF),
            onPressed: () => _showPraiseDialog(context),
          ),

          _buildTestButton(
            context,
            title: '通用提示弹窗',
            icon: Icons.tips_and_updates_rounded,
            color: const Color(0xFF3288F1),
            onPressed: () => _showPromptDialog1(context),
          ),

          _buildTestButton(
            context,
            title: '通用提示弹窗2',
            icon: Icons.tips_and_updates_outlined,
            color: const Color(0xFF3288F1),
            onPressed: () => _showPromptDialog2(context),
          ),

          _buildTestButton(
            context,
            title: '图形验证码弹窗',
            icon: Icons.verified_rounded,
            color: const Color(0xFF3288F1),
            onPressed: () => _showCaptchaDialog(context),
          ),

          _buildTestButton(
            context,
            title: '更换设备验证弹窗',
            icon: Icons.verified_outlined,
            color: const Color(0xFF3288F1),
            onPressed: () => _showDeviceVerifyDialog(context),
          ),

          _buildTestButton(
            context,
            title: '选择收取验证码方式弹窗',
            icon: Icons.sms_rounded,
            color: const Color(0xFF3288F1),
            onPressed: () => _showCodeModeDialog(context),
          ),

          _buildTestButton(
            context,
            title: '退出输入手机号页面挽留弹窗',
            icon: Icons.real_estate_agent_rounded,
            color: const Color(0xFF3288F1),
            onPressed: () => _showRetainLoginDialog(context),
          ),

          _buildTestButton(
            context,
            title: '授权声明弹窗',
            icon: Icons.security,
            color: const Color(0xFF4CAF50),
            onPressed: () => _showPermissionDialog(context),
          ),

          _buildTestButton(
            context,
            title: '授权声明补偿弹窗',
            icon: Icons.security,
            color: const Color(0xFF4CAF50),
            onPressed: () => _showCompensationDialog(context),
          ),

          _buildTestButton(
            context,
            title: '认证项选择弹窗',
            icon: Icons.library_add_check_rounded,
            color: const Color(0xFFFF9800),
            onPressed: () => _showPickItemDialog(context),
          ),

          _buildTestButton(
            context,
            title: '认证项确认弹窗',
            icon: Icons.confirmation_num_rounded,
            color: const Color(0xFFFF9800),
            onPressed: () => _showStepConfirmDialog(context),
          ),

          _buildTestButton(
            context,
            title: '选择天弹窗',
            icon: Icons.view_day_rounded,
            color: const Color(0xFF00D4FF),
            onPressed: () => _showPickDayDialog(context),
          ),

          _buildTestButton(
            context,
            title: '系统选择日期弹窗',
            icon: Icons.date_range_rounded,
            color: const Color(0xFF00D4FF),
            onPressed: () => _showPickDateDialog(context),
          ),

          _buildTestButton(
            context,
            title: '显示证件号码弹窗',
            icon: Icons.numbers_rounded,
            color: const Color(0xFF00D4FF),
            onPressed: () => _showDpiNumberDialog(context),
          ),

          _buildTestButton(
            context,
            title: '显示添加银行卡弹窗',
            icon: Icons.comment_bank_rounded,
            color: const Color(0xFF00D4FF),
            onPressed: () => _showStepBankDialog(context),
          ),
        ],
      ),
    );
  }

  ExpansionPanel _buildPagePanel(BuildContext context) {
    return ExpansionPanel(
      isExpanded: expand[1],
      canTapOnHeader: true,
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text(
            '页面功能测试',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: NowColors.c0xFF1C1F23,
            ),
          ),
        );
      },
      body: Column(
        children: [
          // 登录流程测试
          _buildTestButton(
            context,
            title: '登录手机号输入页面',
            icon: Icons.phone_android_rounded,
            color: NowColors.c0xFF3EB34D,
            onPressed: () async {
              await LocalStorage().logout();
              if (context.mounted) {
                GoRouter.of(context).go(AppRouter.loginPhone);
              }
            },
          ),

          // 认证流程测试
          _buildTestButton(
            context,
            title: '认证基本信息页面',
            icon: Icons.person_rounded,
            color: NowColors.c0xFF4FAAFF,
            onPressed: () => context.push(AppRouter.stepBasic),
          ),

          _buildTestButton(
            context,
            title: '认证工作信息',
            icon: Icons.work_rounded,
            color: NowColors.c0xFF4FAAFF,
            onPressed: () => context.push(AppRouter.stepWork),
          ),

          _buildTestButton(
            context,
            title: '认证联系人信息',
            icon: Icons.contact_emergency_rounded,
            color: NowColors.c0xFF4FAAFF,
            onPressed: () => context.push(AppRouter.stepContact),
          ),

          _buildTestButton(
            context,
            title: '借款确认页面',
            icon: Icons.monetization_on_rounded,
            color: NowColors.c0xFF3EB34D,
            onPressed: () => context.push(AppRouter.applyConfirm),
          ),

          _buildTestButton(
            context,
            title: '还款确认页面',
            icon: Icons.request_quote_rounded,
            color: NowColors.c0xFFFF9817,
            onPressed: () => context.push(AppRouter.repayConfirm),
          ),

          _buildTestButton(
            context,
            title: '设置登录密码页面',
            icon: Icons.password_rounded,
            color: Color(0xFF611AE5),
            onPressed: () => context.push(AppRouter.loginPwdSetup),
          ),

          _buildTestButton(
            context,
            title: '安全验证页面',
            icon: Icons.password_rounded,
            color: Color(0xFF611AE5),
            onPressed: () => context.push(AppRouter.safetyVerify),
          ),

          _buildTestButton(
            context,
            title: '重置登录密码页面',
            icon: Icons.password_rounded,
            color: Color(0xFF611AE5),
            onPressed: () => context.push(AppRouter.resetLoginPwd),
          ),

          _buildTestButton(
            context,
            title: '重置交易密码页面',
            icon: Icons.password_rounded,
            color: Color(0xFF611AE5),
            onPressed: () => context.push(AppRouter.resetTraderPwd),
          ),
        ],
      ),
    );
  }

  /// 构建测试按钮
  Widget _buildTestButton(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 36,
                  decoration: BoxDecoration(
                    color: color.withAlpha(26),
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1C1F23),
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Color(0xFFD8D8D8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showPromptDialog1(BuildContext context) async {
    final result = await DialogHelper.showPromptDialog(
      context: context,
      title: "This is the title This is ",
      content:
          "This is the announcement content This is the announcement content This is the annou ncement content Thisis the announc ement content.",
      confirmText: "OK",
    );
    if (context.mounted) {
      if (result == true) {
        context.showSuccessSnack('OK $result');
      } else {
        context.showNormalSnack('Cancel $result');
      }
    }
  }

  void _showPromptDialog2(BuildContext context) async {
    final result = await DialogHelper.showPromptDialog(
      context: context,
      title: "Borrar cuenta bancaria",
      content: "¿Está seguro de que desea eliminar esta cuenta bancaria?",
      confirmText: "OK",
      cancelText: "CANCEL",
    );
    if (context.mounted) {
      if (result == true) {
        context.showSuccessSnack('OK $result');
      } else {
        context.showNormalSnack('Cancel $result');
      }
    }
  }

  void _showCaptchaDialog(BuildContext context) async {
    final result = await CaptchaDialog.show(context);
    if (context.mounted) {
      if (result != null && result.isNotEmpty) {
        context.showSuccessSnack('Success $result');
      } else {
        context.showNormalSnack('Cancel $result');
      }
    }
  }

  void _showDeviceVerifyDialog(BuildContext context) async {
    final result = await DialogHelper.showDeviceVerifyDialog(context: context);
    if (context.mounted) {
      if (result != null && result.isNotEmpty) {
        context.showSuccessSnack('Success $result');
      } else {
        context.showNormalSnack('Cancel $result');
      }
    }
  }

  void _showCodeModeDialog(BuildContext context) async {
    final result = await DialogHelper.showCodeModeDialog(context: context);
    if (context.mounted) {
      if (result != null) {
        context.showSuccessSnack('Success $result');
      } else {
        context.showNormalSnack('Cancel $result');
      }
    }
  }

  void _showRetainLoginDialog(BuildContext context) async {
    final result = await RetainLoginDialog.show(context);
    if (context.mounted) {
      if (result == true) {
        context.showSuccessSnack('Success $result');
      } else {
        context.showNormalSnack('Cancel $result');
      }
    }
  }

  void _showPermissionDialog(BuildContext context) async {
    final result = await DialogHelper.showPermissionDialog(context: context);
    if (context.mounted) {
      if (result == true) {
        context.showSuccessSnack('Agree $result');
      } else {
        context.showNormalSnack('Reject $result');
      }
    }
  }

  void _showCompensationDialog(BuildContext context) async {
    final result = await DialogHelper.showCompensationDialog(context: context);
    if (context.mounted) {
      if (result == true) {
        context.showSuccessSnack('Agree $result');
      } else {
        context.showNormalSnack('Reject $result');
      }
    }
  }

  static final List<StepItem> stepItems = [
    StepItem('¿Cómo obtengo un préstamo CreditYa?', key: 1, sort: 2, l16h95: 3),
    StepItem(
      'La información personal no está seguraLa información personal no está seguraLa información personal no está segura',
      key: 1,
      sort: 2,
      l16h95: 3,
    ),
    StepItem('¿Cómo obtengo un préstamo CreditYa?', key: 1, sort: 2, l16h95: 3),
    StepItem('¿Cómo obtengo un préstamo CreditYa?', key: 1, sort: 2, l16h95: 3),
    StepItem('XXXXXXXXXX', key: 1, sort: 2, l16h95: 3),
  ];

  void _showPickItemDialog(BuildContext context) async {
    final result = await PickItemDialog.show(context, items: stepItems);
    if (context.mounted) {
      if (result != null) {
        context.showSuccessSnack('Pick $result');
      } else {
        context.showNormalSnack('Cancel $result');
      }
    }
  }

  void _showStepConfirmDialog(BuildContext context) async {
    final result = await DialogHelper.showStepConfirmDialog(
      context: context,
      items: DisclosureDialog.permissionItems,
    );
    if (context.mounted) {
      if (result == true) {
        context.showSuccessSnack('Confirm $result');
      } else {
        context.showNormalSnack('Cancel $result');
      }
    }
  }

  void _showPickDayDialog(BuildContext context) async {
    final result = await DialogHelper.showPickDayDialog(context: context);
    if (context.mounted) {
      if (result != null) {
        context.showSuccessSnack('Confirm $result');
      } else {
        context.showNormalSnack('Cancel $result');
      }
    }
  }

  void _showPickDateDialog(BuildContext context) async {
    final result = await DialogHelper.showPickDateDialog(context: context);
    if (context.mounted) {
      if (result != null) {
        context.showSuccessSnack('Confirm $result');
      } else {
        context.showNormalSnack('Cancel $result');
      }
    }
  }

  void _showDpiNumberDialog(BuildContext context) async {
    final result = await DialogHelper.showDpiNumberDialog(context: context);
    if (context.mounted) {
      if (result == true) {
        context.showSuccessSnack('Confirm $result');
      } else {
        context.showNormalSnack('Cancel $result');
      }
    }
  }

  void _showStepBankDialog(BuildContext context) async {
    final result = await DialogHelper.showStepBankDialog(context: context);
    if (context.mounted) {
      if (result == true) {
        context.showSuccessSnack('Confirm $result');
      } else {
        context.showNormalSnack('Cancel $result');
      }
    }
  }

  void _showUpgradeDialog(BuildContext context) async {
    final result = await DialogHelper.showUpgradeDialog(context: context);
    if (context.mounted) {
      if (result == true) {
        context.showSuccessSnack('Confirm $result');
      } else {
        context.showNormalSnack('Cancel $result');
      }
    }
  }

  void _showPraiseDialog(BuildContext context) async {
    final result = await DialogHelper.showPraiseDialog(context: context);
    if (context.mounted) {
      if (result != null) {
        context.showSuccessSnack('Confirm $result');
      } else {
        context.showNormalSnack('Cancel $result');
      }
    }
  }

  void _showRemovedDialog(BuildContext context) async {
    final result = await DialogHelper.showRemovedDialog(context: context);
    if (context.mounted) {
      if (result != null) {
        context.showSuccessSnack('Confirm $result');
      } else {
        context.showNormalSnack('Cancel $result');
      }
    }
  }
}
