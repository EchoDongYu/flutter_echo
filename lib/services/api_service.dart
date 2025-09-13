import 'dart:convert';

import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/services/api_config.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

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

  /// [type] 验证码类型：1注册验证码；2修改登录密码；3修改交易密码；4借款验证码；5登录验证码；6账户注销; 7 登录验证码
  static Future<bool?> needCheckCaptcha({
    required String? mobile,
    required int? type,
  }) async {
    return await _apiService.post(
      ApiPath.needCheckCaptcha,
      body: NeedCaptchaReq(sordidOMobile: mobile, type: type).toJson(),
    );
  }

  /// [type] 验证码类型：1注册验证码；2修改登录密码；3修改交易密码；4借款验证码；5登录验证码；6账户注销; 7 登录验证码
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

  /// [type] 验证码类型：1注册验证码；2修改登录密码；3修改交易密码；4借款验证码；5登录验证码；6账户注销; 7 登录验证码
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

  /// 用户基本信息查询
  static Future<UserInfoResp> getUserBaseInfo() async {
    final apiResult = await _apiService.post(
      ApiPath.getUserBaseInfo,
      body: UserInfoReq().toJson(),
      convert: (json) => UserInfoResp.fromJson(json),
    );
    LocalStorage().set(AppConst.userInfoKey, apiResult);
    return apiResult;
  }

  /// 银行账户列表
  static Future<BankCardResp?> queryBankCardList() {
    return _apiService.post(
      ApiPath.queryBankCardList,
      body: BankCardReq().toJson(),
      convert: (json) => (json as List<dynamic>?)
          ?.map((e) => BankCardResp$Item.fromJson(e))
          .toList(),
    );
  }

  /// 查询支持的银行列表
  static Future<BankVOResp?> queryBankList() {
    return _apiService.post(
      ApiPath.queryBankList,
      body: BankVOReq().toJson(),
      convert: (json) => (json as List<dynamic>?)
          ?.map((e) => BankVOResp$Item.fromJson(e))
          .toList(),
    );
  }

  /// 绑定银行卡
  static Future<BindCardResp> bindBankCard(BindCardReq req) {
    return _apiService.post(
      ApiPath.bindBankCard,
      body: req.toJson(),
      convert: (json) => BindCardResp.fromJson(json),
    );
  }

  /// 删除银行卡
  static Future<bool> deleteBankCard(String? id) {
    return _apiService.postSt(
      ApiPath.deleteBankCard,
      body: BankDeleteReq(vnbh46OBankCardGid: id).toJson(),
    );
  }

  /// 判断是否可注销（APP）
  static Future<bool> judgeAccountCancel() {
    return _apiService.postSt(
      ApiPath.judgeAccountCancel,
      body: AccountCancelJudgeReq().toJson(),
    );
  }

  /// 账户注销(APP)
  static Future<bool> accountCancelApp({
    required String? mobile,
    required String? verifyCode,
    String? imageCode,
  }) {
    return _apiService.postSt(
      ApiPath.accountCancelApp,
      body: AccountCancelAppReq(
        sordidOMobile: mobile,
        presageOVerCode: verifyCode,
        snafuOVerImageCode: imageCode,
        source: 1,
        pageId: '1',
      ).toJson(),
    );
  }

  /// 重置登录密码
  static Future<bool> resetLoginPassword({
    required String? password,
    required String? verifyCode,
    String? imageCode,
  }) {
    return _apiService.postSt(
      ApiPath.resetLoginPassword,
      body: LoginPwdResetReq(
        sordidOMobile: LocalStorage().account,
        password: password,
        presageOVerCode: verifyCode,
        snafuOVerImageCode: imageCode,
      ).toJson(),
    );
  }

  /// 重置交易密码
  static Future<bool> resetTraderPassword({
    required String? type,
    required String? password,
    String? verifyCode,
    String? imageCode,
    String? idCard,
  }) {
    return _apiService.postSt(
      ApiPath.resetTraderPassword,
      body: TraderPwdResetReq(
        sordidOMobile: LocalStorage().account,
        type: type,
        password: password,
        presageOVerCode: verifyCode,
        snafuOVerImageCode: imageCode,
        merdekaOIdCard: idCard,
      ).toJson(),
    );
  }

  /// 交易密码校验
  static Future<bool> checkTraderPassword({
    required String? password,
    required String? orderId,
  }) {
    return _apiService.postSt(
      ApiPath.checkTraderPassword,
      body: TraderPwdCheckReq(
        c4s47hOTransPassword: password,
        z38e62OOrderGid: orderId,
      ).toJson(),
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
          (value as List<dynamic>?)?.map((v) => StepItem.fromJson(v)).toList(),
        );
      }),
    );
  }

  /// 邮箱、身份证号校验
  static Future<bool> checkSubmitValid({String? email, String? id}) {
    return _apiService.postSt(
      ApiPath.checkSubmitValid,
      body: SubmitCheckReq(f31u3kOEmail: email, merdekaOIdCard: id).toJson(),
    );
  }

  /// 提交授信数据
  static Future<int> submitCreditData(SubmitDataReq data) {
    return _apiService.post(ApiPath.submitCreditData, body: data.toJson());
  }

  /// 刷新授信结果
  static Future<SubmitResultResp> refreshSubmitResult() {
    return _apiService.post(
      ApiPath.refreshSubmitResult,
      body: SubmitResultReq().toJson(),
      convert: (json) => SubmitResultResp.fromJson(json),
    );
  }

  /// 判断是否需要上报
  static Future<NeedReportResp> needReport() {
    return _apiService.post(
      ApiPath.needReport,
      body: HomeInfoReq().toJson(),
      convert: (json) => NeedReportResp.fromJson(json),
    );
  }

  /// 上报新版本（含大数据短信）
  static Future<bool> uploadTrack() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final storage = LocalStorage();
    final userGid = storage.userGid;
    final deviceId = storage.deviceId;
    final reqJson = TrackReportReq(
      raiaOUserGid: userGid,
      z775udOAppVersion: packageInfo.version,
      spankOAppsflyerId: deviceId,
    ).toJson();
    final codeUnits = json.encode(reqJson).codeUnits;
    final offsetData = codeUnits
        .map((v) => String.fromCharCode(v ^ AppConst.dataOffset))
        .join();
    return _apiService.report(ApiPath.reportTrack, body: {'data': offsetData});
  }

  /// 获取首页基本信息
  static Future<HomeInfoResp> getHomeInfo() {
    return _apiService.post(
      ApiPath.getHomeInfo,
      body: HomeInfoReq().toJson(),
      convert: (json) => HomeInfoResp.fromJson(json),
    );
  }

  /// 获取借款信息
  static Future<LoanPreInfoResp> getLoanPreInfo({
    int? productId,
    double? amount,
  }) {
    return _apiService.post(
      ApiPath.getLoanPreInfo,
      body: LoanPreInfoReq(
        foreyardOProductId: productId,
        retiaryOLoanAmount: amount,
      ).toJson(),
      convert: (json) => LoanPreInfoResp.fromJson(json),
    );
  }

  /// 借款
  static Future<LoanConfirmResp> confirmLoan(LoanConfirmReq data) {
    return _apiService.post(
      ApiPath.confirmLoan,
      body: data.toJson(),
      convert: (json) => LoanConfirmResp.fromJson(json),
    );
  }

  /// 提交意见反馈
  static Future<bool> submitFeedback({String? content, required String type}) {
    return _apiService.postSt(
      ApiPath.submitFeedback,
      body: FeedbackReq(content: content, type: type, source: 'home').toJson(),
    );
  }

  /// 获取前端配置
  static Future<MainInfoResp> getMainBaseInfo() {
    return _apiService.post(
      ApiPath.getMainBaseInfo,
      body: MainInfoReq().toJson(),
      convert: (json) => MainInfoResp.fromJson(json),
    );
  }

  /// 获取账单列表
  static Future<BillListResp> getBillListInfo() {
    return _apiService.post(
      ApiPath.queryBillList,
      body: BillListReq().toJson(),
      convert: (json) => BillListResp.fromJson(json),
    );
  }

  /// 获取详情数据
  static Future<BillDetailResp> getBillDetailInfo({int? loanGid}) {
    return _apiService.post(
      ApiPath.getBillDetail,
      body: BillDetailReq(r5a4x8OLoanGid: loanGid.toString()).toJson(),
      convert: (json) => BillDetailResp.fromJson(json),
    );
  }
}
