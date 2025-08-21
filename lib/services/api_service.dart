import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/services/api_config.dart';

class Api {
  Api._();

  static final _apiService = ApiController(AppConst.baseUrl);

  static Future<CheckRegisterResp> isRegister({required String mobile}) {
    return _apiService.post(
      ApiPath.isRegister,
      body: CheckRegisterReq(
        sordidOMobile: mobile,
        d7x52pOBizChannel: AppConst.channel,
        s377v5OBizLine: AppConst.bizLine,
      ).toJson(),
      convert: (json) => CheckRegisterResp.fromJson(json),
    );
  }

  static Future<NeedCaptchaResp> needCheckCaptcha({
    required String mobile,
    required int type,
  }) {
    return _apiService.post(
      ApiPath.needCheckCaptcha,
      body: NeedCaptchaReq(sordidOMobile: mobile, type: type).toJson(),
      convert: (json) => NeedCaptchaResp.fromJson(json),
    );
  }

  static Future<LoginResp> loginUser({
    required String mobile,
    required int type,
  }) {
    return _apiService.post(
      ApiPath.loginUser,
      body: LoginReq(sordidOMobile: mobile).toJson(),
      convert: (json) => LoginResp.fromJson(json),
    );
  }
}
