import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/src/core/enums/flavor_type_enum.dart';
import 'package:todo_app/src/data/api/api.dart';
import 'package:todo_app/src/data/datasource/remote/remote_datasource_impl.dart';
import 'package:todo_app/src/data/services/firebase/analytics_service.dart';
import 'package:todo_app/src/data/services/firebase/remote_config_service.dart';
import 'package:todo_app/src/data/storage/box_names.dart';
import 'package:todo_app/src/imports.dart';
import 'package:todo_app/src/presentation/cubit/list_task/list_task_cubit.dart';
import 'package:todo_app/src/presentation/cubit/task/task_cubit.dart';
import 'package:todo_app/src/presentation/router/app_router.dart';
import 'package:todo_app/src/presentation/router/model/app_state_manager.dart';
import 'package:uni_links/uni_links.dart';

class App extends StatefulWidget {
  final FlavorTypeEnum flavorType;
  final SharedPreferences _sharedPreferences;
  final AnalyticsService _analyticsService;

  const App({
    Key? key,
    required SharedPreferences sharedPreferences,
    required AnalyticsService analyticsService,
    required this.flavorType,
  })  : _sharedPreferences = sharedPreferences,
        _analyticsService = analyticsService,
        super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appStateManager = AppStateManager();
  final _boxTasks = Hive.box<TaskModel>(BoxNames.tasks);
  final _api = Api();

  late AppRouter _appRouter;
  late AppRepositoryImpl _appRepository;
  late FirebaseAnalyticsObserver observer;
  late StreamSubscription _linkSubscription;

  ThemeData currentTheme = AppTheme.lightTheme;
  bool isLightTheme = false;
  Color? primaryColor;

  @override
  void initState() {
    super.initState();
    observer = widget._analyticsService.getAnalyticsObserver();

    _appRouter = AppRouter(
      appStateManager: _appStateManager,
    );

    _appRepository = AppRepositoryImpl(
      localDatasource: LocalDataSourceImpl(
        boxTasks: _boxTasks,
        sharedPreferences: widget._sharedPreferences,
      ),
      remoteDatasource: RemoteDatasourceImpl(_api),
    );

    initPrimaryColor();
    initShakeDetector();

    initUniLinks();
  }

  @override
  void dispose() {
    _linkSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        ),
        BlocProvider(
          create: (context) => ListTaskCubit(_appRepository)..loadListTask(),
        ),
        BlocProvider(
          create: (context) => TaskCubit(_appRepository),
        ),
      ],
      child: MaterialApp(
        title: Environment.appName,
        theme: currentTheme.copyWith(primaryColor: primaryColor),
        supportedLocales: L10n.all,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: widget.flavorType == FlavorTypeEnum.dev,
        home: Router(routerDelegate: _appRouter),
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

  Future<void> initUniLinks() async {
    try {
      Uri? initialLink = await getInitialUri();
      if (initialLink != null) {
        _appRouter.parseRoute(initialLink);
      }

      _linkSubscription = uriLinkStream.listen((uri) {
        if (uri != null) {
          _appRouter.parseRoute(uri);
        }
      }, onError: (error) => error.printError());
    } on PlatformException {
      Logger().e('Platfrom exception unilink');
    }
  }
}
