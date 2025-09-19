import 'dart:io';

import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/api_response.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pointycastle/asymmetric/api.dart';

class ApiController {
  final _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    ),
  );

  Dio get dio => _dio;

  ApiController(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
    _dio.interceptors.add(_ApiInterceptor());
    // _dio.interceptors.add(
    //   LogInterceptor(
    //     requestBody: true,
    //     responseBody: true,
    //     logPrint: (object) => logLong(object.toString()),
    //   ),
    // );
  }

  void logLong(String msg) {
    const int chunk = 800;
    final int len = msg.length;
    for (var i = 0; i < msg.length; i += chunk) {
      debugPrint(msg.substring(i, i + chunk > len ? len : i + chunk));
    }
  }

  Future<T> post<T>(
    String path, {
    Map<String, dynamic>? body,
    T Function(dynamic json)? convert,
  }) async {
    final response = await _dio.post(path, data: body);
    final apiResponse = ApiResponse.fromJson(response.data);
    if (apiResponse.successful) {
      if (convert != null) {
        return convert(apiResponse.data);
      }
      return apiResponse.data;
    } else {
      throw apiResponse;
    }
  }

  Future<bool> postSt(String path, {Map<String, dynamic>? body}) async {
    final response = await _dio.post(path, data: body);
    final apiResponse = ApiResponse.fromJson(response.data);
    if (apiResponse.successful) {
      return true;
    } else {
      throw apiResponse;
    }
  }

  Future<bool> report(String path, {Object? body}) async {
    final response = await _dio.post(path, data: body);
    final apiResponse = ApiResponse.fromJson(response.data);
    if (apiResponse.successful) {
      return true;
    } else {
      throw apiResponse;
    }
  }
}

class _ApiInterceptor extends Interceptor {
  static final _encrypter = Encrypter(
    RSA(publicKey: RSAKeyParser().parse(AppConst.apiKey) as RSAPublicKey),
  );

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final packageInfo = await PackageInfo.fromPlatform();
    final storage = LocalStorage();
    final token = storage.token;
    final userGid = storage.userGid;
    final deviceId = storage.deviceId;
    final Map<String, dynamic> headers = {
      'Accept-Language': AppConst.languageCode, // es西语
      'ys6955': userGid, // 用户Gid
      'kw0980': token, // 身份凭证
      'tp5366': AppConst.applicationName, // 包名
      'wr3384': AppConst.bizLine, // 业务线
      'zc8974': AppConst.isoCountryCode,
      'zg3739': deviceId, // appfly Id
      'jv9290': packageInfo.version, // app版本
      'ie3728': deviceId, // google广告id
      'hk4661': deviceId, // 安卓id
    };
    headers.removeWhere((key, value) => value == null);
    options.headers.addAll(headers);
    if (options.method == 'POST' &&
        options.data != null &&
        options.data is Map) {
      final data = options.data as Map;
      // 手机号加密 o_mobile
      if (data.containsKey('sordid')) {
        String? value = data['sordid'];
        if (value != null) {
          data['sordid'] = _encrypter.encrypt(value).base64;
        }
      }
      // 密码加密 password
      if (data.containsKey('password')) {
        String? value = data['password'];
        if (value != null) {
          data['password'] = _encrypter.encrypt(value).base64;
        }
      }
      // o_bizChannel 马甲渠道
      if (data.containsKey('d7x52p')) {
        data['d7x52p'] = AppConst.channel;
      }
      // o_bizLine 业务线
      if (data.containsKey('s377v5')) {
        data['s377v5'] = AppConst.bizLine;
      }
      // o_appVersion App版本号
      if (data.containsKey('z775ud')) {
        data['z775ud'] = packageInfo.version;
      }
      // o_mobileSn 设备号
      if (data.containsKey('ac0as4')) {
        data['ac0as4'] = deviceId;
      }
      // o_appsflyerId afId
      if (data.containsKey('spank')) {
        data['spank'] = deviceId;
      }
      // o_token
      if (data.containsKey('y260zp')) {
        data['y260zp'] = token;
      }
      // o_userGid
      if (data.containsKey('raia')) {
        data['raia'] = userGid;
      }
      data.removeWhere((key, value) => value == null);
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    //showToast(msg: _handleDioError(err));
    showNormalSnack(_handleDioError(err));
    super.onError(err, handler);
  }
}

/// 全局错误处理
String _handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return 'Tiempo de conexión agotado, por favor revise su red.';
    case DioExceptionType.sendTimeout:
      return 'Tiempo de envío agotado, por favor inténtelo de nuevo.';
    case DioExceptionType.receiveTimeout:
      return 'Tiempo de respuesta agotado, inténtelo más tarde.';
    case DioExceptionType.badResponse:
      return 'Error del servidor (${error.response?.statusCode ?? ''}), por favor inténtelo más tarde.';
    case DioExceptionType.cancel:
      return 'La solicitud ha sido cancelada.';
    case DioExceptionType.unknown:
    default:
      if (error.error is SocketException) {
        return 'No se puede conectar al servidor, por favor revise su conexión a Internet.';
      } else if (error.error is HandshakeException) {
        return 'Error de seguridad SSL, no se pudo establecer una conexión segura.';
      } else {
        return 'Error desconocido, por favor inténtelo más tarde.';
      }
  }
}
