import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse {
  /// 字段说明: 0000标识成功； 其余失败提示
  final String code;

  /// **消息**前端/客户端直接展示不再进行转义；**
  final String msg;

  /// 业务数据
  final dynamic data;

  ApiResponse({required this.code, required this.msg, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);

  factory ApiResponse.needCaptchaError() =>
      ApiResponse(code: 'MO9942', msg: '', data: null);
}

// **成功** RF6101 (ori: 0000)
// 1、EE7149 (ori: T1003) 或者 YL0395 (ori: T1005)  ，需要退出到登录页 （背景：身份验证失败或失效）
// 2、DO0413 (ori: T1021) ，需要弹出换设备短信校验 （背景：换设备登录校验）
// 3、TJ2605 (ori: T1023)、RO6710 (ori: T1024) , 换设备登录场景报此code, 需要退出登录页 （背景：换设备登录且短信次数超过限制；）
// 4、MO9942 (ori: T1013)、IS8131 (ori: T1019) 需弹图形验证码 （背景：短信验证码校验失败超过次数场景）
extension ApiResponseExtension on ApiResponse {
  bool get successful => code == "RF6101";

  bool get needLogin => code == 'EE7149' || code == 'YL0395';

  bool get needCaptcha => code == 'MO9942' || code == 'IS8131';

  bool get needVerify => code == 'DO0413';

  bool get globalCode => needLogin || needCaptcha || needVerify;
}
