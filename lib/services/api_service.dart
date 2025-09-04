import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/services/api_config.dart';
import 'package:flutter_echo/utils/common_utils.dart';

class Api {
  Api._();

  static final _apiService = ApiController(AppConst.baseUrl);

  static Future<CheckRegisterResp> isRegister({required String? mobile}) {
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
    required String? mobile,
    required int? type,
  }) async {
    return await _apiService.post(
      ApiPath.needCheckCaptcha,
      body: NeedCaptchaReq(sordidOMobile: mobile, type: type).toJson(),
    );
  }

  /// [type] 验证码类型：1注册验证码；2修改登录密码；3修改交易密码；4借款验证码；5登录验证码
  /// [imageCode] 图形验证码
  static Future<bool> checkCaptchaCode({
    required String? mobile,
    required int? type,
    required String? imageCode,
  }) {
    return _apiService.postSt(
      ApiPath.checkCaptchaCode,
      body: CaptchaCheckReq(
        sordidOMobile: mobile,
        type: type,
        xwkarvOImageCode: imageCode,
      ).toJson(),
    );
  }

  /// [type] 验证码类型：1注册验证码；2修改登录密码；3修改交易密码；4借款验证码；5登录验证码；6账户注销; 7 登录验证码
  /// [msgType] 消息类型：0:短信，1：语音，不填默认短信
  /// [dType] 消息类型:0短信（默认），1whatsapp
  static Future<bool> sendVerificationCode({
    required String? mobile,
    required String? type,
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
    required String? mobile,
    required int? type,
    required String? verifyCode,
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
    required String? mobile,
    String? verifyCode,
    String? imageCode,
    String? password,
  }) {
    return _apiService.post(
      ApiPath.loginUser,
      body: LoginReq(
        sordidOMobile: mobile,
        presageOVerCode: verifyCode,
        snafuOVerImageCode: imageCode,
        password: password,
      ).toJson(),
      convert: (json) => LoginResp.fromJson(json),
    );
  }

  /// [password] 登录密码
  /// [verifyCode] 验证码
  /// [imageCode] 图形验证码
  /// [dType] 消息类型:0短信（默认），1whatsapp
  static Future<LoginResp> registerUser({
    required String? mobile,
    required String? verifyCode,
    String? imageCode,
    String? password,
    int? dType,
  }) {
    return _apiService.post(
      ApiPath.registerUser,
      body: RegisterReq(
        sordidOMobile: mobile,
        presageOVerCode: verifyCode,
        snafuOVerImageCode: imageCode,
        password: password,
        n66w89ODtype: dType,
        vkql27OReqChannel: FlutterPlatform.reqChannel,
      ).toJson(),
      convert: (json) => LoginResp.fromJson(json),
    );
  }

  static Future<UserInfoResp> getUserBaseInfo() {
    return _apiService.post(
      ApiPath.getUserBaseInfo,
      body: UserInfoReq().toJson(),
      convert: (json) => UserInfoResp.fromJson(json),
    );
  }

  /// 字典分类(多个使用逗号分割) :0 性别 1 学历 2 收入 3 婚姻状况 4 工作状况（职业） 5 住房状态 6 其他贷款
  /// 7 工作年限 8 发薪周期 9 城市列表 10 联系人-关系 11 电费账单 12 每月家庭支出 13 借款目的 14 意见反馈
  /// 17 whatsapp 18 客服邮箱 21 客服热线 22 账户类型 23 公司官网 24 公司地址 25 注销挽留 26 银行直连线下还款银行字典
  static Future<Map<String, List<StepItem>?>> getDictionary(String types) {
    return _apiService.post(
      ApiPath.getDictionary,
      body: {'types': types},
      convert: (json) => (json as Map<String, dynamic>).map((key, value) {
        return MapEntry<String, List<StepItem>?>(
          key,
          (value as List<dynamic>?)
              ?.map((it) => StepItem.fromJson(it))
              .toList(),
        );
      }),
    );
  }

  static Future<bool> checkSubmitValid({String? email, String? id}) {
    return _apiService.postSt(
      ApiPath.checkSubmitValid,
      body: SubmitCheckReq(f31u3kOEmail: email, merdekaOIdCard: id).toJson(),
    );
  }

  static Future<SubmitDataResp> submitCreditData(SubmitDataReq data) {
    return _apiService.post(
      ApiPath.submitCreditData,
      body: data.toJson(),
      convert: (json) => SubmitDataResp.fromJson(json),
    );
  }

  static Future<HomeInfoResp> getHomeInfo() {
    return _apiService.post(
      ApiPath.getHomeInfo,
      body: HomeInfoReq().toJson(),
      convert: (json) => HomeInfoResp.fromJson(json),
    );
  }

  static Future<LoanConfirmResp> confirmLoan(SubmitDataReq data) {
    return _apiService.post(
      ApiPath.confirmLoan,
      body: LoanConfirmReq().toJson(),
      convert: (json) => LoanConfirmResp.fromJson(json),
    );
  }
}
