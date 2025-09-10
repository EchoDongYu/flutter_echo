import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/providers/upgrade_provider.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/ui/dialogs/disclosure_dialog.dart';
import 'package:flutter_echo/ui/dialogs/privacy_dialog.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// 闪屏页面
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  UpgradeModel get upgradeModel =>
      Provider.of<UpgradeModel>(context, listen: false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkDisclosure(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Drawable.iconLogo, width: 80.r, height: 80.r),
                SizedBox(height: 30.h),
                Text(
                  AppConst.applicationName,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: NowColors.c0xFF1C1F23,
                    height: 24 / 24,
                  ),
                ),
                SizedBox(height: 90.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _checkDisclosure(BuildContext context) async {
    final baseInfo = await upgradeModel.getMainBaseInfo();
    if (baseInfo?.b369n2OUpgradeVersion != null && context.mounted) {}
    if (LocalStorage().disclosure != true && context.mounted) {
      final privacy = await PrivacyDialog.show(context);
      if (privacy == true && context.mounted) {
        await DisclosureDialog.show(context);
      }
    }
    Future.delayed(Duration(milliseconds: 500), () {
      if (context.mounted) context.go(AppRouter.main);
    });
  }
}
