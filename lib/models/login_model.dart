/// 登录请求
class LoginReqVO {
  /// 手机号
  final String sordid;

  /// 登录密码(密码登录时必填)
  final String? password;

  /// y260zp(o_token)(自动登录时用)
  final String? y260zp;

  /// raia(o_userGid)(自动登录时用)
  final int? raia;

  /// 登录设备号
  final String? ac0as4;

  /// 马甲渠道
  final String? d7x52p;

  /// 业务线
  final String? s377v5;

  /// 是否需要otp校验
  final int? oc;

  /// 验证码(重置密码设置)
  final String? presage;

  /// 图形验证码(重置密码设置)
  final String? snafu;

  /// App版本号
  final String? z775ud;

  LoginReqVO({
    required this.sordid,
    this.password,
    this.y260zp,
    this.raia,
    this.ac0as4,
    this.d7x52p,
    this.s377v5,
    this.oc,
    this.presage,
    this.snafu,
    this.z775ud,
  });

  factory LoginReqVO.fromJson(Map<String, dynamic> json) {
    return LoginReqVO(
      sordid: json['sordid'],
      password: json['password'],
      y260zp: json['y260zp'],
      raia: json['raia'],
      ac0as4: json['ac0as4'],
      d7x52p: json['d7x52p'],
      s377v5: json['s377v5'],
      oc: json['oc'],
      presage: json['presage'],
      snafu: json['snafu'],
      z775ud: json['z775ud'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sordid': sordid,
      'password': password,
      'y260zp': y260zp,
      'raia': raia,
      'ac0as4': ac0as4,
      'd7x52p': d7x52p,
      's377v5': s377v5,
      'oc': oc,
      'presage': presage,
      'snafu': snafu,
      'z775ud': z775ud,
    };
  }
}

/// 登录响应
class LoginRespVO {
  /// 手机号
  final String sordid;

  /// y260zp(o_token)
  final String y260zp;

  /// 用户姓名
  final String name;

  /// 用户Gid
  final int raia;

  /// 注册时间
  final int? hik0qm;

  LoginRespVO({
    required this.sordid,
    required this.y260zp,
    required this.name,
    required this.raia,
    this.hik0qm,
  });

  factory LoginRespVO.fromJson(Map<String, dynamic> json) {
    return LoginRespVO(
      sordid: json['sordid'],
      y260zp: json['y260zp'],
      name: json['name'],
      raia: json['raia'],
      hik0qm: json['hik0qm'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sordid': sordid,
      'y260zp': y260zp,
      'name': name,
      'raia': raia,
      'hik0qm': hik0qm,
    };
  }
}
