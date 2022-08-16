import 'package:todo_app/src/imports.dart';

class Routes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.main:
        return MaterialPageRoute(builder: (_) => const TaskListScreen());
      case RouteConstant.addTask:
        final arguments = settings.arguments as Map?;
        final task = arguments?['task'];
        final text = arguments?['text'];

        return MaterialPageRoute(
            builder: (_) => AddTaskScreen(task: task, text: text));
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Scaffold(
            appBar: AppBar(
              leading: const BackButton(color: Colors.grey),
              backgroundColor: Colors.white,
            ),
            body: Center(
              child: Text(AppLocalizations.of(context)!.sreenNotFound),
            ),
          ),
        );
    }
  }
}
