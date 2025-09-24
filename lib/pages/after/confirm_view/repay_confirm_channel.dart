import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepayConfirmChannel extends StatelessWidget {
  final List<BillDetailResp$V08uw3ORepaymentChannelList$Item> channelList;
  final BillDetailResp$V08uw3ORepaymentChannelList$Item? selectedChannel;
  final Function(BillDetailResp$V08uw3ORepaymentChannelList$Item)
  onSelectChannel;

  const RepayConfirmChannel({
    super.key,
    required this.channelList,
    required this.selectedChannel,
    required this.onSelectChannel,
  });

  @override
  Widget build(BuildContext context) {
    final channels1 = channelList.where((v) => v.fratOMark == '1').toList();
    final channels2 = channelList.where((v) => v.fratOMark != '1').toList();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: NowColors.c0xFFFFFFFF,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: NowStyles.cardShadows,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (channels1.isNotEmpty) ...[
            Text(
              'Opcion 1',
              style: TextStyle(
                fontSize: 18.sp,
                color: NowColors.c0xFF1C1F23,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Si no puede pagar con el opcion 1, utiliza el opcion 2 para hacer el pago.',
              style: TextStyle(
                fontSize: 12.sp,
                color: NowColors.c0xFFFF9817,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 16.h),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: channels1.length,
              separatorBuilder: (_, _) => SizedBox(height: 10.h),
              itemBuilder: (context, index) {
                final channelInfo = channels1[index];
                return PickItem(
                  label: channelInfo.ejv164OChannelTypeName ?? '',
                  selected: selectedChannel == channelInfo,
                  onTap: () => onSelectChannel(channelInfo),
                );
              },
            ),
          ],
          if (channels1.isNotEmpty && channels2.isNotEmpty)
            SizedBox(height: 32.h),
          if (channels2.isNotEmpty) ...[
            Text(
              'Opcion 2',
              style: TextStyle(
                fontSize: 18.sp,
                color: NowColors.c0xFF1C1F23,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Seleccionar método de pago',
              style: TextStyle(
                fontSize: 12.sp,
                color: NowColors.c0xFF77797B,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 16.h),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: channels2.length,
              separatorBuilder: (_, _) => SizedBox(height: 10.h),
              itemBuilder: (context, index) {
                final channelInfo = channels2[index];
                return PickItem(
                  label: channelInfo.ejv164OChannelTypeName ?? '',
                  selected: selectedChannel == channelInfo,
                  onTap: () => onSelectChannel(channelInfo),
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}

class PickItem extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;

  const PickItem({
    super.key,
    required this.label,
    required this.selected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: CommonBox(
        padding: const EdgeInsets.all(16),
        color: selected
            ? NowColors.c0xFF3288F1.withValues(alpha: 0.1)
            : NowColors.c0xFFF3F3F5,
        borderColor: selected ? NowColors.c0xFF3288F1 : NowColors.c0x00000000,
        child: Row(
          children: [
            Image.asset(
              selected ? Drawable.iconSelectOn : Drawable.iconSelectOff,
              width: 22,
              height: 22,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF1C1F23,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
