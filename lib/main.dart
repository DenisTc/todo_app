import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/src/data/api/api.dart';
import 'package:todo_app/src/data/datasource/remote/remote_datasource_impl.dart';
import 'package:todo_app/src/data/services/firebase/remote_config_service.dart';
import 'package:todo_app/src/imports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: Environment.fileName);
  await HiveDB.initialize();
  await Firebase.initializeApp();
  RemoteConfigService.instance.initRemoteConfig();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    App(
      sharedPreferences: sharedPreferences,
    ),
  );
}

class App extends StatefulWidget {
  final SharedPreferences _sharedPreferences;

  const App({
    Key? key,
    required SharedPreferences sharedPreferences,
  })  : _sharedPreferences = sharedPreferences,
        super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _boxTasks = Hive.box<TaskModel>('tasks');
  final _api = Api();
  final _navigationController = NavigationController();
  final _routeObserver = RouteObserver();
  late LocalDataSourceImpl _localDatasource;
  late RemoteDatasourceImpl _remouteDatasource;
  late AppRepositoryImpl _appRepository;
  ThemeData currentTheme = AppTheme.lightTheme;
  Color? primaryColor;

  @override
  void initState() {
    super.initState();

    _localDatasource = LocalDataSourceImpl(
      boxTasks: _boxTasks,
      sharedPreferences: widget._sharedPreferences,
    );

    _remouteDatasource = RemoteDatasourceImpl(_api);

    _appRepository = AppRepositoryImpl(
      localDatasource: _localDatasource,
      remoteDatasource: _remouteDatasource,
    );

    final codeColor = RemoteConfigService.instance.getPrimaryColor();
    if (codeColor != null) {
      primaryColor = Color(codeColor);
    }
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
}
