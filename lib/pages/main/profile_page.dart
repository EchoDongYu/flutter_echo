import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/pages/user/removal_dailog.dart';
import 'package:flutter_echo/providers/main_provider.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/ui/dialogs/prompt_dialog.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// 主页面-用户
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  MainModel get mainModel => Provider.of<MainModel>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 255.h + statusBarHeight,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [NowColors.c0xFF3288F1, NowColors.c0xFF4FAAFF],
            ),
          ),
          child: Image.asset(
            Drawable.bgLoginTop,
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          width: double.infinity,
          height: 150.h,
          margin: EdgeInsets.only(top: 106.h + statusBarHeight),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0x66F3F3F5), NowColors.c0xFFF3F3F5],
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
        ),
        SafeArea(child: EchoTopBar(showBack: false)),
        SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(12.w, 67.h, 12.w, 100.h),
                  child: Column(
                    children: [
                      // Logo区域
                      Container(
                        width: 80.r,
                        height: 80.r,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: NowColors.c0xFF3288F1,
                          borderRadius: BorderRadius.circular(24.r),
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Image.asset(Drawable.iconLogo),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'Hola!',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                          color: NowColors.c0xFF1C1F23,
                          height: 32 / 22,
                        ),
                      ),
                      Text(
                        LocalStorage().maskAccount ?? '',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: NowColors.c0xFF494C4F,
                          height: 22 / 14,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      _buildCard1(context),
                      SizedBox(height: 12.h),
                      _buildCard2(context),
                      SizedBox(height: 12.h),
                      _buildCard3(context),
                      SizedBox(height: 12.h),
                      _buildCard4(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCard1(BuildContext context) {
    return InkWell(
      onTap: () {
        //跳转账单列表
        context.push(AppRouter.billList);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 6.w, 16.h),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [NowColors.c0xFF3288F1, NowColors.c0xFF4FAAFF],
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Cuentas',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  height: 28 / 18,
                ),
              ),
            ),
            Consumer<MainModel>(
              builder: (_, provider, _) {
                return Text(
                  provider.homeInfo?.y934teOTotalAmount?.showAmount ?? '0',
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 38 / 30,
                  ),
                );
              },
            ),
            const Icon(
              Icons.arrow_right_rounded,
              color: Colors.white,
              size: 36,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard2(BuildContext context) {
    return Consumer<MainModel>(
      builder: (_, provider, child) {
        if (provider.status == 2) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            spacing: 12.w,
            children: [
              Expanded(child: child!),
              Expanded(
                child: _buildCard2Item(
                  icon: Drawable.iconMineRight,
                  text: 'Conta Bancária',
                  onTap: () => context.push(AppRouter.userBank),
                ),
              ),
            ],
          );
        }
        return child!;
      },
      child: _buildCard2Item(
        icon: Drawable.iconMineLeft,
        text: 'Sobre nosotros',
        onTap: () => context.push(AppRouter.aboutUs),
      ),
    );
  }

  Widget _buildCard2Item({
    required String icon,
    required String text,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: NowStyles.cardShadows,
        ),
        child: Column(
          spacing: 8.h,
          children: [
            Image.asset(icon, width: 36.r, height: 36.r),
            Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: NowColors.c0xFF1C1F23,
                height: 22 / 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard3(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: NowStyles.cardShadows,
      ),
      child: Consumer<MainModel>(
        builder: (_, provider, _) {
          return Column(
            children: [
              if (provider.hasPasswordEntry)
                _buildCard3Item(
                  icon: Drawable.iconMineV1,
                  text: 'Seguridad de la cuenta',
                  onTap: () {
                    final uriRoute = Uri(
                      path: AppRouter.resetPassword,
                      queryParameters: {
                        NavKey.status: mainModel.status.toString(),
                      },
                    );
                    context.push(uriRoute.toString());
                  },
                ),
              _buildCard3Item(
                icon: Drawable.iconMineV2,
                text: 'Preguntas frecuentes',
                onTap: () {
                  final uriRoute = Uri(
                    path: AppRouter.appWeb,
                    queryParameters: {
                      NavKey.title: 'Preguntas frecuentes',
                      NavKey.url: AppConst.h5Faq,
                    },
                  );
                  context.push(uriRoute.toString());
                },
              ),
              _buildCard3Item(
                icon: Drawable.iconMineV3,
                text: 'Comentarios',
                onTap: () => context.push(AppRouter.feedback),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCard3Item({
    required String icon,
    required String text,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          children: [
            Image.asset(icon, width: 24.r, height: 24.r),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: NowColors.c0xFF1C1F23,
                  height: 22 / 16,
                ),
              ),
            ),
            Image.asset(Drawable.iconMineNext, width: 20.r, height: 20.r),
          ],
        ),
      ),
    );
  }

  Widget _buildCard4(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 24.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: NowStyles.cardShadows,
      ),
      child: Row(
        spacing: 8.h,
        children: [
          _buildCard4Item(
            icon: Drawable.iconMineH1,
            text: 'Politica de\nprivacidad',
            onTap: () => context.pushH5Privacy(),
          ),
          _buildCard4Item(
            icon: Drawable.iconMineH2,
            text: 'Acuerdo de\nservicio',
            onTap: () => context.pushH5Service(),
          ),
          _buildCard4Item(
            icon: Drawable.iconMineH3,
            text: 'Eliminación\nde cuenta',
            onTap: () => _showRemovalDailog(context),
          ),
          _buildCard4Item(
            icon: Drawable.iconMineH4,
            text: 'Cerrar\nsesión',
            onTap: () => _showLogoutDialog(context),
          ),
        ],
      ),
    );
  }

  Widget _buildCard4Item({
    required String icon,
    required String text,
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Image.asset(icon, width: 24.r, height: 24.r),
            SizedBox(height: 12.h),
            Text(
              text,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: NowColors.c0xFF1C1F23,
                height: 18 / 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (_) => PromptDialog(
        title: "Cerrar sesión",
        content: "¿Estás seguro de cerrar sesión?",
        confirmText: "Cancelar",
        cancelText: "Confirmar",
        onCancel: () async {
          context.pop();
          await LocalStorage().logout();
          if (context.mounted) {
            context.go(AppRouter.loginPhone);
          }
        },
        onConfirm: () => context.pop(),
      ),
    );
  }

  void _showRemovalDailog(BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (_) => RemovalDailog(
        onConfirm: () async {
          context.pop();
          final judgeOk = await mainModel.judgeAccountCancel();
          if (judgeOk == true && context.mounted) {
            context.push(AppRouter.safetyVerify);
          }
        },
        onCancel: () => context.pop(),
      ),
    );
  }
}
