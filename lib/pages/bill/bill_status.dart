import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/utils/common_utils.dart';

enum BillStatus { pagos, atrasado, pendiente, fracaso, pagado, unknown }

extension BillStatusColor on BillStatus {
  Color get color => switch (this) {
    BillStatus.pagos => NowColors.c0xFF3288F1,
    BillStatus.atrasado => NowColors.c0xFFFB4F34,
    BillStatus.pendiente => NowColors.c0xFFFF9817,
    BillStatus.fracaso => NowColors.c0xFFFB4F34,
    BillStatus.pagado => NowColors.c0xFF3EB34D,
    BillStatus.unknown => Colors.transparent,
  };

  String get label => switch (this) {
    BillStatus.pagos => 'Pagos',
    BillStatus.atrasado => 'Atrasado',
    BillStatus.pendiente => 'Pendiente',
    BillStatus.fracaso => 'Fracaso',
    BillStatus.pagado => 'Pagado',
    BillStatus.unknown => '',
  };
}

///订单展示状态(产品工厂改版新增)：,0打款中,1打款失败,2打款成功且未结清未逾期,3打款成功且未结清有逾期,4全结清
BillStatus billStatus(int? status) {
  switch (status) {
    case 0:
      return BillStatus.pendiente;
    case 1:
      return BillStatus.fracaso;
    case 2:
      return BillStatus.pagos;
    case 3:
      return BillStatus.atrasado;
    case 4:
      return BillStatus.pagado;
    default:
      return BillStatus.unknown;
  }
}

String? billDateTime(
  int? status,
  List<BillDetailResp$GlacisORepaymentPlanList$Item> list,
) {
  switch (status) {
    case 3:
      return list
          .firstWhereOrNull(
            (v) => v.d95091ORepaymentStatus == 0 && v.slackOIsOverdue == true,
          )
          ?.clansmanODueDay
          ?.toString();
    case 4:
      return list.lastOrNull?.hakodateOLastRepaymentTime?.showDate;
    default:
      return list
          .firstWhereOrNull((v) => v.d95091ORepaymentStatus == 0)
          ?.r5k31qODueTime
          ?.showDate;
  }
}

String routeDetails(int? status, String? id) {
  switch (status) {
    case 0:
      return AppRouter.applyProcess;
    case 1:
      return AppRouter.applyFailed;
    case 2:
    case 3:
    case 4:
      //跳转账单详情
      return Uri(
        path: AppRouter.billDetail,
        queryParameters: {NavKey.id: id.toString()},
      ).toString();
    default:
      return AppRouter.applyProcess;
  }
}

///分期计划状态：,0未结清且到期N天之前,1未结清且到期,2未结清且逾期,3结清
Color planColor(int? status) {
  switch (status) {
    case 0:
      return NowColors.c0xFF3288F1;
    case 1:
      return NowColors.c0xFFFF9817;
    case 2:
      return NowColors.c0xFFFB4F34;
    case 3:
      return NowColors.c0xFF3EB34D;
    default:
      return NowColors.c0xFFFF9817;
  }
}
