import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/utils/common_utils.dart';

enum BillStatus { pagos, atrasado, pendiente, fracaso, pagado, unknown }

extension BillStatusColor on BillStatus {
  Color get billColor => switch (this) {
    BillStatus.pendiente => NowColors.c0xFFFF9817,
    BillStatus.fracaso => NowColors.c0xFFFB4F34,
    BillStatus.pagos => NowColors.c0xFF3288F1,
    BillStatus.atrasado => NowColors.c0xFFFB4F34,
    BillStatus.pagado => NowColors.c0xFF3EB34D,
    _ => Colors.transparent,
  };

  String get label => switch (this) {
    BillStatus.pendiente => 'Pendiente',
    BillStatus.fracaso => 'Fracaso',
    BillStatus.pagos => 'Pagos',
    BillStatus.atrasado => 'Atrasado',
    BillStatus.pagado => 'Pagado',
    _ => '',
  };
}

///订单展示状态(产品工厂改版新增)：,0打款中,1打款失败,2打款成功且未结清未逾期,3打款成功且未结清有逾期,4全结清
BillStatus billStatus(int? status) => switch (status) {
  0 => BillStatus.pendiente,
  1 => BillStatus.fracaso,
  2 => BillStatus.pagos,
  3 => BillStatus.atrasado,
  4 => BillStatus.pagado,
  _ => BillStatus.unknown,
};

extension BillDetailExtension on BillDetailResp {
  String? dateTime(List<BillDetailResp$GlacisORepaymentPlanList$Item> list) {
    switch (cherubimOOrderStatus) {
      case 3:
        return list
            .firstWhereOrNull((v) => v.i2jk5fOPeriodStatus == 2)
            ?.clansmanODueDay
            ?.toString();
      case 4:
        return list.lastOrNull?.hakodateOLastRepaymentTime?.showDate;
      default:
        return list
            .firstWhereOrNull(
              (v) => v.i2jk5fOPeriodStatus == 0 || v.i2jk5fOPeriodStatus == 1,
            )
            ?.r5k31qODueTime
            ?.showDate;
    }
  }
}

extension BillInfoExtension on LoanBillResp$Ouxtd3OLoanList$Item {
  String get route {
    switch (cherubimOOrderStatus) {
      case 0:
        return AppRouter.applyProcess;
      case 1:
        return AppRouter.applyFailed;
      case 2:
      case 3:
      case 4:
        return Uri(
          path: AppRouter.billDetail,
          queryParameters: {NavKey.id: r5a4x8OLoanGid},
        ).toString();
      default:
        return AppRouter.applyProcess;
    }
  }
}

///分期计划状态：,0未结清且到期N天之前,1未结清且到期,2未结清且逾期,3结清
Color planColor(int? status) => switch (status) {
  2 => NowColors.c0xFFFB4F34,
  3 => NowColors.c0xFF3EB34D,
  _ => NowColors.c0xFF3288F1,
};
