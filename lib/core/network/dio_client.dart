import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:github_api_demonstration/core/config/app_config.dart';

class DioClient {
  static Dio createDio() {
    final dio = Dio(BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: Duration(milliseconds: AppConfig.apiTimeout),
      receiveTimeout: Duration(milliseconds: AppConfig.apiTimeout),
      headers: {
        'Accept': 'application/vnd.github.v3+json',
        'User-Agent': 'GitHubFlutterApp',
      },
    ));

    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }

    return dio;
  }
}

