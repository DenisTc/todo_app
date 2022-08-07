import 'package:logger/logger.dart';
import 'package:todo_app/src/core/environments/environment.dart';

class AppLogger {
  static final AppLogger _instance = AppLogger._internal();

  Logger? _logger;

  factory AppLogger() {
    return _instance;
  }

  AppLogger._internal() {
    _logger = Logger(
      level: _getLoggerLevel(Environment.loggerLevel),
      filter: null,
      printer: PrettyPrinter(),
      output: null,
    );
  }

  v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger!.v(message, error, stackTrace);
  }

  d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger!.d(message, error, stackTrace);
  }

  i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger!.i(message, error, stackTrace);
  }

  w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger!.w(message, error, stackTrace);
  }

  e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger!.e(message, error, stackTrace);
  }

  wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger!.wtf(message, error, stackTrace);
  }

  Level _getLoggerLevel(String level) {
    switch (level) {
      case 'debug':
        return Level.debug;
      case 'info':
        return Level.info;
      case 'warning':
        return Level.warning;
      case 'error':
        return Level.error;
      case 'verbose':
        return Level.verbose;
      case 'wtf':
        return Level.wtf;
      default:
        return Level.nothing;
    }
  }
}
