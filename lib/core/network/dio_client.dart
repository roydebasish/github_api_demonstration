import 'package:dio/dio.dart';
import '../config/app_config.dart';

class DioClient {
  static Dio createDio() {
    final dio = Dio(BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Accept': 'application/vnd.github.v3+json',
        'User-Agent': 'GitHubFlutterApp',
      },
    ));

    if (AppConfig.debugMode) {
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
    }
    return dio;
  }
}
