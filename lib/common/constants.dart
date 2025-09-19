import 'package:flutter_echo/services/storage_service.dart';

/// 应用常量定义
class AppConst {
  // 产品名称：CashiGO
  // biz_channel：CashiGO
  // 包名：com.cashigo.rapidos.prestamos.app
  static const String applicationId = 'com.cashigo.rapidos.prestamos.app';
  static const String applicationName = 'CashiGO';
  static const String channel = 'CashiGO';
  static const String bizLine = '7';
  static const String countryCode = '502';
  static const String isoCountryCode = 'gt';
  static const String languageCode = 'es';
  static const String localeCode = 'es-GT';
  static const int phoneLen = 8;
  static const int codeLen = 4;
  static const int passwordLen = 4;
  static const int captchaLen = 4;
  static const int dataOffset = 310;

  /// 是否生产环境
  static const bool production = false;

  /// 1.大数据上报域名（SMS及埋点事件上报）：https://insights.davaloan.com/insights
  /// 2.业务侧上报域名/生产域名（除SMS以外数据上报）：https://insights.davaloan.com/insights
  /// 3.测试域名：test-credifacilgo.com/insights
  static const String baseUrl = AppConst.production
      ? 'https://cashigo.credifacilgo.com/csg'
      : 'http://159.138.164.19:8089/titans';

  static const String h5Faq = AppConst.production
      ? 'https://www.credifacilgo.com/m/app/gtm/faq'
      : 'https://test-www.credifacilgo.com/m/app/gtm/faq';
  static const String h5Service = AppConst.production
      ? 'https://www.credifacilgo.com/m/app/gtm/service'
      : 'https://test-www.credifacilgo.com/m/app/gtm/service';
  static const String h5Privacy = AppConst.production
      ? 'https://www.credifacilgo.com/m/app/gtm/privacy'
      : 'https://test-www.credifacilgo.com/m/app/gtm/privacy';

  static const String _rsaKey = AppConst.production
      ? 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCUNOcnExGUXzbT0ZYw9wNOsCSxT6dpgW0qiWD4v4bTWC9h9+RWzzZxaZNLLS6aSM4uPKWYHRy/swDsikWBondq7bQZhr/rTlX7DeICli3eKUPNcEh6xhpffyy+rksCsxDIQAzRMevXqXpRP6Y2GGGw3H8FOjQXHH6lG/Uo1ozPDwIDAQAB'
      : 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC+tVyzd+zg14CgVSQ95MMjHnQB6rfgAyMNJJxM5IIOLoNgjX4VCaDUcX1MMhAQkBaZ2iupIh8i1KOcjOGyzu7chsDP+bZqDjtsbBf4LID7HdNnRZU5tXsQ+2SmkSxIaDc88/C1Zn7mV14GDqdj2ePQ+YQcfUEIB+xiWRxAJopgQwIDAQAB';

  static const String apiKey =
      '-----BEGIN PUBLIC KEY-----\n$_rsaKey\n-----END PUBLIC KEY-----';

  /// 常用邮箱
  static const List<String> emailDomains = [
    'gmail.com',
    'hotmail.com',
    'outlook.com',
    'yahoo.com',
    'live.com.mx',
    'yahoo.com.mx',
    'outlook.es',
    'live.com',
    'hotmail.es',
    'msn.com',
  ];

  // 本地存储键名
  static const String deviceIdKey = 'device_id';
  static const String tokenKey = 'token';
  static const String userGidKey = 'user_id';
  static const String userInfoKey = 'user_info';
  static const String accountKey = 'account';
  static const String disclosureKey = 'disclosure';
  static const String kycStepKey = 'kycStep';
  static const String kycDataKey = 'kycData';
  static const String mainInfoKey = 'mainInfo';
}

class ApiPath {
  /// 删除银行卡
  static const String deleteBankCard = '/q8ply/e678/f6l';

  /// 我的频道-银行卡列表显示有效与无效的卡
  static const String queryMyBankCardList = '/i94oi';

  /// 查询支持的银行列表
  static const String queryBankList = '/yqaiw/thymol/o70tl';

  /// 根据卡bin查询银行
  static const String getBankCardBin = '/bank/cardbin/check';

  /// 绑卡结果查询
  static const String getBankBindResult = '/t20r/m739/result';

  /// 绑定银行卡
  static const String bindBankCard = '/t20r/m739';

  /// 银行账户列表
  static const String queryBankCardList = '/walkdown/awe/caisson';

  /// 交易密码校验
  static const String checkTraderPassword = '/unpaired/k4u5f';

  /// 判断是否可注销（APP）
  static const String judgeAccountCancel = '/fattish/k9a6';

  /// 是否已经注册
  static const String isRegister = '/pl5';

  /// 是否白名单
  static const String isWhiteList = '/h2fx/i8qv';

  /// 是否需要图片校验
  static const String needCheckCaptcha = '/t1o0w/utk';

  /// 注册
  static const String registerUser = '/jt32/x1eg/i91';

  /// 用户基本信息查询
  static const String getUserBaseInfo = '/c46qr';

  /// 登录
  static const String loginUser = '/aitch/q2i1/vwi0';

  static String captchaCode() =>
      '${AppConst.baseUrl}/s3r/${LocalStorage().deviceId}?t=${DateTime.now().millisecondsSinceEpoch}';

  /// 账户注销(APP)
  static const String accountCancelApp = '/w6y/jacky/hh7g';

  /// 账户注销(落地页)
  static const String accountCancelLand = '/murky/cta66';

  /// 重置交易密码
  static const String resetTraderPassword = '/htves/opossum';

  /// 重置登录密码
  static const String resetLoginPassword = '/l876';

  /// 获取字典项
  static const String getDictionary = '/wojz7/h4n/j36';

  /// 客户端上报日志分析（通用）
  static const String uploadLog = '/tools/android/log';

  /// 图形验证码校验
  static const String checkCaptchaCode = '/mordant';

  /// 校验短信及图形验证码
  static const String checkVerificationCode = '/s23';

  /// 获取验证码
  static const String sendVerificationCode = '/umwelt';

  /// 上报新版本（含大数据短信）
  static const String reportTrack = '/jv8/y27/chechia';

  /// 判断是否需要上报
  static const String needReport = '/vqp6/auo6x';

  /// 风控上报项配置接口
  static const String reportRiskConfig = '/jxd';

  /// 创建线下还款虚拟账户
  static const String createRepaymentVaAccount = '/nda';

  /// 提交线下还款虚拟账户交易凭证
  static const String submitRepaymentVoucher = '/hlf/i74';

  /// 获取线下还款虚拟账户
  static const String getRepaymentVaAccount = '/cx7e/d989/w7q';

  /// 还款请求
  static const String applyRepay = '/famish';

  /// 银行直连还款申请列表
  static const String queryRepaymentRecord = '/z5af/jbeo2';

  /// 判断是否是gp审核用户
  static const String isReviewAccount = '/vo71/vt52o/dx8';

  /// 获取前端配置
  static const String getMainBaseInfo = '/uhn/pm969';

  /// 公告查询
  static const String getNoticeMain = '/x50h/hv0';

  /// /zwl1/p1vs7
  static const String checkAppVersion = '/zwl1/p1vs7';

  /// 获取共贷产品信息
  static const String getCoLoanGpAppList = '/t71/s7a24';

  /// 获取首页基本信息
  static const String getHomeInfo = '/e8un6/oe942';

  /// 借款
  static const String confirmLoan = '/oxz3/msva/x43li';

  /// 图片上传(H5)
  static const String uploadPicture = '/rushlike';

  /// 收集催收时间
  static const String getLoanCollectTime = '/o1f/kur/yx41h';

  /// 是否首次借款
  static const String isFirstLoan = '/v6ch/anzac';

  /// 根据orderGid查询订单
  static const String getLoanOrder = '/qq3qd/i7nh';

  /// 获取借款信息
  static const String getLoanPreInfo = '/getter/d6637/zj0';

  /// 获取借款费用配置明细
  static const String getLoanFeeDetail = '/reviewal/z8g14/t64c7';

  /// 获取有效的bank信息
  static const String getBankValidInfo = '/rhoi';

  /// 中途放弃原因
  static const String submitAbandonReason = '/n89/wc2/e7z1';

  /// 提交意见反馈
  static const String submitFeedback = '/w8qp7/mqo57';

  /// 是否需要上报放弃原因
  static const String needAbandonReason = '/y888/fjah';

  /// 获取借款提示
  static const String getLoanNotice = '/c90e/ejvju/impulse';

  /// 刷新授信结果
  static const String refreshSubmitResult = '/p2f1';

  /// 授信-身份认证页 活体数据上传
  static const String uploadLivingData = '/zeb/angelus';

  /// 提交授信影像(H5)
  static const String submitPhoto = '/b72/obgr';

  /// 提交授信数据
  static const String submitCreditData = '/sluit/v7n/f4u39';

  /// 邮箱、身份证号校验
  static const String checkSubmitValid = '/mjfe';

  /// app首页优惠券列表展示
  static const String queryHomeCouponList = '/vallate/b0743/sl1';

  /// 借款 - 优惠券列表
  static const String queryLoanCouponList = '/i93hw';

  /// 我的 - 优惠券列表
  static const String queryMyCouponList = '/ht3x';

  /// 落地页一键领取优惠券
  static const String receiveCoupon = '/operand';

  /// 落地页优惠券列表展示
  static const String queryLandCouponList = '/o03b/b3a';

  /// 落地页弹窗是否有权限领取优惠券
  static const String couponHomePop = '/w42q3';

  /// 借款历史列表
  static const String queryLoanBillList = '/q39u2/acerbic';

  /// 查询订单状态
  static const String getBillStatus = '/vyg/snuggery';

  /// 账单列表
  static const String queryBillList = '/cq7/topmost/fu2vz';

  /// 账单详情
  static const String getBillDetail = '/y3kh7';

  /// 还款历史列表
  static const String queryRepaymentList = '/philtrum/kbzd';
}
