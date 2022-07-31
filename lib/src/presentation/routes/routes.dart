import 'package:todo_app/src/imports.dart';

class Routes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.main:
        return MaterialPageRoute(builder: (_) => const TaskListScreen());
      case RouteConstant.addTask:
        final task = settings.arguments as TaskModel?;
        return MaterialPageRoute(builder: (_) => AddTaskScreen(task: task));
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Scaffold(
            appBar: AppBar(
              leading: const BackButton(color: Colors.grey),
              backgroundColor: Colors.white,
            ),
            body: const Center(
              child: Text('You Shall Not Pass!'),
            ),
          ),
        );
    }
  }
}
