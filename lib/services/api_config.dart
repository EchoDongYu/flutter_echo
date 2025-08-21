import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/api_response.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ApiController {
  final _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  ApiController(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
    _dio.interceptors.add(_ApiInterceptor());
    if (!AppConst.production) {
      _dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: (object) => log(object.toString()),
        ),
      );
    }
  }

  Future<T> post<T>(
    String path, {
    Map<String, dynamic>? body,
    T Function(dynamic json)? convert,
  }) async {
    try {
      final response = await _dio.post(path, data: body);
      final apiResponse = ApiResponse.fromJson(response.data);
      if (apiResponse.code == AppConst.success) {
        if (convert != null) {
          return convert(apiResponse.data);
        }
        return apiResponse.data;
      } else {
        throw apiResponse;
      }
    } catch (e) {
      rethrow;
    }
  }
}

class _ApiInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final packageInfo = await PackageInfo.fromPlatform();
    options.headers.addAll({
      'Accept-Language': AppConst.languageCode, // es西语
      'ys6955': null, // 用户Gid
      'kw0980': null, // 身份凭证
      'tp5366': AppConst.applicationName, // 包名
      'wr3384': AppConst.bizLine, // 业务线
      'zg3739': null, // appfly Id
      'jv9290': packageInfo.version, // app版本
      'ie3728': null, // google广告id
      'hk4661': null, // 安卓id
    });

    final encrypter = Encrypter(RSA());

    if (options.method == 'POST' &&
        options.data != null &&
        options.data is Map) {
      final data = options.data as Map;

      // 加密 password
      if (data.containsKey('password')) {
        String password = data['password'];
        data['password'] = encrypter.encrypt(password);
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    //Fluttertoast.showToast(msg: _handleDioError(err));
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
