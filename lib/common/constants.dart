/// 应用常量定义
class AppConstants {
  // 应用信息
  static const String appName = 'FlutterNow';
  static const String appVersion = '1.0.0';

  // API 配置
  static const String baseUrl = 'https://api.example.com';
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;

  // 本地存储键名
  static const String tokenKey = 'token';
  static const String userInfoKey = 'user_info';
  static const String isFirstLaunchKey = 'is_first_launch';

  // 权限相关
  static const String cameraPermission = 'camera';
  static const String locationPermission = 'location';
  static const String notificationPermission = 'notification';
  static const String smsPermission = 'sms';
  static const String phonePermission = 'phone';
  static const String networkPermission = 'network';
  static const String deviceInfoPermission = 'device_info';
  static const String appListPermission = 'app_list';

  // 电话配置
  static const int phoneLength = 8;
  static const int codeLength = 4;
}

/// API接口路径
class Api {
  /// 是否已经注册
  static const String checkIsRegister = '/pl5';

  /// 注册
  static const String register = '/jt32/x1eg/i91';

  /// 登录
  static const String login = '/aitch/q2i1/vwi0';

  /// 重置登录密码
  static const String resetLoginPwd = '/aitch/q2i1/vwi0/password/reset';

  /// 判断是否可注销（APP）
  static const String isCanUnregister = '/fattish/k9a6';

  /// 账户注销(APP)
  static const String unregister = '/w6y/jacky/hh7g';

  /// 是否需要图片校验
  static const String isNeedGraphVerifyNew = '/t1o0w/utk';

  /// 获取验证码
  static const String getSmsVerifyCode = '/umwelt';

  /// 获取图形验证码
  static const String getGraphVerifyCode = '/s3r/{mobileSn_}';

  /// 图形验证码校验
  static const String checkGraphCode = '/mordant';

  /// 校验短信及图形验证码
  static const String checkVerifyCodeAndGraphCode = '/s23';

  /// 提交授信数据
  static const String submitInfo = '/sluit/v7n/f4u39';

  /// 邮箱、身份证号校验
  static const String checkCuiOrEmail = '/mjfe';

  /// 图片上传（包含上传/滤波分检查/人脸检测）
  static const String uploadImage = '';

  /// OCR
  static const String requestOcr = '';

  /// 提交授信影像(H5)
  static const String submitOcrAndFace = '/b72/obgr';

  /// 获取首页基本信息
  static const String homeData = '/e8un6/oe942';

  /// 用户基本信息查询
  static const String queryUserInfo = '/c46qr';

  /// 判断是否需要上报
  static const String isNeedUploadData = '/vqp6/auo6x';

  /// 上报新版本（含大数据短信）
  static const String uploadData = '/ignore/jv8/y27/chechia';

  /// 刷新授信结果
  static const String refreshCreditResult = '/p2f1';

  /// 获取借款信息
  static const String getLoanData = '';

  /// 重置交易密码
  static const String setTradePwd = '';

  /// 交易密码校验
  static const String checkTradePwd = '';

  /// 借款
  static const String applyLoan = '';

  /// 好评引导
  static const String goodEvaluate = '';

  /// 添加银行卡
  static const String addBankcard = '';

  /// 删除银行卡
  static const String delBankcard = '';

  /// 用户银行卡列表
  static const String userBankcardList = '';

  /// 查询支持的银行列表
  static const String queryBankName = '';

  /// 借款历史列表
  static const String loanHistoryList = '';

  /// 账单列表
  static const String billList = '';

  /// 账单详情
  static const String billDetail = '';

  /// 还款历史列表
  static const String repayHistoryList = '';

  /// 还款请求
  static const String repay = '';

  /// 还款记录
  static const String repayRecord = '';

  /// 字典项
  static const String dict = '';

  /// 风控上报项配置接口
  static const String riskConfig = '';

  /// 获取前端配置
  static const String appConfig = '';

  /// 公告
  static const String publicInfo = '';

  /// 是否需要上报放弃原因
  static const String isNeedFillGiveUpReason = '';

  /// 中途放弃原因
  static const String submitGiveUpReason = '';

  /// 意见反馈
  static const String feedback = '';
}
