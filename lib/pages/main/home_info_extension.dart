import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/utils/common_utils.dart';

///订单展示状态(产品工厂改版新增)：,0打款中,1打款失败,2打款成功且未结清未逾期,3打款成功且未结清有逾期,4全结清
extension HomeInfoExtension on HomeInfoResp$PapuanOLastRecordLoan {
  Color get color => switch (cherubimOOrderStatus) {
    0 => NowColors.c0xFFFF9817,
    1 => NowColors.c0xFFFB4F34,
    2 => NowColors.c0xFF1C1F23.withValues(alpha: 0.5),
    3 => NowColors.c0xFFFB4F34,
    4 => NowColors.c0xFF3EB34D,
    _ => Colors.transparent,
  };

  String get statusLabel => switch (cherubimOOrderStatus) {
    0 => 'Pendiente',
    1 => 'Fracaso',
    2 => 'Pagos',
    3 => 'Atrasado',
    4 => 'Pagado',
    _ => '',
  };

  String get timeLabel => switch (cherubimOOrderStatus) {
    2 => switch (wa5f08OOrderDueDays) {
      -2 => 'Vence mañana',
      -1 => 'Vence Hoy',
      _ => encloseOOrderTime?.showDate ?? '',
    },
    3 => '$wa5f08OOrderDueDays Dias Atrasados',
    _ => encloseOOrderTime?.showDate ?? '',
  };

  String get route {
    switch (cherubimOOrderStatus) {
      case 0:
        return AppRouter.applyProcess;
      case 1:
        return AppRouter.applyFailed;
      case 2:
      case 3:
      case 4:
        final count = ez64t7OPeriodCount ?? 0;
        return Uri(
          path: count == 1 ? AppRouter.repayConfirm : AppRouter.billDetail,
          queryParameters: {NavKey.id: r5a4x8OLoanGid},
        ).toString();
      default:
        return AppRouter.applyProcess;
    }
  }
}

extension ProductExtension on HomeInfoResp$AssurOFaceList$Item {
  String get periodLabel {
    final count = peddlerOPeriodCountId?.tryParseInt ?? 0;
    return count > 1
        ? '$peddlerOPeriodCountId Cuotas'
        : '$peddlerOPeriodCountId Cuota';
  }
}
