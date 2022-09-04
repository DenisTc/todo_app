import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:todo_app/src/core/exceptions/dio_exception.dart';
import 'package:todo_app/src/core/logs/app_logger.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '[${options.method}] ${options.baseUrl}${options.path}';
    final dioException = DioException.fromDioError(err).toString();
    final errorMessage =
        'Error: $dioException\nRequest: $requestPath\nMessage: ${err.message}';

    AppLogger().e(errorMessage);

    FirebaseCrashlytics.instance.recordError(
      err,
      err.stackTrace,
      reason: errorMessage,
    );

    return super.onError(err, handler);
  }
}
