import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/submit/step_bank_dialog.dart';
import 'package:flutter_echo/providers/user_bank_provider.dart';
import 'package:flutter_echo/ui/dialogs/prompt_dialog.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/common_utils.dart';
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
  UserBankModel get bankModel =>
      Provider.of<UserBankModel>(context, listen: false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bankModel.queryBankCardList();
    });
  }

  void _deleteBank(BuildContext context, String? id) async {
    final result = await PromptDialog.show(
      context: context,
      title: 'Borrar cuenta bancaria',
      content: '¿Está seguro de que desea eliminar esta cuenta bancaria?',
      confirmText: 'Confirmar',
      cancelText: 'Cancelar',
    );
    if (result == true) {
      bankModel.deleteBank(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      body: Stack(
        children: [
          WidgetHelper.buildTopGradient(context: context, height: 55.h),
          SafeArea(
            child: Consumer<UserBankModel>(
              builder: (context, provider, child) {
                final list = provider.bankCardList;
                final stepItems = provider.stepItems;
                return Column(
                  children: [
                    child!,
                    Expanded(
                      child: list != null && list.isNotEmpty == true
                          ? _buildCardContent(list, stepItems)
                          : _buildNoCardContent(),
                    ),
                  ],
                );
              },
              child: EchoTopBar(title: 'Cuenta bancaria'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: WidgetHelper.buildBottomButton(
        text: 'Agregar cuenta bancaria',
        onPressed: () async {
          final addOk = await StepBankDialog.show(context);
          if (addOk == true) bankModel.queryBankCardList();
        },
      ),
    );
  }

  Widget _buildNoCardContent() {
    return SingleChildScrollView(
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
    );
  }

  Widget _buildCardContent(
    List<BankCardResp$Item> bankCardList,
    List<DictItem>? stepItems,
  ) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 20.h),
      itemCount: bankCardList.length + 1,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Text(
            'Agregar o desvincular cuentas',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: NowColors.c0xFF494C4F,
              height: 20 / 13,
            ),
          );
        }
        final item = bankCardList[index - 1];
        final typeStr = stepItems
            ?.firstWhereOrNull((v) => v.key == item.exhedraOAccountType)
            ?.value;
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: NowStyles.cardShadows,
              ),
              child: Row(
                spacing: 10.w,
                children: [
                  CachedNetworkImage(
                    imageUrl: item.m871v6OBankLogo ?? '',
                    height: 44.h,
                    fit: BoxFit.fitHeight,
                    errorWidget: (context, url, error) => Image.asset(Drawable.iconDefBank),
                  ),
                  Text(
                    item.t1h91pOBankName ?? '',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: NowColors.c0xFF1C1F23,
                      height: 22 / 14,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [NowColors.c0xFF3288F1, NowColors.c0xFF4FAAFF],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: NowStyles.cardShadows,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      Drawable.bgLoginTop,
                      width: 225.w,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 32.h, 16.w, 24.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          typeStr ?? '',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            height: 18 / 13,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          item.zebrineOCardNo ?? '',
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            height: 38 / 28,
                          ),
                        ),
                        SizedBox(height: 32.h),
                        InkWell(
                          onTap: () =>
                              _deleteBank(context, item.vnbh46OBankCardGid),
                          child: Row(
                            spacing: 6.w,
                            children: [
                              Image.asset(
                                Drawable.iconDelete,
                                width: 16.r,
                                height: 16.r,
                              ),
                              Text(
                                'Borrar',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  height: 18 / 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
