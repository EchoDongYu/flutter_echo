import 'package:flutter/material.dart';
import 'package:flutter_echo/common/base_provider.dart';
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
  int? _creditStatus;

  HomeInfoResp? get homeInfo => _homeInfo;
  HomeInfoResp? _homeInfo;

  /// 0未授信 1授信中 2授信完成 3授信失败
  int? get status => _creditStatus;

  HomeInfoResp$AssurOFaceList$Item? get pickedProduct => _pickedProduct;
  HomeInfoResp$AssurOFaceList$Item? _pickedProduct;

  double get minValue => _minValue;
  double _minValue = 0;

  double get maxValue => _maxValue;
  double _maxValue = 0;

  double get step => _step;
  double _step = 0;

  double get value => _value;
  double _value = 0;

  bool get isLock =>
      (_homeInfo?.u6n134OSpareCanBorrowAmount ?? 0) <= 0 ||
      _pickedProduct?.faroucheOIsLock == true;

  void updateValue(double newValue) {
    double clamped = newValue.clamp(_minValue, _maxValue);
    double steps = ((clamped - _minValue) / _step).roundToDouble();
    double snapped = (_minValue + steps * _step).clamp(_minValue, _maxValue);
    _value = snapped;
    notifyListeners();
  }

  void changeProduct(HomeInfoResp$AssurOFaceList$Item item) {
    _pickedProduct = item;
    _maxValue = item.xuwh2oOLoanRangeMax ?? 0;
    _minValue = item.mojr11OLoanRangeMin ?? 0;
    _step = item.marrowOLoanRangeUnit ?? 0;
    _value = item.xuwh2oOLoanRangeMax ?? 0;
    notifyListeners();
  }

  Future<void> getHomeInfo() async {
    if (LocalStorage().isLogin) {
      _homeInfo = await launchRequest(() => Api.getHomeInfo());
      _creditStatus = _homeInfo?.bopomofoOCreditStatus;
      _pickedProduct = _homeInfo?.assurOFaceList?.firstOrNull;
      _maxValue = _pickedProduct?.xuwh2oOLoanRangeMax ?? 0;
      _minValue = _pickedProduct?.mojr11OLoanRangeMin ?? 0;
      _step = _pickedProduct?.marrowOLoanRangeUnit ?? 0;
      _value = _pickedProduct?.xuwh2oOLoanRangeMax ?? 0;
    } else {
      _creditStatus = null;
      notifyListeners();
    }
  }

  Future<MainInfoResp?> getMainBaseInfo() async {
    if (LocalStorage().isLogin) {
      return Api.getMainBaseInfo();
    }
    return null;
  }

  void launchDefault() async {
    switch (_creditStatus) {
      case 0:
        _launchKycStep();
      default:
        final apiResult = await launchRequest(() => Api.refreshSubmitResult());
        switch (apiResult?.bopomofoOCreditStatus) {
          case 0:
            _launchKycStep();
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

  void _launchKycStep() {
    switch (LocalStorage().kycStep) {
      case null:
        navigate((context) => context.push(AppRouter.stepBasic));
      case 1:
        navigate((context) => context.push(AppRouter.stepWork));
      case 2:
        navigate((context) => context.push(AppRouter.stepContact));
      default:
        navigate((context) => context.push(AppRouter.stepBasic));
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
    final amount = _value;
    final productId = _pickedProduct?.foreyardOProductId;
    if (productId == null || amount <= 0) {
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
