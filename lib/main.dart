import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/src/data/api/api.dart';
import 'package:todo_app/src/data/datasource/remote/remote_datasource_impl.dart';
import 'package:todo_app/src/data/services/firebase/analytics_service.dart';
import 'package:todo_app/src/data/services/firebase/remote_config_service.dart';
import 'package:todo_app/src/imports.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await dotenv.load(fileName: Environment.fileName);
      await HiveDB.initialize();
      await Firebase.initializeApp();
      RemoteConfigService.instance.initRemoteConfig();
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;
      final analyticsService = AnalyticsService();
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      runApp(
        App(
          sharedPreferences: sharedPreferences,
          analyticsService: analyticsService,
        ),
      );
    },
    (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack),
  );
}

class App extends StatefulWidget {
  final SharedPreferences _sharedPreferences;
  final AnalyticsService _analyticsService;

  const App({
    Key? key,
    required SharedPreferences sharedPreferences,
    required AnalyticsService analyticsService,
  })  : _sharedPreferences = sharedPreferences,
        _analyticsService = analyticsService,
        super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _boxTasks = Hive.box<TaskModel>('tasks');
  final _api = Api();
  final _navigationController = NavigationController();
  final _routeObserver = RouteObserver();

  late AppRepositoryImpl _appRepository;
  late FirebaseAnalyticsObserver observer;

  ThemeData currentTheme = AppTheme.lightTheme;
  bool isLightTheme = false;
  Color? primaryColor;

  @override
  void initState() {
    super.initState();
    observer = widget._analyticsService.getAnalyticsObserver();

    _appRepository = AppRepositoryImpl(
      localDatasource: LocalDataSourceImpl(
        boxTasks: _boxTasks,
        sharedPreferences: widget._sharedPreferences,
      ),
      remoteDatasource: RemoteDatasourceImpl(_api),
    );

    initPrimaryColor();
    initShakeDetector();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<NavigationController>.value(
          value: _navigationController,
          child: Provider<RouteObserver>.value(
            value: _routeObserver,
          ),
        ),
        BlocProvider(
          create: (context) =>
              TaskBloc(_appRepository)..add(const TaskEvent.loadAllTasks()),
        ),
      ],
      child: MaterialApp(
        title: Environment.appName,
        navigatorKey: _navigationController.key,
        navigatorObservers: <NavigatorObserver>[observer],
        onGenerateRoute: Routes.generateRoute,
        initialRoute: RouteConstant.main,
        theme: currentTheme.copyWith(primaryColor: primaryColor),
        supportedLocales: L10n.all,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        home: const TaskListScreen(),
      ),
    );
  }

  void initPrimaryColor() {
    final codeColor = RemoteConfigService.instance.getPrimaryColor();

    if (codeColor != null) {
      primaryColor = Color(codeColor);
    }
  }

  void initShakeDetector() {
    try {
      ShakeDetector.autoStart(
        onPhoneShake: () {
          setState(
            () {
              isLightTheme = !isLightTheme;
              if (isLightTheme) {
                currentTheme = AppTheme.lightTheme;
              } else {
                currentTheme = AppTheme.darkTheme;
              }
            },
          );
        },
      );
    } catch (e) {
      Logger().e(e);
    }
  }
}
