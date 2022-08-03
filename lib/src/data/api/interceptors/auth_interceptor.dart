import 'package:todo_app/src/imports.dart';

class AuthInterceptor extends Interceptor {
  @override
  onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final token = Environment.token;

    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return super.onRequest(options, handler);
  }
}
