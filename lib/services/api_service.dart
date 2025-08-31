import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/services/api_config.dart';
import 'package:flutter_echo/utils/common_utils.dart';

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

  /// [type] 验证码类型：1注册验证码；2修改登录密码；3修改交易密码；4 借款验证码； 5换设备验证码；6 账户注销 ; 7 登录验证码
  static Future<bool?> needCheckCaptcha({
    required String mobile,
    required int type,
  }) {
    return _apiService.post(
      ApiPath.needCheckCaptcha,
      body: NeedCaptchaReq(sordidOMobile: mobile, type: type).toJson(),
    );
  }

  /// [type] 验证码类型：1注册验证码；2修改登录密码；3修改交易密码；4借款验证码；5登录验证码
  /// [mobileSn] 设备号
  /// [imageCode] 图形验证码
  static Future<bool> checkCaptchaCode({
    required String mobile,
    required int type,
    required String? mobileSn,
    required String imageCode,
  }) {
    return _apiService.postSt(
      ApiPath.checkCaptchaCode,
      body: CaptchaCheckReq(
        sordidOMobile: mobile,
        type: type,
        ac0as4OMobileSn: mobileSn,
        xwkarvOImageCode: imageCode,
      ).toJson(),
    );
  }

  /// [type] 验证码类型：1注册验证码；2修改登录密码；3修改交易密码；4借款验证码；5登录验证码；6账户注销; 7 登录验证码
  /// [msgType] 消息类型：0:短信，1：语音，不填默认短信
  /// [dType] 消息类型:0短信（默认），1whatsapp
  static Future<bool> sendVerificationCode({
    required String mobile,
    required String type,
    String? msgType,
    int? dType,
  }) {
    return _apiService.postSt(
      ApiPath.sendVerificationCode,
      body: CodeSendReq(
        sordidOMobile: mobile,
        type: type,
        j62tn1OMsgType: msgType,
        n66w89ODtype: dType,
      ).toJson(),
    );
  }

  /// [type] 验证码类型：1注册验证码；2修改登录密码；3修改交易密码；4借款验证码；5登录验证码
  /// [verifyCode] 验证码
  /// [imageCode] 图形验证码
  static Future<bool> checkVerificationCode({
    required String mobile,
    required int type,
    required String verifyCode,
    String? imageCode,
  }) {
    return _apiService.postSt(
      ApiPath.checkVerificationCode,
      body: CodeVerifyReq(
        sordidOMobile: mobile,
        type: type,
        presageOVerCode: verifyCode,
        snafuOVerImageCode: imageCode,
      ).toJson(),
    );
  }

  /// [password] 登录密码
  /// [oc] 是否需要otp校验
  /// [verifyCode] 验证码
  /// [imageCode] 图形验证码
  static Future<LoginResp> loginUser({
    required String mobile,
    String? password,
    int? oc,
    String? verifyCode,
    String? imageCode,
  }) {
    return _apiService.post(
      ApiPath.loginUser,
      body: LoginReq(
        sordidOMobile: mobile,
        password: password,
        oc: oc,
        presageOVerCode: verifyCode,
        snafuOVerImageCode: imageCode,
      ).toJson(),
      convert: (json) => LoginResp.fromJson(json),
    );
  }

  /// [password] 登录密码
  /// [verifyCode] 验证码
  /// [imageCode] 图形验证码
  /// [dType] 消息类型:0短信（默认），1whatsapp
  static Future<RegisterResp> registerUser({
    required String mobile,
    required String password,
    required String verifyCode,
    String? imageCode,
    int? dType,
  }) {
    return _apiService.post(
      ApiPath.registerUser,
      body: RegisterReq(
        sordidOMobile: mobile,
        password: password,
        presageOVerCode: verifyCode,
        snafuOVerImageCode: imageCode,
        n66w89ODtype: dType,
        vkql27OReqChannel: FlutterPlatform.reqChannel,
      ).toJson(),
      convert: (json) => RegisterResp.fromJson(json),
    );
  }
}
