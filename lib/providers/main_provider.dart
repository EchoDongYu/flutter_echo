import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/services/api_service.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:go_router/go_router.dart';

class MainModel extends BaseProvider {
  int? _creditStatus;
  HomeInfoResp? _homeInfo;

  /// 0未授信 1授信中 2授信完成 3授信失败
  int? get status => _creditStatus;

  Future<void> getHomeInfo() async {
    final isLogin = LocalStorage().isLogin;
    if (isLogin) {
      _homeInfo = await launchRequest(() async {
        return await Api.getHomeInfo();
      });
    } else {
      _creditStatus = null;
      notifyListeners();
      return null;
    }
  }

  void changeCreditSattus() {
    if (_creditStatus == 2) {
      _creditStatus = 0;
    } else {
      _creditStatus = 2;
    }
    notifyListeners();
  }

  void defaultLaunch() async {
    switch (_creditStatus) {
      case 0:
        navigate((context) => context.push(AppRouter.stepBasic));
      default:
        final apiResult = await launchRequest(() async {
          return await Api.refreshSubmitResult();
        });
        switch (apiResult?.bopomofoOCreditStatus) {
          case 1:
            final uriRoute = Uri(
              path: AppRouter.stepProcess,
              queryParameters: {
                NavKey.count: _homeInfo?.yawnOExpectTime.toString(),
              },
            );
            navigate((context) => context.push(uriRoute.toString()));
          case 2:
            final uriRoute = Uri(
              path: AppRouter.applyConfirm,
              queryParameters: {
                NavKey.id: apiResult?.foreyardOProductId.toString(),
              },
            );
            navigate((context) => context.push(uriRoute.toString()));
          case 3:
            navigate((context) => context.push(AppRouter.stepFailed));
        }
    }
  }
}
