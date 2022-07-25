import 'package:todo_app/imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationController = NavigationController();
    final routeObserver = RouteObserver();

    return MultiProvider(
      providers: [
        Provider<NavigationController>.value(
          value: navigationController,
          child: Provider<RouteObserver>.value(
            value: routeObserver,
          ),
        ),
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
