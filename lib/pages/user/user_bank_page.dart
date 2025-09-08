import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/submit/step_bank_dialog.dart';
import 'package:flutter_echo/providers/user_bank_provider.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

/// 用户银行卡页面
class UserBankPage extends StatefulWidget {
  const UserBankPage({super.key});

  @override
  State<UserBankPage> createState() => _UserBankPageState();
}

class _UserBankPageState extends State<UserBankPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final bankModel = Provider.of<UserBankModel>(context, listen: false);
      await bankModel.queryBankList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      body: Stack(
        children: [
          WidgetHelper.buildTopGradient(context: context, height: 55.h),
          SafeArea(
            child: Column(
              children: [
                EchoTopBar(title: 'Conta Bancaria'),
                _buildNoCardContent(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: WidgetHelper.buildBottomButton(
        text: 'Agregar cuenta bancaria',
        onPressed: () => StepBankDialog.show(context),
      ),
    );
  }

  Widget _buildNoCardContent() {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(28.w, 64.h, 28.w, 28.h),
        child: Column(
          children: [
            Image.asset(Drawable.iconStatusCard, width: 70.r, height: 70.r),
            SizedBox(height: 24.h),
            Text(
              'Sin cuenta bancaria',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: NowColors.c0xFF1C1F23,
                height: 26 / 18,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
