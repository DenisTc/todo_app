import 'package:todo_app/src/core/constants/app_nums.dart';
import 'package:todo_app/src/imports.dart';
import 'package:todo_app/src/presentation/cubit/list_task/list_task_cubit.dart';
import 'package:todo_app/src/presentation/cubit/task/task_cubit.dart';
import 'package:todo_app/src/presentation/router/model/app_state_manager.dart';
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
  List<TaskModel> tasks = [];
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final navController = Provider.of<AppStateManager>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => navController.addNewTask(''),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: BlocListener<TaskCubit, TaskState>(
          listener: (context, state) => state.whenOrNull(
            success: () =>
                BlocProvider.of<ListTaskCubit>(context).loadListTask(),
          ),
          child: BlocListener<ListTaskCubit, ListTaskState>(
            listener: (context, state) => state.whenOrNull(
              loaded: (listTask, countCompletedTask) => setState(
                () {
                  tasks = listTask;
                  count = countCompletedTask;
                },
              ),
            ),
            child: CustomScrollView(
              slivers: [
                CusomSliverAppBar(
                  pinned: _pinned,
                  snap: _snap,
                  floating: _floating,
                  appBarHeight: _appBarHeight,
                  minAppbarPadding: _minAppbarPadding,
                  minAppbarBottomPadding: _minAppbarBottomPadding,
                  countCompletedTask: count,
                  isShowColpletedTask: isShowColpletedTask,
                  showColpletedTask: () => showColpletedTask(),
                ),
                ListTasks(
                  listTask: tasks,
                  isShowColpletedTask: isShowColpletedTask,
                ),
              ],
            ),
          ),
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
