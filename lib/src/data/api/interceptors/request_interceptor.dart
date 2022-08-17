import 'package:logger/logger.dart';
import 'package:todo_app/src/imports.dart';

class RequestInterceptor extends Interceptor {
  @override
  onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    if (options.method == 'PUT' || options.method == 'POST') {
      options.headers.addAll({'Content-Type': 'application/json'});
    }

    final requestPath = '${options.baseUrl}${options.path}';
    Logger().i('${options.method} request => $requestPath');

    return super.onRequest(options, handler);
  }
}
