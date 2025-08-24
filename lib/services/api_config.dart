import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
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
    final storage = LocalStorage();
    final token = storage.token;
    final userGid = storage.userGid;
    final deviceId = await FlutterPlatform.getDeviceId();
    options.headers.addAll({
      'Accept-Language': AppConst.languageCode, // es西语
      'ys6955': userGid, // 用户Gid
      'kw0980': token, // 身份凭证
      'tp5366': AppConst.applicationName, // 包名
      'wr3384': AppConst.bizLine, // 业务线
      'zg3739': null, // appfly Id
      'jv9290': packageInfo.version, // app版本
      'ie3728': null, // google广告id
      'hk4661': deviceId, // 安卓id
    });

    if (options.method == 'POST' &&
        options.data != null &&
        options.data is Map) {
      final data = options.data as Map;
      final publicKey = RSAKeyParser().parse(AppConst.apiKey) as RSAPublicKey;
      final encrypter = Encrypter(RSA(publicKey: publicKey));
      // 加密 password
      if (data.containsKey('password')) {
        String password = data['password'];
        data['password'] = encrypter.encrypt(password);
      }
      // 马甲渠道
      if (data.containsKey('d7x52p')) {
        data['d7x52p'] = AppConst.channel;
      }
      // 业务线
      if (data.containsKey('s377v5')) {
        data['s377v5'] = AppConst.bizLine;
      }
      // App版本号
      if (data.containsKey('z775ud')) {
        data['z775ud'] = packageInfo.version;
      }
      // 设备号
      if (data.containsKey('ac0as4')) {
        data['ac0as4'] = deviceId;
      }
      // o_token
      if (data.containsKey('y260zp')) {
        data['y260zp'] = token;
      }
      // o_userGid
      if (data.containsKey('raia')) {
        data['raia'] = userGid;
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
