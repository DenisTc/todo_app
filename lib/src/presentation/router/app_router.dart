import 'package:todo_app/src/core/constants/app_deeplinks.dart';
import 'package:todo_app/src/imports.dart';
import 'package:todo_app/src/presentation/router/model/app_state_manager.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final AppStateManager _appStateManager;
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  AppRouter({
    required AppStateManager appStateManager,
  })  : _appStateManager = appStateManager,
        navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    _appStateManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<MaterialPage<dynamic>> pages = [
      const MaterialPage(child: TaskListScreen()),
      if (_appStateManager.selectedTask != null)
        MaterialPage(
          child: AddTaskScreen(
            task: _appStateManager.selectedTask,
          ),
        ),
      if (_appStateManager.textNewTask != null)
        MaterialPage(
          child: AddTaskScreen(
            text: _appStateManager.textNewTask,
          ),
        ),
    ];

    return Navigator(
      key: navigatorKey,
      observers: [
        HeroController(),
      ],
      onPopPage: _handlePopPage,
      pages: pages,
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    _appStateManager.resetState();

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async {}

  void parseRoute(Uri uri) {
    if (uri.pathSegments.isNotEmpty) {
      if (uri.path == AppDeepLinks.addNewTask) {
        _appStateManager.addNewTask('');
      }
    }
  }
}
