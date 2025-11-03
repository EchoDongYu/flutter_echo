import 'package:flutter/material.dart';
import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/pages/main/track_dialog.dart';
import 'package:flutter_echo/services/api_service.dart';
import 'package:flutter_echo/services/permission_service.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/ui/dialogs/permission_dialog.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:go_router/go_router.dart';

class MainModel extends BaseProvider {
  /// 0未授信 1授信中 2授信完成 3授信失败
  int? get status => _creditStatus;
  int? _creditStatus;

  ///首页信息
  HomeInfoResp? get homeInfo => _homeInfo;
  HomeInfoResp? _homeInfo;

  ///前端配置信息
  MainInfoResp? _mainInfo;

  ///是否有密码入口
  bool get hasPasswordEntry =>
      _mainInfo?.fm50w8OLoginPwd == true ||
      (_mainInfo?.cressyOTraderPwd == true && _creditStatus == 2);

  ///首页选择产品
  HomeInfoResp$AssurOFaceList$Item? get pickedProduct => _pickedProduct;
  HomeInfoResp$AssurOFaceList$Item? _pickedProduct;

  double get minValue => _pickedProduct?.mojr11OLoanRangeMin ?? 0;

  double get maxValue => _pickedProduct?.xuwh2oOLoanRangeMax ?? 0;

  double get step => _pickedProduct?.marrowOLoanRangeUnit ?? 0;

  ///首页选择金额
  double get pickedValue => _pickedValue;
  double _pickedValue = 0;

  ///全部产品是否锁定
  bool get isAllLock => (_homeInfo?.nookieOCanBorrowAmount ?? 0) <= 0;

  void updateValue(double newValue) {
    double clamped = newValue.clamp(minValue, maxValue);
    double steps = ((clamped - minValue) / step).roundToDouble();
    double snapped = (minValue + steps * step).clamp(minValue, maxValue);
    _pickedValue = snapped;
    notifyListeners();
  }

  void changeProduct(HomeInfoResp$AssurOFaceList$Item item) {
    _pickedProduct = item;
    _pickedValue = item.xuwh2oOLoanRangeMax ?? 0;
    notifyListeners();
  }

  Future<void> getHomeInfo() async {
    if (LocalStorage().isLogin) {
      _homeInfo = await launchRequest(() => Api.getHomeInfo());
      _creditStatus = _homeInfo?.bopomofoOCreditStatus;
      _pickedProduct = _homeInfo?.assurOFaceList?.firstOrNull;
      _pickedValue = _pickedProduct?.xuwh2oOLoanRangeMax ?? 0;
    } else {
      _creditStatus = null;
    }
    notifyListeners();
  }

  Future<MainInfoResp?> getMainBaseInfo() async {
    if (LocalStorage().isLogin && _mainInfo == null) {
      _mainInfo = await Api.getMainBaseInfo();
      await LocalStorage().set(AppConst.mainInfoKey, _mainInfo);
      return _mainInfo;
    }
    return null;
  }

  void launchDefault() async {
    LocalStorage().set(AppConst.homeRefreshKey, true);
    switch (_creditStatus) {
      case 0:
        _launchKycStep();
        break;
      default:
        final apiResult = await launchRequest(() => Api.refreshSubmitResult());
        switch (apiResult?.bopomofoOCreditStatus) {
          case 0:
            _launchKycStep();
            break;
          case 1:
            navigate((context) => context.push(AppRouter.stepIdInfo));
            break;
          case 6:
            final uriRoute = Uri(
              path: AppRouter.stepProcess,
              queryParameters: {
                NavKey.count: _homeInfo?.yawnOExpectTime?.toString(),
              },
            );
            navigate((context) => context.push(uriRoute.toString()));
            break;
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
            break;
          case 3:
            navigate((context) => context.push(AppRouter.stepFailed));
            break;
        }
    }
  }

  void _launchKycStep() {
    switch (LocalStorage().kycStep) {
      case null:
        navigate((context) => context.push(AppRouter.stepWork));
        break;
      case 1:
        navigate((context) => context.push(AppRouter.stepWork));
        break;
      case 2:
        navigate((context) => context.push(AppRouter.stepContact));
        break;
      case 3:
        navigate((context) => context.push(AppRouter.stepIdInfo));
        break;
      default:
        navigate((context) => context.push(AppRouter.stepWork));
        break;
    }
  }

  void launchLoan() async {
    if (_homeInfo?.deepmostOHasOnLoan == true) {
      toast(
        'Usted tiene un préstamo en curso o en proceso. Por favor, espere a que se complete el desembolso antes de solicitar un nuevo préstamo.',
      );
      return;
    }
    if (_creditStatus != 2) return;
    final amount = _pickedValue;
    final productId = _pickedProduct?.foreyardOProductId;
    if (productId == null || amount <= 0) {
      return;
    }
    LocalStorage().set(AppConst.homeRefreshKey, true);
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
        final permOk = await PermissionService().requestTrackPermissions();
        if (context.mounted) {
          if (permOk == true) {
            return await TrackUploadDialog.show(context, countdown: countdown);
          } else {
            await PermissionDialog.show(context);
          }
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
