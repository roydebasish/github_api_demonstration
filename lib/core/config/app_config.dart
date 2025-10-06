enum Environment { dev, staging, prod }

class AppConfig {
  static late String _environment;
  static late String _baseUrl;
  static late int _apiTimeout;

  static void initialize(String environment) {
    _environment = environment;
    switch (environment) {
      case 'prod':
        _baseUrl = "https://api.github.com";
        break;
      case 'staging':
        _baseUrl = "https://staging.api.github.com";
        break;
      case 'dev':
      default:
        _baseUrl = "https://api.github.com";
    }
    _apiTimeout = 30000;
  }

  static String get environment => _environment;
  static String get baseUrl => _baseUrl;
  static int get apiTimeout => _apiTimeout;
}
