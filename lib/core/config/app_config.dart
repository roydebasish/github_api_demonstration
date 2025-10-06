enum Environment { dev, staging, prod }

class AppConfig {
  static late Environment _environment;
  static late String _baseUrl;
  static late bool _debugMode;

  static void initialize(Environment environment) {
    _environment = environment;

    switch (environment) {
      case Environment.dev:
        _baseUrl = 'https://api.github.com'; // dev placeholder
        _debugMode = true;
        break;
      case Environment.staging:
        _baseUrl = 'https://staging-api.github.com';
        _debugMode = true;
        break;
      case Environment.prod:
        _baseUrl = 'https://api.github.com';
        _debugMode = false;
        break;
    }
  }

  static String get baseUrl => _baseUrl;
  static bool get debugMode => _debugMode;
}
