// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swaggerApi.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$SwaggerApi extends SwaggerApi {
  _$SwaggerApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = SwaggerApi;

  @override
  Future<Response<HeadResp>> _head({
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
    final Uri $url = Uri.parse('/');
    final Map<String, String> $headers = {
      if (acceptLanguage != null) 'Accept-Language': acceptLanguage,
      if (ys6955 != null) 'ys6955': ys6955,
      if (kw0980 != null) 'kw0980': kw0980,
      if (tp5366 != null) 'tp5366': tp5366,
      if (wr3384 != null) 'wr3384': wr3384,
      if (zg3739 != null) 'zg3739': zg3739,
      if (jv9290 != null) 'jv9290': jv9290,
      if (ie3728 != null) 'ie3728': ie3728,
      if (hk4661 != null) 'hk4661': hk4661,
    };
    final Request $request = Request(
      'HEAD',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<HeadResp, HeadResp>($request);
  }

  @override
  Future<Response<BankDeleteResp>> _deleteBankCard({BankDeleteReq? root}) {
    final Uri $url = Uri.parse('/q8ply/e678/f6l');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<BankDeleteResp, BankDeleteResp>($request);
  }

  @override
  Future<Response<List<dynamic>>> _queryMyBankCardList({MyBankCardReq? root}) {
    final Uri $url = Uri.parse('/i94oi');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<List<dynamic>, List<dynamic>>($request);
  }

  @override
  Future<Response<List<dynamic>>> _queryBankList({BankVOReq? root}) {
    final Uri $url = Uri.parse('/yqaiw/thymol/o70tl');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<List<dynamic>, List<dynamic>>($request);
  }

  @override
  Future<Response<BankBinResp>> _getBankCardBin({BankBinReq? root}) {
    final Uri $url = Uri.parse('/bank/cardbin/check');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<BankBinResp, BankBinResp>($request);
  }

  @override
  Future<Response<BindResultResp>> _getBankBindResult({BindResultReq? root}) {
    final Uri $url = Uri.parse('/t20r/m739/result');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<BindResultResp, BindResultResp>($request);
  }

  @override
  Future<Response<BindCardResp>> _bindBankCard({BindCardReq? root}) {
    final Uri $url = Uri.parse('/t20r/m739');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<BindCardResp, BindCardResp>($request);
  }

  @override
  Future<Response<List<dynamic>>> _queryBankCardList({BankCardReq? root}) {
    final Uri $url = Uri.parse('/walkdown/awe/caisson');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<List<dynamic>, List<dynamic>>($request);
  }

  @override
  Future<Response<dynamic>> _checkTraderPassword({TraderPwdCheckReq? root}) {
    final Uri $url = Uri.parse('/unpaired/k4u5f');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<AccountCancelJudgeResp>> _judgeAccountCancel({
    AccountCancelJudgeReq? root,
  }) {
    final Uri $url = Uri.parse('/fattish/k9a6');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<AccountCancelJudgeResp, AccountCancelJudgeResp>(
      $request,
    );
  }

  @override
  Future<Response<IsRegisterResp>> _isRegister({IsRegisterReq? root}) {
    final Uri $url = Uri.parse('/pl5');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<IsRegisterResp, IsRegisterResp>($request);
  }

  @override
  Future<Response<dynamic>> _isWhiteList({IsWhiteListReq? root}) {
    final Uri $url = Uri.parse('/h2fx/i8qv');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<NeedCaptchaResp>> _needCheckCaptcha({NeedCaptchaReq? root}) {
    final Uri $url = Uri.parse('/t1o0w/utk');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<NeedCaptchaResp, NeedCaptchaResp>($request);
  }

  @override
  Future<Response<RegisterResp>> _registerUser({RegisterReq? root}) {
    final Uri $url = Uri.parse('/jt32/x1eg/i91');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<RegisterResp, RegisterResp>($request);
  }

  @override
  Future<Response<UserInfoResp>> _getUserBaseInfo({UserInfoReq? root}) {
    final Uri $url = Uri.parse('/c46qr');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<UserInfoResp, UserInfoResp>($request);
  }

  @override
  Future<Response<LoginResp>> _loginUser({LoginReq? root}) {
    final Uri $url = Uri.parse('/aitch/q2i1/vwi0');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LoginResp, LoginResp>($request);
  }

  @override
  Future<Response<dynamic>> _getCaptchaCode({
    required String? ac0as4OMobileSn,
    required String? mobileSn,
  }) {
    final Uri $url = Uri.parse('/s3r/${mobileSn}');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<AccountCancelAppResp>> _accountCancelApp({
    AccountCancelAppReq? root,
  }) {
    final Uri $url = Uri.parse('/w6y/jacky/hh7g');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<AccountCancelAppResp, AccountCancelAppResp>($request);
  }

  @override
  Future<Response<AccountCancelLandResp>> _accountCancelLand({
    AccountCancelLandReq? root,
  }) {
    final Uri $url = Uri.parse('/murky/cta66');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<AccountCancelLandResp, AccountCancelLandResp>($request);
  }

  @override
  Future<Response<TraderPwdResetResp>> _resetTraderPassword({
    TraderPwdResetReq? root,
  }) {
    final Uri $url = Uri.parse('/htves/opossum');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<TraderPwdResetResp, TraderPwdResetResp>($request);
  }

  @override
  Future<Response<LoginPwdResetResp>> _resetLoginPassword({
    LoginPwdResetReq? root,
  }) {
    final Uri $url = Uri.parse('/aitch/q2i1/vwi0/password/reset');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LoginPwdResetResp, LoginPwdResetResp>($request);
  }

  @override
  Future<Response<dynamic>> _uploadLog() {
    final Uri $url = Uri.parse('/tools/android/log');
    final Request $request = Request('POST', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<CaptchaCheckResp>> _checkCaptchaCode({
    CaptchaCheckReq? root,
  }) {
    final Uri $url = Uri.parse('/mordant');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<CaptchaCheckResp, CaptchaCheckResp>($request);
  }

  @override
  Future<Response<CodeVerifyResp>> _checkVerificationCode({
    CodeVerifyReq? root,
  }) {
    final Uri $url = Uri.parse('/s23');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<CodeVerifyResp, CodeVerifyResp>($request);
  }

  @override
  Future<Response<CodeSendResp>> _sendVerificationCode({CodeSendReq? root}) {
    final Uri $url = Uri.parse('/umwelt');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<CodeSendResp, CodeSendResp>($request);
  }

  @override
  Future<Response<TrackReportResp>> _reportTrack({TrackReportReq? root}) {
    final Uri $url = Uri.parse('/ignore/jv8/y27/chechia');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<TrackReportResp, TrackReportResp>($request);
  }

  @override
  Future<Response<NeedReportResp>> _needReport({
    String? headers,
    NeedReportReq? root,
  }) {
    final Uri $url = Uri.parse('/vqp6/auo6x');
    final Map<String, String> $headers = {
      if (headers != null) 'headers': headers,
    };
    final $body = root;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<NeedReportResp, NeedReportResp>($request);
  }

  @override
  Future<Response<RiskReportResp>> _reportRiskConfig({RiskReportReq? root}) {
    final Uri $url = Uri.parse('/jxd');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<RiskReportResp, RiskReportResp>($request);
  }

  @override
  Future<Response<VaCreateResp>> _createRepaymentVaAccount({
    VaCreateReq? root,
  }) {
    final Uri $url = Uri.parse('/nda');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<VaCreateResp, VaCreateResp>($request);
  }

  @override
  Future<Response<VoSubmitResp>> _submitRepaymentVoucher({VoSubmitReq? root}) {
    final Uri $url = Uri.parse('/hlf/i74');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<VoSubmitResp, VoSubmitResp>($request);
  }

  @override
  Future<Response<VaGetResp>> _getRepaymentVaAccount({VaGetReq? root}) {
    final Uri $url = Uri.parse('/cx7e/d989/w7q');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<VaGetResp, VaGetResp>($request);
  }

  @override
  Future<Response<RepayApplyResp>> _applyRepay({RepayApplyReq? root}) {
    final Uri $url = Uri.parse('/famish');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<RepayApplyResp, RepayApplyResp>($request);
  }

  @override
  Future<Response<List<dynamic>>> _queryRepaymentRecord({
    RepayRecordReq? root,
  }) {
    final Uri $url = Uri.parse('/z5af/jbeo2');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<List<dynamic>, List<dynamic>>($request);
  }

  @override
  Future<Response<dynamic>> _isReviewAccount() {
    final Uri $url = Uri.parse('/vo71/vt52o/dx8');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<Object>> _getMainBaseInfo({MainInfoReq? root}) {
    final Uri $url = Uri.parse('/uhn/pm969');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Object, Object>($request);
  }

  @override
  Future<Response<Object>> _getNoticeMain({NoticeMainReq? root}) {
    final Uri $url = Uri.parse('/x50h/hv0');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Object, Object>($request);
  }

  @override
  Future<Response<VersionCheckResp>> _checkAppVersion({VersionCheckReq? root}) {
    final Uri $url = Uri.parse('/zwl1/p1vs7');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<VersionCheckResp, VersionCheckResp>($request);
  }

  @override
  Future<Response<ColoanGpResp>> _getCoLoanGpAppList({ColoanGpReq? root}) {
    final Uri $url = Uri.parse('/t71/s7a24');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ColoanGpResp, ColoanGpResp>($request);
  }

  @override
  Future<Response<HomeInfoResp>> _getHomeInfo({HomeInfoReq? root}) {
    final Uri $url = Uri.parse('/e8un6/oe942');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<HomeInfoResp, HomeInfoResp>($request);
  }

  @override
  Future<Response<LoanConfirmResp>> _confirmLoan({LoanConfirmReq? root}) {
    final Uri $url = Uri.parse('/oxz3/msva/x43li');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LoanConfirmResp, LoanConfirmResp>($request);
  }

  @override
  Future<Response<PicUploadReqResp>> _uploadPicture({PicUploadReqReq? root}) {
    final Uri $url = Uri.parse('/rushlike');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<PicUploadReqResp, PicUploadReqResp>($request);
  }

  @override
  Future<Response<CollTimeResp>> _getLoanCollectTime({CollTimeReq? root}) {
    final Uri $url = Uri.parse('/o1f/kur/yx41h');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<CollTimeResp, CollTimeResp>($request);
  }

  @override
  Future<Response<IsFirstLoanResp>> _isFirstLoan({IsFirstLoanReq? root}) {
    final Uri $url = Uri.parse('/v6ch/anzac');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<IsFirstLoanResp, IsFirstLoanResp>($request);
  }

  @override
  Future<Response<LoanOrderResp>> _getLoanOrder({LoanOrderReq? root}) {
    final Uri $url = Uri.parse('/qq3qd/i7nh');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LoanOrderResp, LoanOrderResp>($request);
  }

  @override
  Future<Response<LoanPreInfoResp>> _getLoanPreInfo({LoanPreInfoReq? root}) {
    final Uri $url = Uri.parse('/getter/d6637/zj0');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LoanPreInfoResp, LoanPreInfoResp>($request);
  }

  @override
  Future<Response<LoanFeeDetailResp>> _getLoanFeeDetail({
    LoanFeeDetailReq? root,
  }) {
    final Uri $url = Uri.parse('/reviewal/z8g14/t64c7');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LoanFeeDetailResp, LoanFeeDetailResp>($request);
  }

  @override
  Future<Response<BankValidInfoResp>> _getBankValidInfo({
    BankValidInfoReq? root,
  }) {
    final Uri $url = Uri.parse('/rhoi');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<BankValidInfoResp, BankValidInfoResp>($request);
  }

  @override
  Future<Response<AbandonReasonResp>> _submitAbandonReason({
    AbandonReasonReq? root,
  }) {
    final Uri $url = Uri.parse('/n89/wc2/e7z1');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<AbandonReasonResp, AbandonReasonResp>($request);
  }

  @override
  Future<Response<FeedbackResp>> _submitFeedback({FeedbackReq? root}) {
    final Uri $url = Uri.parse('/w8qp7/mqo57');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<FeedbackResp, FeedbackResp>($request);
  }

  @override
  Future<Response<NeedAbandonReasonResp>> _needAbandonReason({
    NeedAbandonReasonReq? root,
  }) {
    final Uri $url = Uri.parse('/y888/fjah');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<NeedAbandonReasonResp, NeedAbandonReasonResp>($request);
  }

  @override
  Future<Response<LoanNoticeResp>> _getLoanNotice({LoanNoticeReq? root}) {
    final Uri $url = Uri.parse('/c90e/ejvju/impulse');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LoanNoticeResp, LoanNoticeResp>($request);
  }

  @override
  Future<Response<CheckCreditResp>> _refreshCredit({CheckCreditReq? root}) {
    final Uri $url = Uri.parse('/p2f1');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<CheckCreditResp, CheckCreditResp>($request);
  }

  @override
  Future<Response<LivingDataResp>> _uploadLivingData({LivingDataReq? root}) {
    final Uri $url = Uri.parse('/zeb/angelus');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LivingDataResp, LivingDataResp>($request);
  }

  @override
  Future<Response<PhotoSubmitResp>> _submitPhoto({PhotoSubmitReq? root}) {
    final Uri $url = Uri.parse('/b72/obgr');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<PhotoSubmitResp, PhotoSubmitResp>($request);
  }

  @override
  Future<Response<CreditRecordResp>> _submitCreditData({
    CreditRecordReq? root,
  }) {
    final Uri $url = Uri.parse('/sluit/v7n/f4u39');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<CreditRecordResp, CreditRecordResp>($request);
  }

  @override
  Future<Response<EmailCheckResp>> _checkEmailValid({EmailCheckReq? root}) {
    final Uri $url = Uri.parse('/mjfe');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<EmailCheckResp, EmailCheckResp>($request);
  }

  @override
  Future<Response<HomeCouponResp>> _queryHomeCouponList({HomeCouponReq? root}) {
    final Uri $url = Uri.parse('/vallate/b0743/sl1');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<HomeCouponResp, HomeCouponResp>($request);
  }

  @override
  Future<Response<LoanCouponResp>> _queryLoanCouponList({LoanCouponReq? root}) {
    final Uri $url = Uri.parse('/i93hw');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LoanCouponResp, LoanCouponResp>($request);
  }

  @override
  Future<Response<MyCouponResp>> _queryMyCouponList({MyCouponReq? root}) {
    final Uri $url = Uri.parse('/ht3x');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<MyCouponResp, MyCouponResp>($request);
  }

  @override
  Future<Response<CouponGetResp>> _receiveCoupon({CouponGetReq? root}) {
    final Uri $url = Uri.parse('/operand');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<CouponGetResp, CouponGetResp>($request);
  }

  @override
  Future<Response<LandCouponResp>> _queryLandCouponList({LandCouponReq? root}) {
    final Uri $url = Uri.parse('/o03b/b3a');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LandCouponResp, LandCouponResp>($request);
  }

  @override
  Future<Response<CouponPopResp>> _couponHomePop({CouponPopReq? root}) {
    final Uri $url = Uri.parse('/w42q3');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<CouponPopResp, CouponPopResp>($request);
  }

  @override
  Future<Response<LoanBillResp>> _queryLoanBillList({LoanBillReq? root}) {
    final Uri $url = Uri.parse('/q39u2/acerbic');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LoanBillResp, LoanBillResp>($request);
  }

  @override
  Future<Response<BillStatusResp>> _getBillStatus({BillStatusReq? root}) {
    final Uri $url = Uri.parse('/vyg/snuggery');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<BillStatusResp, BillStatusResp>($request);
  }

  @override
  Future<Response<BillListResp>> _queryBillList({BillListReq? root}) {
    final Uri $url = Uri.parse('/cq7/topmost/fu2vz');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<BillListResp, BillListResp>($request);
  }

  @override
  Future<Response<BillDetailResp>> _getBillDetail({BillDetailReq? root}) {
    final Uri $url = Uri.parse('/y3kh7');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<BillDetailResp, BillDetailResp>($request);
  }

  @override
  Future<Response<BillRepayResp>> _queryRepaymentList({BillRepayReq? root}) {
    final Uri $url = Uri.parse('/philtrum/kbzd');
    final $body = root;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<BillRepayResp, BillRepayResp>($request);
  }
}
