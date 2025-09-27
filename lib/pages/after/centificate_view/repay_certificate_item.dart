import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RepayCertificateItem extends StatelessWidget {
  final RepayRecordResp$Item item;

  const RepayCertificateItem(this.item, {super.key});

  ///还款状态（0、处理中1、成功2、失败3、取消）
  String get label => switch (item.status) {
    0 => 'En curso',
    1 => 'Exitos',
    2 => 'Fallo',
    _ => '',
  };

  ///还款状态（0、处理中1、成功2、失败3、取消）
  Color get color => switch (item.status) {
    0 => NowColors.c0xFFFF9817,
    1 => NowColors.c0xFF3EB34D,
    2 => NowColors.c0xFFFB4F34,
    _ => Colors.transparent,
  };

  @override
  Widget build(BuildContext context) {
    return CommonBox(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          CommonBox(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            color: NowColors.c0xFF3288F1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hora de solicitud',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFFFFFFFF,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      item.staticsOCreateTime?.showDateTime ?? '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFFFFFFFF,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'No. ${item.e77490ORequestId}',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: NowColors.c0xFFFFFFFF,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          width: 1,
                          color: NowColors.c0xFFFFFFFF,
                        ),
                      ),
                      child: Text(
                        label,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: NowColors.c0xFFFFFFFF,
                          height: 22 / 14,
                        ),
                      ),
                    ),
                  ],
                ),
                CommonBox(
                  color: NowColors.c0x00000000.withValues(alpha: 0.1),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    spacing: 9.w,
                    children: [
                      Image.asset(Drawable.iconXtinfo, width: 18, height: 18),
                      Expanded(
                        child: Text(
                          item.ratteenORejectReason ?? '',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: NowColors.c0x00000000.withValues(alpha: 0.9),
                            height: 16 / 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CommonBox(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Depósito al banco',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFF77797B,
                      ),
                    ),
                    Text(
                      item.t1h91pOBankName ?? '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFF1C1F23,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Importe del pago',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFF77797B,
                      ),
                    ),
                    Text(
                      item.o12sd0OAmount?.showAmount ?? '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFF1C1F23,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Fecha del depósito',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFF77797B,
                      ),
                    ),
                    Text(
                      item.payTime?.showDate ?? '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFF1C1F23,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Nombre del pagador',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFF77797B,
                      ),
                    ),
                    Text(
                      item.lz09kpOUserName ?? '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFF1C1F23,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Comprobante',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFF77797B,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        final uri = Uri(
                          path: AppRouter.photoView,
                          queryParameters: {NavKey.url: item.electiveOPicUrl},
                        );
                        context.push(uri.toString());
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.r),
                        child: CachedNetworkImage(
                          imageUrl: item.electiveOPicUrl ?? '',
                          height: 44.h,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
