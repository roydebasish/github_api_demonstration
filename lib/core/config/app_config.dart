enum Environment {
  dev,
  staging,
  prod,
}

class AppConfig {
  static late Environment _environment;
  static late String _baseUrl;
  static late int _apiTimeout;
  static late bool _debugMode;

  static void initialize(Environment environment) {
    _environment = environment;

    switch (environment) {
      case Environment.dev:
        _baseUrl = 'https://api-dev.example.com';
        _apiTimeout = 30000;
        _debugMode = true;
        break;

      case Environment.staging:
        _baseUrl = 'https://api-staging.example.com';
        _apiTimeout = 30000;
        _debugMode = true;
        break;

      case Environment.prod:
        _baseUrl = 'https://api.example.com';
        _apiTimeout = 30000;
        _debugMode = false;
        break;
    }
  }

  static Environment get environment => _environment;
  static String get baseUrl => _baseUrl;
  static int get apiTimeout => _apiTimeout;
  static bool get debugMode => _debugMode;

  static bool get isDevelopment => _environment == Environment.dev;
  static bool get isStaging => _environment == Environment.staging;
  static bool get isProduction => _environment == Environment.prod;
}
