import 'package:flutter/material.dart';
import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/pages/main/track_dialog.dart';
import 'package:flutter_echo/services/api_service.dart';
import 'package:flutter_echo/services/permission_service.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:go_router/go_router.dart';

class MainModel extends BaseProvider {
  int? _creditStatus;
  HomeInfoResp? _homeInfo;

  /// 0未授信 1授信中 2授信完成 3授信失败
  int? get status => _creditStatus;

  HomeInfoResp? get homeInfo => _homeInfo;

  Future<void> getHomeInfo() async {
    if (LocalStorage().isLogin) {
      _homeInfo = await launchRequest(() => Api.getHomeInfo());
      _creditStatus = _homeInfo?.bopomofoOCreditStatus;
    } else {
      _creditStatus = null;
      notifyListeners();
    }
  }

  void launchDefault() async {
    switch (_creditStatus) {
      case 0:
        navigate((context) => context.push(AppRouter.stepBasic));
      default:
        final apiResult = await launchRequest(() => Api.refreshSubmitResult());
        switch (apiResult?.bopomofoOCreditStatus) {
          case 1:
            final uriRoute = Uri(
              path: AppRouter.stepProcess,
              queryParameters: {
                NavKey.count: _homeInfo?.yawnOExpectTime?.toString(),
              },
            );
            navigate((context) => context.push(uriRoute.toString()));
          case 2:
            final productId = apiResult?.foreyardOProductId;
            final amount = apiResult?.nookieOCanBorrowAmount;
            if (productId == null || amount == null || amount <= 0) {
              return;
            }
            final uriRoute = Uri(
              path: AppRouter.applyConfirm,
              queryParameters: {
                NavKey.id: productId.toString(),
                NavKey.amount: amount.toString(),
              },
            );
            navigate((context) => context.push(uriRoute.toString()));
          case 3:
            navigate((context) => context.push(AppRouter.stepFailed));
        }
    }
  }

  void launchLoan({int? productId, double? amount}) async {
    if (_creditStatus != 2) return;
    if (productId == null || amount == null || amount <= 0) {
      return;
    }
    final uriRoute = Uri(
      path: AppRouter.applyConfirm,
      queryParameters: {
        NavKey.id: productId.toString(),
        NavKey.amount: amount.toString(),
      },
    );
    navigate((context) => context.push(uriRoute.toString()));
  }

  Future<bool?> launchOk(BuildContext context) async {
    if (!LocalStorage().isLogin) {
      navigate((context) => context.push(AppRouter.loginPhone));
      return false;
    }
    final need = await launchRequest(() => Api.needReport());
    final countdown = need?.paroxysmOReportTimeOut;
    if (need?.q0ui28OIsNeedReport != true || countdown == null) return true;
    if (countdown > 0 && context.mounted) {
      final agreeOk = await TrackIntroDialog.show(context);
      if (agreeOk == true && context.mounted) {
        final permOk = await PermissionService().requestAllPermissions();
        if (permOk == true && context.mounted) {
          return await TrackUploadDialog.show(context, countdown: countdown);
        }
      }
    }
    return false;
  }

  Future<bool?> judgeAccountCancel() async {
    return await launchRequest(() async {
      return Api.judgeAccountCancel();
    });
  }
}
