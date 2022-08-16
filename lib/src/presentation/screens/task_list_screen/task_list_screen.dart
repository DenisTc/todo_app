import 'package:todo_app/src/core/constants/app_nums.dart';
import 'package:todo_app/src/imports.dart';
import 'package:todo_app/src/presentation/screens/task_list_screen/widgets/cusom_sliver_app_bar.dart';
import 'package:todo_app/src/presentation/screens/task_list_screen/widgets/list_tasks.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final _pinned = true;
  final _snap = false;
  final _floating = false;

  final _appBarHeight = AppNums.appBarHeight;
  final _minAppbarPadding = AppNums.minAppbarPadding;
  final _minAppbarBottomPadding = AppNums.minAppbarBottomPadding;

  bool isShowColpletedTask = false;

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<TaskModel>('tasks');

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context
            .read<NavigationController>()
            .navigateTo(RouteConstant.addTask),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (_, Box<TaskModel> box, __) {
            final countCompletedTask =
                box.values.where((task) => task.done).length;
            return CustomScrollView(
              slivers: [
                CusomSliverAppBar(
                  pinned: _pinned,
                  snap: _snap,
                  floating: _floating,
                  appBarHeight: _appBarHeight,
                  minAppbarPadding: _minAppbarPadding,
                  minAppbarBottomPadding: _minAppbarBottomPadding,
                  countCompletedTask: countCompletedTask,
                  isShowColpletedTask: isShowColpletedTask,
                  showColpletedTask: () => showColpletedTask(),
                ),
                ListTasks(
                  box: box,
                  isShowColpletedTask: isShowColpletedTask,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void showColpletedTask() {
    setState(() {
      isShowColpletedTask = !isShowColpletedTask;
    });
  }
}
