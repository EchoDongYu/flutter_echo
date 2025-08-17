import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/ui/dialog_helper.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/utils/context_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// 测试和演示页面
class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

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
        padding: const EdgeInsets.all(24.0),
        child: Column(
          spacing: 12.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EchoPrimaryButton(
              text: "Primary",
              onPressed: () {
                DialogHelper.showPromptDialog(
                  context: context,
                  title: "This is the title This is ",
                  content:
                      "This is the announcement content This is the announcement content This is the annou ncement content Thisis the announc ement content.",
                  confirmText: "OK",
                );
              },
            ),
            EchoSecondaryButton(
              text: "Secondary",
              onPressed: () {
                DialogHelper.showPromptDialog(
                  context: context,
                  title: "Borrar cuenta bancaria",
                  content:
                      "¿Está seguro de que desea eliminar esta cuenta bancaria?",
                  confirmText: "OK",
                  cancelText: "CANCEL",
                );
              },
            ),
            EchoOutlinedButton(text: "Outlined", onPressed: () {}),

            // 弹窗组件测试区域
            _buildSectionTitle('弹窗测试'),

            _buildTestButton(
              context,
              title: '图形验证码弹窗',
              icon: Icons.security,
              color: const Color(0xFF3288F1),
              onPressed: () => _showCaptchaDialog(context),
            ),

            _buildTestButton(
              context,
              title: '授权声明弹窗',
              icon: Icons.verified_user,
              color: const Color(0xFF4CAF50),
              onPressed: () => _showPermissionDialog(context),
            ),

            _buildTestButton(
              context,
              title: '授权声明补偿弹窗',
              icon: Icons.error_outline,
              color: const Color(0xFFFF9800),
              onPressed: () => _showCompensationDialog(context),
            ),

            _buildTestButton(
              context,
              title: '认证选择项弹窗',
              icon: Icons.info_outline,
              color: const Color(0xFFFF9800),
              onPressed: () => _showPickItemDialog(context),
            ),

            // 页面功能测试区域
            _buildSectionTitle('页面功能测试'),

            // 登录流程测试
            _buildTestButton(
              context,
              title: '登录手机号输入页面',
              icon: Icons.phone,
              color: NowColors.c0xFF3288F1,
              onPressed: () => context.push(AppRouter.loginPhone),
            ),

            _buildTestButton(
              context,
              title: '登录验证码输入页面',
              icon: Icons.sms,
              color: const Color(0xFF3288F1),
              onPressed: () =>
                  context.push('${AppRouter.loginCode}?phone=1234567890'),
            ),

            // 业务流程测试
            _buildTestButton(
              context,
              title: '认证个人信息',
              icon: Icons.assignment,
              color: NowColors.c0xFF4FAAFF,
              onPressed: () => context.push(AppRouter.stepBasic),
            ),

            _buildTestButton(
              context,
              title: '认证工作信息',
              icon: Icons.assignment,
              color: NowColors.c0xFF4FAAFF,
              onPressed: () => context.push(AppRouter.stepWork),
            ),

            _buildTestButton(
              context,
              title: '认证联系人信息',
              icon: Icons.assignment,
              color: NowColors.c0xFF4FAAFF,
              onPressed: () => context.push(AppRouter.stepContact),
            ),

            _buildTestButton(
              context,
              title: '借款页面',
              icon: Icons.account_balance_wallet,
              color: NowColors.c0xFF4FAAFF,
              onPressed: () => context.push(AppRouter.confirm),
            ),

            _buildTestButton(
              context,
              title: '还款页面',
              icon: Icons.payment,
              color: NowColors.c0xFF3EB34D,
              onPressed: () => context.push(AppRouter.after),
            ),

            // 返回主页按钮
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () => context.go(AppRouter.main),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C757D),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
                icon: const Icon(Icons.home),
                label: const Text(
                  '返回主页',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建区域标题
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1C1F23),
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
        elevation: 2,
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

  /// 显示图形验证码弹窗
  void _showCaptchaDialog(BuildContext context) async {
    final result = await DialogHelper.showCaptchaDialog(context: context);
    if (context.mounted) {
      if (result != null && result.isNotEmpty) {
        context.showSuccessSnack('验证码验证成功: $result');
      } else {
        context.showNormalSnack('验证码验证已取消: $result');
      }
    }
  }

  void _showPermissionDialog(BuildContext context) async {
    final result = await DialogHelper.showPermissionDialog(context: context);
    if (context.mounted) {
      if (result == true) {
        context.showSuccessSnack('同意: $result');
      } else {
        context.showNormalSnack('拒绝: $result');
      }
    }
  }

  void _showCompensationDialog(BuildContext context) async {
    final result = await DialogHelper.showCompensationDialog(context: context);
    if (context.mounted) {
      if (result == true) {
        context.showSuccessSnack('同意: $result');
      } else {
        context.showNormalSnack('拒绝: $result');
      }
    }
  }

  static final List<StepItem> stepItems = [
    StepItem(key: 1, value: '¿Cómo obtengo un préstamo CreditYa?', type: 'Item1', sort: 2, l16h95: 3),
    StepItem(key: 1, value: 'La información personal no está seguraLa información personal no está seguraLa información personal no está segura', type: 'Item1', sort: 2, l16h95: 3),
    StepItem(key: 1, value: '¿Cómo obtengo un préstamo CreditYa?', type: 'Item1', sort: 2, l16h95: 3),
    StepItem(key: 1, value: '¿Cómo obtengo un préstamo CreditYa?', type: 'Item1', sort: 2, l16h95: 3),
    StepItem(key: 1, value: 'XXXXXXXXXX', type: 'Item1', sort: 2, l16h95: 3),
  ];

  void _showPickItemDialog(BuildContext context) async {
    final result = await DialogHelper.showPickItemDialog(
      context: context,
      items: stepItems,
    );
    if (context.mounted) {
      if (result != null) {
        context.showSuccessSnack('同意: $result');
      } else {
        context.showNormalSnack('拒绝: $result');
      }
    }
  }
}
