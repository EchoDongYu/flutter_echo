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

  bool get successful => code == "0000";

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
