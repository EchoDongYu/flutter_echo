import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
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
            const SizedBox(height: 12),
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
            const SizedBox(height: 12),
            EchoOutlinedButton(text: "Outlined", onPressed: () {}),
            const SizedBox(height: 16),
            // 弹窗组件测试区域
            _buildSectionTitle('弹窗测试'),
            const SizedBox(height: 16),

            // 图形验证码弹窗测试
            _buildTestButton(
              context,
              title: '图形验证码弹窗',
              subtitle: '底部弹窗形式的图形验证码输入',
              icon: Icons.security,
              color: const Color(0xFF3288F1),
              onPressed: () => _showCaptchaDialog(context),
            ),

            const SizedBox(height: 12),

            // 授权声明弹窗测试
            _buildTestButton(
              context,
              title: '授权声明弹窗',
              subtitle: '权限请求前的声明弹窗',
              icon: Icons.verified_user,
              color: const Color(0xFF4CAF50),
              onPressed: () => _showPermissionDialog(context),
            ),

            const SizedBox(height: 12),

            // 授权声明补偿弹窗测试
            _buildTestButton(
              context,
              title: '授权声明补偿弹窗',
              subtitle: '权限被拒绝后的补偿弹窗',
              icon: Icons.error_outline,
              color: const Color(0xFFFF9800),
              onPressed: () => _showCompensationDialog(context),
            ),

            const SizedBox(height: 32),

            // 页面功能测试区域
            _buildSectionTitle('页面功能测试'),
            const SizedBox(height: 16),

            // 登录流程测试
            _buildTestButton(
              context,
              title: '登录手机号输入页面',
              subtitle: '用户登录第一步',
              icon: Icons.phone,
              color: NowColors.c0xFF3288F1,
              onPressed: () => context.push(AppRouter.loginPhone),
            ),

            const SizedBox(height: 12),

            _buildTestButton(
              context,
              title: '登录验证码输入页面',
              subtitle: '用户登录第二步',
              icon: Icons.sms,
              color: const Color(0xFF3288F1),
              onPressed: () =>
                  context.push('${AppRouter.loginCode}?phone=1234567890'),
            ),

            const SizedBox(height: 12),

            // 业务流程测试
            _buildTestButton(
              context,
              title: '认证个人信息',
              subtitle: '用户身份认证流程',
              icon: Icons.assignment,
              color: NowColors.c0xFF4FAAFF,
              onPressed: () => context.push(AppRouter.stepBasic),
            ),

            const SizedBox(height: 12),

            _buildTestButton(
              context,
              title: '认证工作信息',
              subtitle: '用户身份认证流程',
              icon: Icons.assignment,
              color: NowColors.c0xFF4FAAFF,
              onPressed: () => context.push(AppRouter.stepWork),
            ),

            const SizedBox(height: 12),

            _buildTestButton(
              context,
              title: '认证联系人信息',
              subtitle: '用户身份认证流程',
              icon: Icons.assignment,
              color: NowColors.c0xFF4FAAFF,
              onPressed: () => context.push(AppRouter.stepContact),
            ),

            const SizedBox(height: 12),

            _buildTestButton(
              context,
              title: '借款页面',
              subtitle: '借款申请流程',
              icon: Icons.account_balance_wallet,
              color: NowColors.c0xFF4FAAFF,
              onPressed: () => context.push(AppRouter.confirm),
            ),

            const SizedBox(height: 12),

            _buildTestButton(
              context,
              title: '还款页面',
              subtitle: '还款管理功能',
              icon: Icons.payment,
              color: NowColors.c0xFF3EB34D,
              onPressed: () => context.push(AppRouter.after),
            ),

            const SizedBox(height: 32),

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
    required String subtitle,
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
        // 验证成功
        context.showSuccessSnack('验证码验证成功: $result');
      } else {
        // 用户取消
        context.showNormalSnack('验证码验证已取消: $result');
      }
    }
  }

  void _showPermissionDialog(BuildContext context) async {
    await DialogHelper.showPermissionDialog(context: context);
  }

  void _showCompensationDialog(BuildContext context) async {
    await DialogHelper.showCompensationDialog(context: context);
  }
}
