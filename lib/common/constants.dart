/// 应用常量定义
class AppConst {
  // 应用信息
  static const String applicationName = 'CrediGo';
  static const String channel = "CrediGo";
  static const String bizLine = "7";
  static const String countryCode = "502";
  static const String isoCountryCode = "GT";
  static const String languageCode = "es";
  static const int phoneLength = 8;
  static const int codeLength = 4;

  /// 是否生产环境
  static const bool production = false;

  /// API 地址
  static const String baseUrl = AppConst.production
      ? 'http://159.138.174.19:3000'
      : 'http://159.138.174.19:3000';

  // API 响应码
  static const String success = 'RF6101'; // 0000
  static const String tokenError = 'EE7149'; // T1003
  static const String tokenExpire = 'YL0395'; // T1005
  static const String codeMuchError = 'MO9942'; // T1013
  static const String captureError = 'IS8131'; // T1019
  ///   1、EE7149 (ori: T1003) 或者 YL0395 (ori: T1005)  ，需要退出到登录页 （背景：身份验证失败或失效）
  ///   2、DO0413 (ori: T1021) ，需要弹出换设备短信校验 （背景：换设备登录校验）
  ///   3、TJ2605 (ori: T1023)、RO6710 (ori: T1024) , 换设备登录场景报此code, 需要退出登录页 （背景：换设备登录且短信次数超过限制；）
  ///   4、MO9942 (ori: T1013)、IS8131 (ori: T1019) 需弹图形验证码 （背景：短信验证码校验失败超过次数场景）

  // 本地存储键名
  static const String tokenKey = 'token';
  static const String userIdKey = 'user_id';
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

  /// 获取图形验证码
  static const String getCaptchaCode = '/s3r/{mobileSn_}';

  /// 账户注销(APP)
  static const String accountCancelApp = '/w6y/jacky/hh7g';

  /// 账户注销(落地页)
  static const String accountCancelLand = '/murky/cta66';

  /// 重置交易密码
  static const String resetTraderPassword = '/htves/opossum';

  /// 重置登录密码
  static const String resetLoginPassword = '/aitch/q2i1/vwi0/password/reset';

  /// 客户端上报日志分析（通用）
  static const String uploadLog = '/tools/android/log';

  /// 图形验证码校验
  static const String checkCaptchaCode = '/mordant';

  /// 校验短信及图形验证码
  static const String checkVerificationCode = '/s23';

  /// 获取验证码
  static const String sendVerificationCode = '/umwelt';

  /// 上报新版本（含大数据短信）
  static const String reportTrack = '/ignore/jv8/y27/chechia';

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
  static const String refreshCredit = '/p2f1';

  /// 授信-身份认证页 活体数据上传
  static const String uploadLivingData = '/zeb/angelus';

  /// 提交授信影像(H5)
  static const String submitPhoto = '/b72/obgr';

  /// 提交授信数据
  static const String submitCreditData = '/sluit/v7n/f4u39';

  /// 邮箱、身份证号校验
  static const String checkEmailValid = '/mjfe';

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
