import 'package:todo_app/src/data/api/interceptors/auth_interceptor.dart';
import 'package:todo_app/src/data/api/interceptors/error_interceptor.dart';
import 'package:todo_app/src/data/api/interceptors/request_interceptor.dart';
import 'package:todo_app/src/imports.dart';

class Api {
  static final Api _singleton = Api._();

  Api._();

  factory Api() {
    return _singleton;
  }

  final _baseOptions = BaseOptions(
    baseUrl: Environment.apiUrl,
    connectTimeout: 5000,
    receiveTimeout: 5000,
    sendTimeout: 5000,
  );

  Dio get client {
    final dio = Dio(_baseOptions);

    return addInterceptors(dio);
  }

  Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.addAll(
        [
          AuthInterceptor(),
          RequestInterceptor(),
          ErrorInterceptor(),
        ],
      );
  }
}
