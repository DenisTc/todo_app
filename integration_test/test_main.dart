import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/src/data/services/firebase/analytics_service.dart';
import 'package:todo_app/src/data/services/firebase/remote_config_service.dart';
import 'package:todo_app/src/imports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: Environment.fileName);
  await HiveDB.initialize();
  await Firebase.initializeApp();
  RemoteConfigService.instance.initRemoteConfig();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  final analyticsService = AnalyticsService();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    App(
      sharedPreferences: sharedPreferences,
      analyticsService: analyticsService,
    ),
  );
}
