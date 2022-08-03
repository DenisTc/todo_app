import 'package:todo_app/src/imports.dart';

class Environment {
  static String get fileName => 'assets/env/.env.development';
  static String get apiUrl => dotenv.get('API_URL');
  static String get token => dotenv.get('TOKEN');
}
