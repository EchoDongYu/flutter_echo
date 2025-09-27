import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/page_consumer.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/submit/step_bank_dialog.dart';
import 'package:flutter_echo/providers/user_bank_provider.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// 用户银行卡选择弹窗
class UserBankDialog extends StatefulWidget {
  final VoidCallback onClosing;
  final Function(BankCardResp$Item?) onConfirm;

  const UserBankDialog({
    super.key,
    required this.onClosing,
    required this.onConfirm,
  });

  /// 显示用户银行卡选择弹窗
  static Future<BankCardResp$Item?> show(BuildContext context) {
    return showModalBottomSheet<BankCardResp$Item>(
      context: context,
      useSafeArea: true,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (_) => ChangeNotifierProvider(
        create: (_) => UserBankModel(),
        builder: (_, _) => PageConsumer<UserBankModel>(
          child: UserBankDialog(
            onConfirm: (item) => context.pop(item),
            onClosing: () => context.pop(),
          ),
        ),
      ),
    );
  }

  @override
  State<UserBankDialog> createState() => _UserBankDialogState();
}

class _UserBankDialogState extends State<UserBankDialog> {
  BankCardResp$Item? _pickedItem;
  bool _dialogOverlay = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserBankModel>().queryBankCardList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: widget.onClosing,
      backgroundColor: NowColors.c0xFFF3F3F5,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: widget.onClosing,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    width: 24.r,
                    height: 24.r,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: BoxBorder.all(
                        color: NowColors.c0xFF1C1F23,
                        width: 1.6.w,
                      ),
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      color: NowColors.c0xFF1C1F23,
                      size: 16,
                    ),
                  ),
                ),
                Text(
                  'Cuenta bancaria',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: NowColors.c0xFF1C1F23,
                    height: 24 / 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 24.r, height: 24.r),
              ],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 528.h),
            child: ListView(
              primary: true,
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 36.h),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    'Seleccione una cuenta bancaria disponible',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: NowColors.c0xFF494C4F,
                      height: 20 / 13,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Consumer<UserBankModel>(
                  builder: (context, provider, _) {
                    final list = provider.bankCardList;
                    final stepItems = provider.stepItems;
                    return list == null
                        ? SizedBox()
                        : list.isNotEmpty == true
                        ? _buildCardContent(list, stepItems)
                        : _buildNoCardContent();
                  },
                ),
                SizedBox(height: 20.h),
                if (!_dialogOverlay)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: EchoOutlinedButton(
                      text: 'Agregar cuenta bancaria',
                      onPressed: () async {
                        setState(() => _dialogOverlay = true);
                        final result = await StepBankDialog.show(context);
                        setState(() => _dialogOverlay = false);
                        if (result == true && context.mounted) {
                          context.read<UserBankModel>().queryBankCardList();
                        }
                      },
                    ),
                  ),
              ],
            ),
          ),
          WidgetHelper.buildBottomButton(
            text: 'Confirmar elección',
            enable: _pickedItem != null,
            onPressed: () => widget.onConfirm(_pickedItem),
          ),
        ],
      ),
    );
  }

  Widget _buildNoCardContent() {
    return Column(
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
        SizedBox(height: 12.h),
      ],
    );
  }

  Widget _buildCardContent(
    List<BankCardResp$Item> bankCardList,
    List<DictItem>? stepItems,
  ) {
    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      itemCount: bankCardList.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final item = bankCardList[index];
        final typeValue = stepItems
            ?.firstWhereOrNull((v) => v.key == item.exhedraOAccountType)
            ?.value;
        return InkWell(
          onTap: () {
            if (_pickedItem == item) {
              setState(() => _pickedItem = null);
            } else {
              setState(() => _pickedItem = item);
            }
          },
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Container(
            decoration: BoxDecoration(),
            child: _buildCardItem(item, typeValue),
          ),
        );
      },
    );
  }

  Widget _buildCardItem(BankCardResp$Item item, String? type) {
    final isSelected = _pickedItem == item;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: BoxBorder.all(
              color: isSelected ? NowColors.c0xFF3288F1 : Colors.transparent,
              width: 1.w,
            ),
            borderRadius: const BorderRadius.only(
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
              ),
              Expanded(
                child: Text(
                  item.t1h91pOBankName ?? '',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: NowColors.c0xFF1C1F23,
                    height: 22 / 14,
                  ),
                ),
              ),
              Image.asset(
                isSelected ? Drawable.iconSelectOn : Drawable.iconSelectOff,
                width: 22.r,
                height: 22.r,
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
                  width: 150.w,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      type ?? '',
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
