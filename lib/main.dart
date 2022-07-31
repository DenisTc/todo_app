import 'package:todo_app/src/imports.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('tasks');

  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final navigationController = NavigationController();
  final routeObserver = RouteObserver();

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
        BlocProvider(create: (context) => TaskBloc()),
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
