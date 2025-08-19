// ignore_for_file: type=lint

import 'dart:async';

import 'package:chopper/chopper.dart' as chopper;
import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;

import 'client_mapping.dart';
import 'swaggerApi.models.swagger.dart';

export 'swaggerApi.models.swagger.dart';

part 'swaggerApi.swagger.chopper.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class SwaggerApi extends ChopperService {
  static SwaggerApi create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    List<Interceptor>? interceptors,
  }) {
    if (client != null) {
      return _$SwaggerApi(client);
    }

    final newClient = ChopperClient(
      services: [_$SwaggerApi()],
      converter: converter ?? $JsonSerializableConverter(),
      interceptors: interceptors ?? [],
      client: httpClient,
      authenticator: authenticator,
      errorConverter: errorConverter,
      baseUrl: baseUrl ?? Uri.parse('http:///'),
    );
    return _$SwaggerApi(newClient);
  }

  ///全局报文格式说明
  ///@param Accept-Language Accept-Language (Only:es)
  ///@param ys6955 ys6955 (Only:undefined)
  ///@param kw0980 kw0980 (Only:undefined)
  ///@param tp5366 tp5366 (Only:undefined)
  ///@param wr3384 wr3384 (Only:undefined)
  ///@param zg3739 zg3739 (Only:undefined)
  ///@param jv9290 jv9290 (Only:undefined)
  ///@param ie3728 ie3728 (Only:undefined)
  ///@param hk4661 hk4661 (Only:undefined)
  Future<chopper.Response<HeadResp>> head({
    String? acceptLanguage,
    String? ys6955,
    String? kw0980,
    String? tp5366,
    String? wr3384,
    String? zg3739,
    String? jv9290,
    String? ie3728,
    String? hk4661,
  }) {
    generatedMapping.putIfAbsent(HeadResp, () => HeadResp.fromJsonFactory);

    return _head(
      acceptLanguage: acceptLanguage?.toString(),
      ys6955: ys6955?.toString(),
      kw0980: kw0980?.toString(),
      tp5366: tp5366?.toString(),
      wr3384: wr3384?.toString(),
      zg3739: zg3739?.toString(),
      jv9290: jv9290?.toString(),
      ie3728: ie3728?.toString(),
      hk4661: hk4661?.toString(),
    );
  }

  ///全局报文格式说明
  ///@param Accept-Language Accept-Language (Only:es)
  ///@param ys6955 ys6955 (Only:undefined)
  ///@param kw0980 kw0980 (Only:undefined)
  ///@param tp5366 tp5366 (Only:undefined)
  ///@param wr3384 wr3384 (Only:undefined)
  ///@param zg3739 zg3739 (Only:undefined)
  ///@param jv9290 jv9290 (Only:undefined)
  ///@param ie3728 ie3728 (Only:undefined)
  ///@param hk4661 hk4661 (Only:undefined)
  @HEAD(path: '/')
  Future<chopper.Response<HeadResp>> _head({
    @Header('Accept-Language') String? acceptLanguage,
    @Header('ys6955') String? ys6955,
    @Header('kw0980') String? kw0980,
    @Header('tp5366') String? tp5366,
    @Header('wr3384') String? wr3384,
    @Header('zg3739') String? zg3739,
    @Header('jv9290') String? jv9290,
    @Header('ie3728') String? ie3728,
    @Header('hk4661') String? hk4661,
  });

  ///删除银行卡
  ///@param root BankCardDeleteReqVO :BankCardDeleteReqVO
  Future<chopper.Response<BankDeleteResp>> deleteBankCard({
    BankDeleteReq? root,
  }) {
    generatedMapping.putIfAbsent(
      BankDeleteResp,
      () => BankDeleteResp.fromJsonFactory,
    );

    return _deleteBankCard(root: root);
  }

  ///删除银行卡
  ///@param root BankCardDeleteReqVO :BankCardDeleteReqVO
  @POST(path: '/q8ply/e678/f6l')
  Future<chopper.Response<BankDeleteResp>> _deleteBankCard({
    @Body() BankDeleteReq? root,
  });

  ///我的频道-银行卡列表显示有效与无效的卡
  ///@param root BindTypeBankCardListReqVo :BindTypeBankCardListReqVo
  Future<chopper.Response<List<dynamic>>> queryMyBankCardList({
    MyBankCardReq? root,
  }) {
    return _queryMyBankCardList(root: root);
  }

  ///我的频道-银行卡列表显示有效与无效的卡
  ///@param root BindTypeBankCardListReqVo :BindTypeBankCardListReqVo
  @POST(path: '/i94oi')
  Future<chopper.Response<List<dynamic>>> _queryMyBankCardList({
    @Body() MyBankCardReq? root,
  });

  ///查询支持的银行列表
  ///@param root BankListReqDTO :BankListReqDTO
  Future<chopper.Response<List<dynamic>>> queryBankList({BankVOReq? root}) {
    return _queryBankList(root: root);
  }

  ///查询支持的银行列表
  ///@param root BankListReqDTO :BankListReqDTO
  @POST(path: '/yqaiw/thymol/o70tl')
  Future<chopper.Response<List<dynamic>>> _queryBankList({
    @Body() BankVOReq? root,
  });

  ///根据卡bin查询银行
  ///@param root BankCardBinReqVO :BankCardBinReqVO
  Future<chopper.Response<BankBinResp>> getBankCardBin({BankBinReq? root}) {
    generatedMapping.putIfAbsent(
      BankBinResp,
      () => BankBinResp.fromJsonFactory,
    );

    return _getBankCardBin(root: root);
  }

  ///根据卡bin查询银行
  ///@param root BankCardBinReqVO :BankCardBinReqVO
  @POST(path: '/bank/cardbin/check')
  Future<chopper.Response<BankBinResp>> _getBankCardBin({
    @Body() BankBinReq? root,
  });

  ///绑卡结果查询
  ///@param root BindResultReqVO :BindResultReqVO
  Future<chopper.Response<BindResultResp>> getBankBindResult({
    BindResultReq? root,
  }) {
    generatedMapping.putIfAbsent(
      BindResultResp,
      () => BindResultResp.fromJsonFactory,
    );

    return _getBankBindResult(root: root);
  }

  ///绑卡结果查询
  ///@param root BindResultReqVO :BindResultReqVO
  @POST(path: '/t20r/m739/result')
  Future<chopper.Response<BindResultResp>> _getBankBindResult({
    @Body() BindResultReq? root,
  });

  ///绑定银行卡
  ///@param root BindBankCardReqVO :BindBankCardReqVO
  Future<chopper.Response<BindCardResp>> bindBankCard({BindCardReq? root}) {
    generatedMapping.putIfAbsent(
      BindCardResp,
      () => BindCardResp.fromJsonFactory,
    );

    return _bindBankCard(root: root);
  }

  ///绑定银行卡
  ///@param root BindBankCardReqVO :BindBankCardReqVO
  @POST(path: '/t20r/m739')
  Future<chopper.Response<BindCardResp>> _bindBankCard({
    @Body() BindCardReq? root,
  });

  ///银行账户列表
  ///@param root BankCardListReqVO :BankCardListReqVO
  Future<chopper.Response<List<dynamic>>> queryBankCardList({
    BankCardReq? root,
  }) {
    return _queryBankCardList(root: root);
  }

  ///银行账户列表
  ///@param root BankCardListReqVO :BankCardListReqVO
  @POST(path: '/walkdown/awe/caisson')
  Future<chopper.Response<List<dynamic>>> _queryBankCardList({
    @Body() BankCardReq? root,
  });

  ///交易密码校验
  ///@param root TraderPasswordCheckReqVO :TraderPasswordCheckReqVO
  Future<chopper.Response> checkTraderPassword({TraderPwdCheckReq? root}) {
    return _checkTraderPassword(root: root);
  }

  ///交易密码校验
  ///@param root TraderPasswordCheckReqVO :TraderPasswordCheckReqVO
  @POST(path: '/unpaired/k4u5f')
  Future<chopper.Response> _checkTraderPassword({
    @Body() TraderPwdCheckReq? root,
  });

  ///判断是否可注销（APP）
  ///@param root AccountCancelJudgeReqDTO :AccountCancelJudgeReqDTO
  Future<chopper.Response<AccountCancelJudgeResp>> judgeAccountCancel({
    AccountCancelJudgeReq? root,
  }) {
    generatedMapping.putIfAbsent(
      AccountCancelJudgeResp,
      () => AccountCancelJudgeResp.fromJsonFactory,
    );

    return _judgeAccountCancel(root: root);
  }

  ///判断是否可注销（APP）
  ///@param root AccountCancelJudgeReqDTO :AccountCancelJudgeReqDTO
  @POST(path: '/fattish/k9a6')
  Future<chopper.Response<AccountCancelJudgeResp>> _judgeAccountCancel({
    @Body() AccountCancelJudgeReq? root,
  });

  ///是否已经注册
  ///@param root CheckMobileRegisterVO :CheckMobileRegisterVO
  Future<chopper.Response<IsRegisterResp>> isRegister({IsRegisterReq? root}) {
    generatedMapping.putIfAbsent(
      IsRegisterResp,
      () => IsRegisterResp.fromJsonFactory,
    );

    return _isRegister(root: root);
  }

  ///是否已经注册
  ///@param root CheckMobileRegisterVO :CheckMobileRegisterVO
  @POST(path: '/pl5')
  Future<chopper.Response<IsRegisterResp>> _isRegister({
    @Body() IsRegisterReq? root,
  });

  ///是否白名单
  ///@param root WhiteListReqVO :WhiteListReqVO
  Future<chopper.Response> isWhiteList({IsWhiteListReq? root}) {
    return _isWhiteList(root: root);
  }

  ///是否白名单
  ///@param root WhiteListReqVO :WhiteListReqVO
  @POST(path: '/h2fx/i8qv')
  Future<chopper.Response> _isWhiteList({@Body() IsWhiteListReq? root});

  ///是否需要图片校验
  ///@param root
  Future<chopper.Response<NeedCaptchaResp>> needCheckCaptcha({
    NeedCaptchaReq? root,
  }) {
    generatedMapping.putIfAbsent(
      NeedCaptchaResp,
      () => NeedCaptchaResp.fromJsonFactory,
    );

    return _needCheckCaptcha(root: root);
  }

  ///是否需要图片校验
  ///@param root
  @POST(path: '/t1o0w/utk')
  Future<chopper.Response<NeedCaptchaResp>> _needCheckCaptcha({
    @Body() NeedCaptchaReq? root,
  });

  ///注册
  ///@param root RegisterReqVO :RegisterReqVO
  Future<chopper.Response<RegisterResp>> registerUser({RegisterReq? root}) {
    generatedMapping.putIfAbsent(
      RegisterResp,
      () => RegisterResp.fromJsonFactory,
    );

    return _registerUser(root: root);
  }

  ///注册
  ///@param root RegisterReqVO :RegisterReqVO
  @POST(path: '/jt32/x1eg/i91')
  Future<chopper.Response<RegisterResp>> _registerUser({
    @Body() RegisterReq? root,
  });

  ///用户基本信息查询
  ///@param root UserBaseInfoReqVO :UserBaseInfoReqVO
  Future<chopper.Response<UserInfoResp>> getUserBaseInfo({UserInfoReq? root}) {
    generatedMapping.putIfAbsent(
      UserInfoResp,
      () => UserInfoResp.fromJsonFactory,
    );

    return _getUserBaseInfo(root: root);
  }

  ///用户基本信息查询
  ///@param root UserBaseInfoReqVO :UserBaseInfoReqVO
  @POST(path: '/c46qr')
  Future<chopper.Response<UserInfoResp>> _getUserBaseInfo({
    @Body() UserInfoReq? root,
  });

  ///登录
  ///@param root LoginReqVO :LoginReqVO
  Future<chopper.Response<LoginResp>> loginUser({LoginReq? root}) {
    generatedMapping.putIfAbsent(LoginResp, () => LoginResp.fromJsonFactory);

    return _loginUser(root: root);
  }

  ///登录
  ///@param root LoginReqVO :LoginReqVO
  @POST(path: '/aitch/q2i1/vwi0')
  Future<chopper.Response<LoginResp>> _loginUser({@Body() LoginReq? root});

  ///获取图形验证码
  ///@param ac0as4(o_mobileSn) (String)
  ///@param mobileSn_
  Future<chopper.Response> getCaptchaCode({
    required String? ac0as4OMobileSn,
    required String? mobileSn,
  }) {
    return _getCaptchaCode(
      ac0as4OMobileSn: ac0as4OMobileSn,
      mobileSn: mobileSn,
    );
  }

  ///获取图形验证码
  ///@param ac0as4(o_mobileSn) (String)
  ///@param mobileSn_
  @GET(path: '/s3r/{mobileSn_}')
  Future<chopper.Response> _getCaptchaCode({
    @Path('ac0as4(o_mobileSn)') required String? ac0as4OMobileSn,
    @Path('mobileSn_') required String? mobileSn,
  });

  ///账户注销(APP)
  ///@param root AccountCancelAppReqDTO :AccountCancelAppReqDTO
  Future<chopper.Response<AccountCancelAppResp>> accountCancelApp({
    AccountCancelAppReq? root,
  }) {
    generatedMapping.putIfAbsent(
      AccountCancelAppResp,
      () => AccountCancelAppResp.fromJsonFactory,
    );

    return _accountCancelApp(root: root);
  }

  ///账户注销(APP)
  ///@param root AccountCancelAppReqDTO :AccountCancelAppReqDTO
  @POST(path: '/w6y/jacky/hh7g')
  Future<chopper.Response<AccountCancelAppResp>> _accountCancelApp({
    @Body() AccountCancelAppReq? root,
  });

  ///账户注销(落地页)
  ///@param root AccountCancelAppReqDTO :AccountCancelAppReqDTO
  Future<chopper.Response<AccountCancelLandResp>> accountCancelLand({
    AccountCancelLandReq? root,
  }) {
    generatedMapping.putIfAbsent(
      AccountCancelLandResp,
      () => AccountCancelLandResp.fromJsonFactory,
    );

    return _accountCancelLand(root: root);
  }

  ///账户注销(落地页)
  ///@param root AccountCancelAppReqDTO :AccountCancelAppReqDTO
  @POST(path: '/murky/cta66')
  Future<chopper.Response<AccountCancelLandResp>> _accountCancelLand({
    @Body() AccountCancelLandReq? root,
  });

  ///重置交易密码
  ///@param root ResetTraderPasswordReqVO :ResetTraderPasswordReqVO
  Future<chopper.Response<TraderPwdResetResp>> resetTraderPassword({
    TraderPwdResetReq? root,
  }) {
    generatedMapping.putIfAbsent(
      TraderPwdResetResp,
      () => TraderPwdResetResp.fromJsonFactory,
    );

    return _resetTraderPassword(root: root);
  }

  ///重置交易密码
  ///@param root ResetTraderPasswordReqVO :ResetTraderPasswordReqVO
  @POST(path: '/htves/opossum')
  Future<chopper.Response<TraderPwdResetResp>> _resetTraderPassword({
    @Body() TraderPwdResetReq? root,
  });

  ///重置登录密码
  ///@param root ResetLoginPasswordReqVO :ResetLoginPasswordReqVO
  Future<chopper.Response<LoginPwdResetResp>> resetLoginPassword({
    LoginPwdResetReq? root,
  }) {
    generatedMapping.putIfAbsent(
      LoginPwdResetResp,
      () => LoginPwdResetResp.fromJsonFactory,
    );

    return _resetLoginPassword(root: root);
  }

  ///重置登录密码
  ///@param root ResetLoginPasswordReqVO :ResetLoginPasswordReqVO
  @POST(path: '/aitch/q2i1/vwi0/password/reset')
  Future<chopper.Response<LoginPwdResetResp>> _resetLoginPassword({
    @Body() LoginPwdResetReq? root,
  });

  ///客户端上报日志分析（通用）
  Future<chopper.Response> uploadLog() {
    return _uploadLog();
  }

  ///客户端上报日志分析（通用）
  @POST(path: '/tools/android/log', optionalBody: true)
  Future<chopper.Response> _uploadLog();

  ///图形验证码校验
  ///@param root VerifyImgCodeReqVO :VerifyImgCodeReqVO
  Future<chopper.Response<CaptchaCheckResp>> checkCaptchaCode({
    CaptchaCheckReq? root,
  }) {
    generatedMapping.putIfAbsent(
      CaptchaCheckResp,
      () => CaptchaCheckResp.fromJsonFactory,
    );

    return _checkCaptchaCode(root: root);
  }

  ///图形验证码校验
  ///@param root VerifyImgCodeReqVO :VerifyImgCodeReqVO
  @POST(path: '/mordant')
  Future<chopper.Response<CaptchaCheckResp>> _checkCaptchaCode({
    @Body() CaptchaCheckReq? root,
  });

  ///校验短信及图形验证码
  ///@param root VerifyVerificationCodeReqVO :VerifyVerificationCodeReqVO
  Future<chopper.Response<CodeVerifyResp>> checkVerificationCode({
    CodeVerifyReq? root,
  }) {
    generatedMapping.putIfAbsent(
      CodeVerifyResp,
      () => CodeVerifyResp.fromJsonFactory,
    );

    return _checkVerificationCode(root: root);
  }

  ///校验短信及图形验证码
  ///@param root VerifyVerificationCodeReqVO :VerifyVerificationCodeReqVO
  @POST(path: '/s23')
  Future<chopper.Response<CodeVerifyResp>> _checkVerificationCode({
    @Body() CodeVerifyReq? root,
  });

  ///获取验证码
  ///@param root SendVerificationCodeReqVO :SendVerificationCodeReqVO
  Future<chopper.Response<CodeSendResp>> sendVerificationCode({
    CodeSendReq? root,
  }) {
    generatedMapping.putIfAbsent(
      CodeSendResp,
      () => CodeSendResp.fromJsonFactory,
    );

    return _sendVerificationCode(root: root);
  }

  ///获取验证码
  ///@param root SendVerificationCodeReqVO :SendVerificationCodeReqVO
  @POST(path: '/umwelt')
  Future<chopper.Response<CodeSendResp>> _sendVerificationCode({
    @Body() CodeSendReq? root,
  });

  ///上报新版本（含大数据短信）
  ///@param root ReportV1ReqVO :ReportV1ReqVO
  Future<chopper.Response<TrackReportResp>> reportTrack({
    TrackReportReq? root,
  }) {
    generatedMapping.putIfAbsent(
      TrackReportResp,
      () => TrackReportResp.fromJsonFactory,
    );

    return _reportTrack(root: root);
  }

  ///上报新版本（含大数据短信）
  ///@param root ReportV1ReqVO :ReportV1ReqVO
  @POST(path: '/ignore/jv8/y27/chechia')
  Future<chopper.Response<TrackReportResp>> _reportTrack({
    @Body() TrackReportReq? root,
  });

  ///判断是否需要上报
  ///@param headers headers (Only:undefined)
  ///@param root (该参数为map)
  Future<chopper.Response<NeedReportResp>> needReport({
    String? headers,
    NeedReportReq? root,
  }) {
    generatedMapping.putIfAbsent(
      NeedReportResp,
      () => NeedReportResp.fromJsonFactory,
    );

    return _needReport(headers: headers?.toString(), root: root);
  }

  ///判断是否需要上报
  ///@param headers headers (Only:undefined)
  ///@param root (该参数为map)
  @POST(path: '/vqp6/auo6x')
  Future<chopper.Response<NeedReportResp>> _needReport({
    @Header('headers') String? headers,
    @Body() NeedReportReq? root,
  });

  ///风控上报项配置接口
  ///@param root RiskConfigReqVO :RiskConfigReqVO
  Future<chopper.Response<RiskReportResp>> reportRiskConfig({
    RiskReportReq? root,
  }) {
    generatedMapping.putIfAbsent(
      RiskReportResp,
      () => RiskReportResp.fromJsonFactory,
    );

    return _reportRiskConfig(root: root);
  }

  ///风控上报项配置接口
  ///@param root RiskConfigReqVO :RiskConfigReqVO
  @POST(path: '/jxd')
  Future<chopper.Response<RiskReportResp>> _reportRiskConfig({
    @Body() RiskReportReq? root,
  });

  ///创建线下还款虚拟账户
  ///@param root CreateVaReqVO :CreateVaReqVO
  Future<chopper.Response<VaCreateResp>> createRepaymentVaAccount({
    VaCreateReq? root,
  }) {
    generatedMapping.putIfAbsent(
      VaCreateResp,
      () => VaCreateResp.fromJsonFactory,
    );

    return _createRepaymentVaAccount(root: root);
  }

  ///创建线下还款虚拟账户
  ///@param root CreateVaReqVO :CreateVaReqVO
  @POST(path: '/nda')
  Future<chopper.Response<VaCreateResp>> _createRepaymentVaAccount({
    @Body() VaCreateReq? root,
  });

  ///提交线下还款虚拟账户交易凭证
  ///@param root VaRepaymentReferenceReqVo :VaRepaymentReferenceReqVo
  Future<chopper.Response<VoSubmitResp>> submitRepaymentVoucher({
    VoSubmitReq? root,
  }) {
    generatedMapping.putIfAbsent(
      VoSubmitResp,
      () => VoSubmitResp.fromJsonFactory,
    );

    return _submitRepaymentVoucher(root: root);
  }

  ///提交线下还款虚拟账户交易凭证
  ///@param root VaRepaymentReferenceReqVo :VaRepaymentReferenceReqVo
  @POST(path: '/hlf/i74')
  Future<chopper.Response<VoSubmitResp>> _submitRepaymentVoucher({
    @Body() VoSubmitReq? root,
  });

  ///获取线下还款虚拟账户
  ///@param root RepaymentVaAccountReqVO :RepaymentVaAccountReqVO
  Future<chopper.Response<VaGetResp>> getRepaymentVaAccount({VaGetReq? root}) {
    generatedMapping.putIfAbsent(VaGetResp, () => VaGetResp.fromJsonFactory);

    return _getRepaymentVaAccount(root: root);
  }

  ///获取线下还款虚拟账户
  ///@param root RepaymentVaAccountReqVO :RepaymentVaAccountReqVO
  @POST(path: '/cx7e/d989/w7q')
  Future<chopper.Response<VaGetResp>> _getRepaymentVaAccount({
    @Body() VaGetReq? root,
  });

  ///还款请求
  ///@param root RepaymentApplyReqVO :RepaymentApplyReqVO
  Future<chopper.Response<RepayApplyResp>> applyRepay({RepayApplyReq? root}) {
    generatedMapping.putIfAbsent(
      RepayApplyResp,
      () => RepayApplyResp.fromJsonFactory,
    );

    return _applyRepay(root: root);
  }

  ///还款请求
  ///@param root RepaymentApplyReqVO :RepaymentApplyReqVO
  @POST(path: '/famish')
  Future<chopper.Response<RepayApplyResp>> _applyRepay({
    @Body() RepayApplyReq? root,
  });

  ///银行直连还款申请列表
  ///@param root RepaymentApplyListDTO :RepaymentApplyListDTO
  Future<chopper.Response<List<dynamic>>> queryRepaymentRecord({
    RepayRecordReq? root,
  }) {
    return _queryRepaymentRecord(root: root);
  }

  ///银行直连还款申请列表
  ///@param root RepaymentApplyListDTO :RepaymentApplyListDTO
  @POST(path: '/z5af/jbeo2')
  Future<chopper.Response<List<dynamic>>> _queryRepaymentRecord({
    @Body() RepayRecordReq? root,
  });

  ///判断是否是gp审核用户
  Future<chopper.Response> isReviewAccount() {
    return _isReviewAccount();
  }

  ///判断是否是gp审核用户
  @GET(path: '/vo71/vt52o/dx8')
  Future<chopper.Response> _isReviewAccount();

  ///获取前端配置
  ///@param root MainBaseInfoReqVO :MainBaseInfoReqVO
  Future<chopper.Response<Object>> getMainBaseInfo({MainInfoReq? root}) {
    return _getMainBaseInfo(root: root);
  }

  ///获取前端配置
  ///@param root MainBaseInfoReqVO :MainBaseInfoReqVO
  @POST(path: '/uhn/pm969')
  Future<chopper.Response<Object>> _getMainBaseInfo({
    @Body() MainInfoReq? root,
  });

  ///公告查询
  ///@param root NoticeMainListReqVo :NoticeMainListReqVo
  Future<chopper.Response<Object>> getNoticeMain({NoticeMainReq? root}) {
    return _getNoticeMain(root: root);
  }

  ///公告查询
  ///@param root NoticeMainListReqVo :NoticeMainListReqVo
  @POST(path: '/x50h/hv0')
  Future<chopper.Response<Object>> _getNoticeMain({
    @Body() NoticeMainReq? root,
  });

  ///zwl1/p1vs7
  ///@param root CheckVersionVO :CheckVersionVO
  Future<chopper.Response<VersionCheckResp>> checkAppVersion({
    VersionCheckReq? root,
  }) {
    generatedMapping.putIfAbsent(
      VersionCheckResp,
      () => VersionCheckResp.fromJsonFactory,
    );

    return _checkAppVersion(root: root);
  }

  ////zwl1/p1vs7
  ///@param root CheckVersionVO :CheckVersionVO
  @POST(path: '/zwl1/p1vs7')
  Future<chopper.Response<VersionCheckResp>> _checkAppVersion({
    @Body() VersionCheckReq? root,
  });

  ///获取共贷产品信息
  ///@param root CoLoanGpAppListReqVO :CoLoanGpAppListReqVO
  Future<chopper.Response<ColoanGpResp>> getCoLoanGpAppList({
    ColoanGpReq? root,
  }) {
    generatedMapping.putIfAbsent(
      ColoanGpResp,
      () => ColoanGpResp.fromJsonFactory,
    );

    return _getCoLoanGpAppList(root: root);
  }

  ///获取共贷产品信息
  ///@param root CoLoanGpAppListReqVO :CoLoanGpAppListReqVO
  @POST(path: '/t71/s7a24')
  Future<chopper.Response<ColoanGpResp>> _getCoLoanGpAppList({
    @Body() ColoanGpReq? root,
  });

  ///获取首页基本信息
  ///@param root MainBaseInfoReqVO :MainBaseInfoReqVO
  Future<chopper.Response<HomeInfoResp>> getHomeInfo({HomeInfoReq? root}) {
    generatedMapping.putIfAbsent(
      HomeInfoResp,
      () => HomeInfoResp.fromJsonFactory,
    );

    return _getHomeInfo(root: root);
  }

  ///获取首页基本信息
  ///@param root MainBaseInfoReqVO :MainBaseInfoReqVO
  @POST(path: '/e8un6/oe942')
  Future<chopper.Response<HomeInfoResp>> _getHomeInfo({
    @Body() HomeInfoReq? root,
  });

  ///借款
  ///@param root LoanConfirmReqVO :LoanConfirmReqVO
  Future<chopper.Response<LoanConfirmResp>> confirmLoan({
    LoanConfirmReq? root,
  }) {
    generatedMapping.putIfAbsent(
      LoanConfirmResp,
      () => LoanConfirmResp.fromJsonFactory,
    );

    return _confirmLoan(root: root);
  }

  ///借款
  ///@param root LoanConfirmReqVO :LoanConfirmReqVO
  @POST(path: '/oxz3/msva/x43li')
  Future<chopper.Response<LoanConfirmResp>> _confirmLoan({
    @Body() LoanConfirmReq? root,
  });

  ///图片上传(H5)
  ///@param root PicSubmitReqDTO :PicSubmitReqDTO
  Future<chopper.Response<PicUploadReqResp>> uploadPicture({
    PicUploadReqReq? root,
  }) {
    generatedMapping.putIfAbsent(
      PicUploadReqResp,
      () => PicUploadReqResp.fromJsonFactory,
    );

    return _uploadPicture(root: root);
  }

  ///图片上传(H5)
  ///@param root PicSubmitReqDTO :PicSubmitReqDTO
  @POST(path: '/rushlike')
  Future<chopper.Response<PicUploadReqResp>> _uploadPicture({
    @Body() PicUploadReqReq? root,
  });

  ///收集催收时间
  ///@param root LoanCollectTimeReqVO :LoanCollectTimeReqVO
  Future<chopper.Response<CollTimeResp>> getLoanCollectTime({
    CollTimeReq? root,
  }) {
    generatedMapping.putIfAbsent(
      CollTimeResp,
      () => CollTimeResp.fromJsonFactory,
    );

    return _getLoanCollectTime(root: root);
  }

  ///收集催收时间
  ///@param root LoanCollectTimeReqVO :LoanCollectTimeReqVO
  @POST(path: '/o1f/kur/yx41h')
  Future<chopper.Response<CollTimeResp>> _getLoanCollectTime({
    @Body() CollTimeReq? root,
  });

  ///是否首次借款
  ///@param root LoanIsFirstReqVO :LoanIsFirstReqVO
  Future<chopper.Response<IsFirstLoanResp>> isFirstLoan({
    IsFirstLoanReq? root,
  }) {
    generatedMapping.putIfAbsent(
      IsFirstLoanResp,
      () => IsFirstLoanResp.fromJsonFactory,
    );

    return _isFirstLoan(root: root);
  }

  ///是否首次借款
  ///@param root LoanIsFirstReqVO :LoanIsFirstReqVO
  @POST(path: '/v6ch/anzac')
  Future<chopper.Response<IsFirstLoanResp>> _isFirstLoan({
    @Body() IsFirstLoanReq? root,
  });

  ///根据orderGid查询订单
  ///@param root LoanQueryReqVO :LoanQueryReqVO
  Future<chopper.Response<LoanOrderResp>> getLoanOrder({LoanOrderReq? root}) {
    generatedMapping.putIfAbsent(
      LoanOrderResp,
      () => LoanOrderResp.fromJsonFactory,
    );

    return _getLoanOrder(root: root);
  }

  ///根据orderGid查询订单
  ///@param root LoanQueryReqVO :LoanQueryReqVO
  @POST(path: '/qq3qd/i7nh')
  Future<chopper.Response<LoanOrderResp>> _getLoanOrder({
    @Body() LoanOrderReq? root,
  });

  ///获取借款信息
  ///@param root LoanPreInfoReqVO :LoanPreInfoReqVO
  Future<chopper.Response<LoanPreInfoResp>> getLoanPreInfo({
    LoanPreInfoReq? root,
  }) {
    generatedMapping.putIfAbsent(
      LoanPreInfoResp,
      () => LoanPreInfoResp.fromJsonFactory,
    );

    return _getLoanPreInfo(root: root);
  }

  ///获取借款信息
  ///@param root LoanPreInfoReqVO :LoanPreInfoReqVO
  @POST(path: '/getter/d6637/zj0')
  Future<chopper.Response<LoanPreInfoResp>> _getLoanPreInfo({
    @Body() LoanPreInfoReq? root,
  });

  ///获取借款费用配置明细
  ///@param root CoLoanGpAppListReqVO :CoLoanGpAppListReqVO
  Future<chopper.Response<LoanFeeDetailResp>> getLoanFeeDetail({
    LoanFeeDetailReq? root,
  }) {
    generatedMapping.putIfAbsent(
      LoanFeeDetailResp,
      () => LoanFeeDetailResp.fromJsonFactory,
    );

    return _getLoanFeeDetail(root: root);
  }

  ///获取借款费用配置明细
  ///@param root CoLoanGpAppListReqVO :CoLoanGpAppListReqVO
  @POST(path: '/reviewal/z8g14/t64c7')
  Future<chopper.Response<LoanFeeDetailResp>> _getLoanFeeDetail({
    @Body() LoanFeeDetailReq? root,
  });

  ///获取有效的bank信息
  ///@param root BankValidInfoReqVO :BankValidInfoReqVO
  Future<chopper.Response<BankValidInfoResp>> getBankValidInfo({
    BankValidInfoReq? root,
  }) {
    generatedMapping.putIfAbsent(
      BankValidInfoResp,
      () => BankValidInfoResp.fromJsonFactory,
    );

    return _getBankValidInfo(root: root);
  }

  ///获取有效的bank信息
  ///@param root BankValidInfoReqVO :BankValidInfoReqVO
  @POST(path: '/rhoi')
  Future<chopper.Response<BankValidInfoResp>> _getBankValidInfo({
    @Body() BankValidInfoReq? root,
  });

  ///中途放弃原因
  ///@param root AbandonReasonReqVO :AbandonReasonReqVO
  Future<chopper.Response<AbandonReasonResp>> submitAbandonReason({
    AbandonReasonReq? root,
  }) {
    generatedMapping.putIfAbsent(
      AbandonReasonResp,
      () => AbandonReasonResp.fromJsonFactory,
    );

    return _submitAbandonReason(root: root);
  }

  ///中途放弃原因
  ///@param root AbandonReasonReqVO :AbandonReasonReqVO
  @POST(path: '/n89/wc2/e7z1')
  Future<chopper.Response<AbandonReasonResp>> _submitAbandonReason({
    @Body() AbandonReasonReq? root,
  });

  ///提交意见反馈
  ///@param root AddFeedbackReqVO :AddFeedbackReqVO
  Future<chopper.Response<FeedbackResp>> submitFeedback({FeedbackReq? root}) {
    generatedMapping.putIfAbsent(
      FeedbackResp,
      () => FeedbackResp.fromJsonFactory,
    );

    return _submitFeedback(root: root);
  }

  ///提交意见反馈
  ///@param root AddFeedbackReqVO :AddFeedbackReqVO
  @POST(path: '/w8qp7/mqo57')
  Future<chopper.Response<FeedbackResp>> _submitFeedback({
    @Body() FeedbackReq? root,
  });

  ///是否需要上报放弃原因
  ///@param root AbandonReasonReqVO :AbandonReasonReqVO
  Future<chopper.Response<NeedAbandonReasonResp>> needAbandonReason({
    NeedAbandonReasonReq? root,
  }) {
    generatedMapping.putIfAbsent(
      NeedAbandonReasonResp,
      () => NeedAbandonReasonResp.fromJsonFactory,
    );

    return _needAbandonReason(root: root);
  }

  ///是否需要上报放弃原因
  ///@param root AbandonReasonReqVO :AbandonReasonReqVO
  @POST(path: '/y888/fjah')
  Future<chopper.Response<NeedAbandonReasonResp>> _needAbandonReason({
    @Body() NeedAbandonReasonReq? root,
  });

  ///获取借款提示
  ///@param root LoanNoticeReqVo :LoanNoticeReqVo
  Future<chopper.Response<LoanNoticeResp>> getLoanNotice({
    LoanNoticeReq? root,
  }) {
    generatedMapping.putIfAbsent(
      LoanNoticeResp,
      () => LoanNoticeResp.fromJsonFactory,
    );

    return _getLoanNotice(root: root);
  }

  ///获取借款提示
  ///@param root LoanNoticeReqVo :LoanNoticeReqVo
  @POST(path: '/c90e/ejvju/impulse')
  Future<chopper.Response<LoanNoticeResp>> _getLoanNotice({
    @Body() LoanNoticeReq? root,
  });

  ///刷新授信结果
  ///@param root CheckCreditVO :CheckCreditVO
  Future<chopper.Response<CheckCreditResp>> refreshCredit({
    CheckCreditReq? root,
  }) {
    generatedMapping.putIfAbsent(
      CheckCreditResp,
      () => CheckCreditResp.fromJsonFactory,
    );

    return _refreshCredit(root: root);
  }

  ///刷新授信结果
  ///@param root CheckCreditVO :CheckCreditVO
  @POST(path: '/p2f1')
  Future<chopper.Response<CheckCreditResp>> _refreshCredit({
    @Body() CheckCreditReq? root,
  });

  ///授信-身份认证页 活体数据上传
  ///@param root LivingDataReqDTO :LivingDataReqDTO
  Future<chopper.Response<LivingDataResp>> uploadLivingData({
    LivingDataReq? root,
  }) {
    generatedMapping.putIfAbsent(
      LivingDataResp,
      () => LivingDataResp.fromJsonFactory,
    );

    return _uploadLivingData(root: root);
  }

  ///授信-身份认证页 活体数据上传
  ///@param root LivingDataReqDTO :LivingDataReqDTO
  @POST(path: '/zeb/angelus')
  Future<chopper.Response<LivingDataResp>> _uploadLivingData({
    @Body() LivingDataReq? root,
  });

  ///提交授信影像(H5)
  ///@param root PhotoSubmitReqDTO :PhotoSubmitReqDTO
  Future<chopper.Response<PhotoSubmitResp>> submitPhoto({
    PhotoSubmitReq? root,
  }) {
    generatedMapping.putIfAbsent(
      PhotoSubmitResp,
      () => PhotoSubmitResp.fromJsonFactory,
    );

    return _submitPhoto(root: root);
  }

  ///提交授信影像(H5)
  ///@param root PhotoSubmitReqDTO :PhotoSubmitReqDTO
  @POST(path: '/b72/obgr')
  Future<chopper.Response<PhotoSubmitResp>> _submitPhoto({
    @Body() PhotoSubmitReq? root,
  });

  ///提交授信数据
  ///@param root RecordCreditDataReqVO :RecordCreditDataReqVO
  Future<chopper.Response<CreditRecordResp>> submitCreditData({
    CreditRecordReq? root,
  }) {
    generatedMapping.putIfAbsent(
      CreditRecordResp,
      () => CreditRecordResp.fromJsonFactory,
    );

    return _submitCreditData(root: root);
  }

  ///提交授信数据
  ///@param root RecordCreditDataReqVO :RecordCreditDataReqVO
  @POST(path: '/sluit/v7n/f4u39')
  Future<chopper.Response<CreditRecordResp>> _submitCreditData({
    @Body() CreditRecordReq? root,
  });

  ///邮箱、身份证号校验
  ///@param root CreditEmailValidReqVO :CreditEmailValidReqVO
  Future<chopper.Response<EmailCheckResp>> checkEmailValid({
    EmailCheckReq? root,
  }) {
    generatedMapping.putIfAbsent(
      EmailCheckResp,
      () => EmailCheckResp.fromJsonFactory,
    );

    return _checkEmailValid(root: root);
  }

  ///邮箱、身份证号校验
  ///@param root CreditEmailValidReqVO :CreditEmailValidReqVO
  @POST(path: '/mjfe')
  Future<chopper.Response<EmailCheckResp>> _checkEmailValid({
    @Body() EmailCheckReq? root,
  });

  ///app首页优惠券列表展示
  ///@param root CouponHomePopReqVO :CouponHomePopReqVO
  Future<chopper.Response<HomeCouponResp>> queryHomeCouponList({
    HomeCouponReq? root,
  }) {
    generatedMapping.putIfAbsent(
      HomeCouponResp,
      () => HomeCouponResp.fromJsonFactory,
    );

    return _queryHomeCouponList(root: root);
  }

  ///app首页优惠券列表展示
  ///@param root CouponHomePopReqVO :CouponHomePopReqVO
  @POST(path: '/vallate/b0743/sl1')
  Future<chopper.Response<HomeCouponResp>> _queryHomeCouponList({
    @Body() HomeCouponReq? root,
  });

  ///借款 - 优惠券列表
  ///@param root LoanCouponReqVO :LoanCouponReqVO
  Future<chopper.Response<LoanCouponResp>> queryLoanCouponList({
    LoanCouponReq? root,
  }) {
    generatedMapping.putIfAbsent(
      LoanCouponResp,
      () => LoanCouponResp.fromJsonFactory,
    );

    return _queryLoanCouponList(root: root);
  }

  ///借款 - 优惠券列表
  ///@param root LoanCouponReqVO :LoanCouponReqVO
  @POST(path: '/i93hw')
  Future<chopper.Response<LoanCouponResp>> _queryLoanCouponList({
    @Body() LoanCouponReq? root,
  });

  ///我的 - 优惠券列表
  ///@param root CouponListReqVO :CouponListReqVO
  Future<chopper.Response<MyCouponResp>> queryMyCouponList({
    MyCouponReq? root,
  }) {
    generatedMapping.putIfAbsent(
      MyCouponResp,
      () => MyCouponResp.fromJsonFactory,
    );

    return _queryMyCouponList(root: root);
  }

  ///我的 - 优惠券列表
  ///@param root CouponListReqVO :CouponListReqVO
  @POST(path: '/ht3x')
  Future<chopper.Response<MyCouponResp>> _queryMyCouponList({
    @Body() MyCouponReq? root,
  });

  ///落地页一键领取优惠券
  ///@param root CouponLandUrlReqVO :CouponLandUrlReqVO
  Future<chopper.Response<CouponGetResp>> receiveCoupon({CouponGetReq? root}) {
    generatedMapping.putIfAbsent(
      CouponGetResp,
      () => CouponGetResp.fromJsonFactory,
    );

    return _receiveCoupon(root: root);
  }

  ///落地页一键领取优惠券
  ///@param root CouponLandUrlReqVO :CouponLandUrlReqVO
  @POST(path: '/operand')
  Future<chopper.Response<CouponGetResp>> _receiveCoupon({
    @Body() CouponGetReq? root,
  });

  ///落地页优惠券列表展示
  ///@param root CouponLandUrlReqVO :CouponLandUrlReqVO
  Future<chopper.Response<LandCouponResp>> queryLandCouponList({
    LandCouponReq? root,
  }) {
    generatedMapping.putIfAbsent(
      LandCouponResp,
      () => LandCouponResp.fromJsonFactory,
    );

    return _queryLandCouponList(root: root);
  }

  ///落地页优惠券列表展示
  ///@param root CouponLandUrlReqVO :CouponLandUrlReqVO
  @POST(path: '/o03b/b3a')
  Future<chopper.Response<LandCouponResp>> _queryLandCouponList({
    @Body() LandCouponReq? root,
  });

  ///落地页弹窗是否有权限领取优惠券
  ///@param root CouponLandUrlReqVO :CouponLandUrlReqVO
  Future<chopper.Response<CouponPopResp>> couponHomePop({CouponPopReq? root}) {
    generatedMapping.putIfAbsent(
      CouponPopResp,
      () => CouponPopResp.fromJsonFactory,
    );

    return _couponHomePop(root: root);
  }

  ///落地页弹窗是否有权限领取优惠券
  ///@param root CouponLandUrlReqVO :CouponLandUrlReqVO
  @POST(path: '/w42q3')
  Future<chopper.Response<CouponPopResp>> _couponHomePop({
    @Body() CouponPopReq? root,
  });

  ///借款历史列表
  ///@param root BillLoanListReqVO :BillLoanListReqVO
  Future<chopper.Response<LoanBillResp>> queryLoanBillList({
    LoanBillReq? root,
  }) {
    generatedMapping.putIfAbsent(
      LoanBillResp,
      () => LoanBillResp.fromJsonFactory,
    );

    return _queryLoanBillList(root: root);
  }

  ///借款历史列表
  ///@param root BillLoanListReqVO :BillLoanListReqVO
  @POST(path: '/q39u2/acerbic')
  Future<chopper.Response<LoanBillResp>> _queryLoanBillList({
    @Body() LoanBillReq? root,
  });

  ///查询订单状态
  ///@param root BillDetailReqVO :BillDetailReqVO
  Future<chopper.Response<BillStatusResp>> getBillStatus({
    BillStatusReq? root,
  }) {
    generatedMapping.putIfAbsent(
      BillStatusResp,
      () => BillStatusResp.fromJsonFactory,
    );

    return _getBillStatus(root: root);
  }

  ///查询订单状态
  ///@param root BillDetailReqVO :BillDetailReqVO
  @POST(path: '/vyg/snuggery')
  Future<chopper.Response<BillStatusResp>> _getBillStatus({
    @Body() BillStatusReq? root,
  });

  ///账单列表
  ///@param root BillListReqVO :BillListReqVO
  Future<chopper.Response<BillListResp>> queryBillList({BillListReq? root}) {
    generatedMapping.putIfAbsent(
      BillListResp,
      () => BillListResp.fromJsonFactory,
    );

    return _queryBillList(root: root);
  }

  ///账单列表
  ///@param root BillListReqVO :BillListReqVO
  @POST(path: '/cq7/topmost/fu2vz')
  Future<chopper.Response<BillListResp>> _queryBillList({
    @Body() BillListReq? root,
  });

  ///账单详情
  ///@param root BillDetailReqVO :BillDetailReqVO
  Future<chopper.Response<BillDetailResp>> getBillDetail({
    BillDetailReq? root,
  }) {
    generatedMapping.putIfAbsent(
      BillDetailResp,
      () => BillDetailResp.fromJsonFactory,
    );

    return _getBillDetail(root: root);
  }

  ///账单详情
  ///@param root BillDetailReqVO :BillDetailReqVO
  @POST(path: '/y3kh7')
  Future<chopper.Response<BillDetailResp>> _getBillDetail({
    @Body() BillDetailReq? root,
  });

  ///还款历史列表
  ///@param root BillRepaymentListReqVO :BillRepaymentListReqVO
  Future<chopper.Response<BillRepayResp>> queryRepaymentList({
    BillRepayReq? root,
  }) {
    generatedMapping.putIfAbsent(
      BillRepayResp,
      () => BillRepayResp.fromJsonFactory,
    );

    return _queryRepaymentList(root: root);
  }

  ///还款历史列表
  ///@param root BillRepaymentListReqVO :BillRepaymentListReqVO
  @POST(path: '/philtrum/kbzd')
  Future<chopper.Response<BillRepayResp>> _queryRepaymentList({
    @Body() BillRepayReq? root,
  });
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
    chopper.Response response,
  ) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
        body:
            DateTime.parse((response.body as String).replaceAll('"', ''))
                as ResultType,
      );
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
      body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType,
    );
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);
