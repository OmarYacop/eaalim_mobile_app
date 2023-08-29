import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../repository/core/endpoints.dart';
import 'app_interceptors.dart';

class DioClient {
  static DioClient? _singleton;

  static late Dio _dio;

  DioClient._() {
    _dio = createDioClient();
  }

  factory DioClient() {
    return _singleton ??= DioClient._();
  }

  Dio get instance => _dio;

  Dio createDioClient() {
    final dio = Dio(BaseOptions(
        baseUrl: Endpoints.baseUrl,
        receiveTimeout: const Duration(seconds: 120),
        connectTimeout: const Duration(seconds: 120),
        sendTimeout: const Duration(seconds: 1000),
        headers: {
          Headers.acceptHeader: 'application/json',
          Headers.contentTypeHeader: 'application/json',
        }));

    dio.interceptors.addAll([
      AppInterceptors(),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    ]);
    return dio;
  }
}
