import 'package:todo_app/src/imports.dart';

class RequestInterceptor extends Interceptor {
  @override
  onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    if (options.method == 'PUT' || options.method == 'POST') {
      options.headers.addAll({'Content-Type': 'application/json'});
      //  options.headers['Content-Type'] = 'application/json';
    }

    if (options.method == 'PATCH') {
      //   options.headers.addAll({'Content-Type': 'application/json'});
      //   //  options.headers['Content-Type'] = 'application/json';
      // }

      return super.onRequest(options, handler);
    }

    return super.onRequest(options, handler);
  }
}
