import 'package:todo_app/src/imports.dart';

Future<void> main() async {
  await dotenv.load(fileName: Environment.fileName);
  await HiveDB.initialize();

  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final box = Hive.box<TaskModel>('tasks');
  final navigationController = NavigationController();
  final routeObserver = RouteObserver();
  late LocalDataSourceImpl localData;
  late AppRepositoryImpl _appRepository;

  @override
  void initState() {
    super.initState();

    localData = LocalDataSourceImpl(box);
    _appRepository = AppRepositoryImpl(localData);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<NavigationController>.value(
          value: navigationController,
          child: Provider<RouteObserver>.value(
            value: routeObserver,
          ),
        ),
        BlocProvider(create: (context) => TaskBloc(_appRepository)),
      ],
      child: MaterialApp(
        title: 'My Tasks',
        navigatorKey: navigationController.key,
        onGenerateRoute: Routes.generateRoute,
        initialRoute: RouteConstant.main,
        theme: AppTheme.lightTheme,
        supportedLocales: L10n.all,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: const TaskListScreen(),
      ),
    );
  }
}
