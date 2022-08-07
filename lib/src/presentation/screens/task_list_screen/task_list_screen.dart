import 'package:todo_app/src/core/constants/app_colors.dart';
import 'package:todo_app/src/imports.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final _pinned = true;
  final _snap = false;
  final _floating = false;

  final appBarHeight = 170.0;
  double minAppbarPadding = 16.0;

  bool isShowColpletedTask = false;

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<TaskModel>('tasks');
    final countCompletedTask = box.values.where((task) => task.done).length;

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
        child: CustomScrollView(
          slivers: [
            CusomSliverAppBar(
              pinned: _pinned,
              snap: _snap,
              floating: _floating,
              appBarHeight: appBarHeight,
              minAppbarPadding: minAppbarPadding,
              countCompletedTask: countCompletedTask,
              isShowColpletedTask: isShowColpletedTask,
              showColpletedTask: () => showColpletedTask(),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  ValueListenableBuilder(
                    valueListenable: box.listenable(),
                    builder: (_, Box<TaskModel> box, __) {
                      return _ListTasks(
                        box: box,
                        isShowColpletedTask: isShowColpletedTask,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
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

class CusomSliverAppBar extends StatelessWidget {
  final bool _pinned;
  final bool _snap;
  final bool _floating;
  final double appBarHeight;
  final double minAppbarPadding;
  final int? countCompletedTask;
  final bool isShowColpletedTask;
  final VoidCallback showColpletedTask;

  const CusomSliverAppBar({
    Key? key,
    required bool pinned,
    required bool snap,
    required bool floating,
    required this.appBarHeight,
    required this.minAppbarPadding,
    required this.showColpletedTask,
    this.countCompletedTask,
    required this.isShowColpletedTask,
  })  : _pinned = pinned,
        _snap = snap,
        _floating = floating,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return SliverAppBar(
      pinned: _pinned,
      snap: _snap,
      floating: _floating,
      expandedHeight: appBarHeight,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final percentage = (constraints.maxHeight - kToolbarHeight) /
              (appBarHeight - kToolbarHeight);
          final isCollapsed = percentage != 0.0;

          return Center(
            child: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: EdgeInsetsDirectional.only(
                start: minAppbarPadding + (44 * percentage),
                bottom: minAppbarPadding + (20 * percentage),
              ),
              title: Row(
                children: [
                  Text(
                    appLocalizations.myTasks,
                    style: isCollapsed
                        ? Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 20 + (12 * percentage), height: 1.6)
                        : Theme.of(context).textTheme.headline2,
                  ),
                  const Spacer(),
                  Material(
                    child: Visibility(
                      visible: !isCollapsed,
                      child: GestureDetector(
                        onTap: () {
                          showColpletedTask();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: SvgPicture.asset(
                            AppIcons.visibilityOn,
                            width: 23,
                            height: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              background: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(left: 64, right: 24),
                  child: Row(
                    children: [
                      Text(
                        '${appLocalizations.done} - $countCompletedTask',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          showColpletedTask();
                        },
                        icon: SvgPicture.asset(
                          !isShowColpletedTask
                              ? AppIcons.visibilityOn
                              : AppIcons.visibilityOff,
                          width: 23,
                          height: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ListTasks extends StatefulWidget {
  final Box<TaskModel> box;
  final bool isShowColpletedTask;
  const _ListTasks({
    Key? key,
    required this.box,
    required this.isShowColpletedTask,
  }) : super(key: key);

  @override
  State<_ListTasks> createState() => _ListTasksState();
}

class _ListTasksState extends State<_ListTasks> {
  @override
  Widget build(BuildContext context) {
    final taskBloc = BlocProvider.of<TaskBloc>(context);
    final appLocalizations = AppLocalizations.of(context)!;
    final customColors = Theme.of(context).extension<CustomColors>()!;
    final currentLocale = Localizations.localeOf(context).languageCode;
    List<TaskModel> box = [];

    if (widget.isShowColpletedTask) {
      box = widget.box.values.where((item) => !item.done).toList();
    } else {
      box = widget.box.values.toList();
    }

    return ClipRRect(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          top: 8,
          right: 8,
          bottom: 80,
        ),
        child: Card(
          child: Column(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                itemCount: box.length,
                itemBuilder: (_, i) {
                  final task = box[i];
                  final isImportant =
                      task.importance == ImportanceTypeEnum.important.name;
                  String? deadline;

                  if (task.deadline != null) {
                    deadline = DateFormat('d MMMM y', currentLocale)
                        .format(
                            DateTime.fromMillisecondsSinceEpoch(task.deadline!))
                        .toString();
                  }

                  return Dismissible(
                    key: Key(task.id),
                    confirmDismiss: (direction) async {
                      switch (direction) {
                        case DismissDirection.endToStart:
                          taskBloc.add(TaskEvent.deleteTask(task));
                          break;
                        default:
                          taskBloc.add(TaskEvent.completeTask(task));
                          break;
                      }
                      return null;
                    },
                    background: Container(
                      padding: const EdgeInsets.only(left: 24),
                      alignment: Alignment.centerLeft,
                      color: customColors.green,
                      child: SvgPicture.asset(
                        AppIcons.check,
                        color: customColors.white,
                      ),
                    ),
                    secondaryBackground: Container(
                      padding: const EdgeInsets.only(right: 24),
                      alignment: Alignment.centerRight,
                      color: customColors.red,
                      child: SvgPicture.asset(
                        AppIcons.delete,
                        color: customColors.white,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 19,
                        top: 15,
                        right: 18,
                        bottom: 15,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 4, right: 15),
                                child: SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: Container(
                                    color: isImportant && !task.done
                                        ? Theme.of(context)
                                            .errorColor
                                            .withOpacity(.16)
                                        : Colors.transparent,
                                    child: Checkbox(
                                      value: task.done,
                                      activeColor: customColors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      ),
                                      side: MaterialStateBorderSide.resolveWith(
                                        (states) => BorderSide(
                                          width: 2.0,
                                          color: _getBorderColor(
                                            status: task.done,
                                            isImportant: isImportant,
                                          ),
                                          // color: isImpartance
                                          //     ? customColors.red!
                                          //     : AppColors.labelTertiaryLight,
                                        ),
                                      ),
                                      onChanged: (_) => taskBloc
                                          .add(TaskEvent.completeTask(task)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => context
                                  .read<NavigationController>()
                                  .navigateTo(
                                RouteConstant.addTask,
                                arguments: {'task': task},
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Visibility(
                                        visible: task.importance !=
                                            ImportanceTypeEnum.basic.name,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 4,
                                            right: 6,
                                          ),
                                          child: _getImportanceIcon(
                                              task.importance),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          task.text,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: task.done
                                              ? Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .copyWith(
                                                      decoration: TextDecoration
                                                          .lineThrough)
                                              : Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 14,
                                          top: 4,
                                        ),
                                        child: SvgPicture.asset(
                                          AppIcons.infoOutline,
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (deadline != null)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Text(
                                        deadline,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Container(
                padding: const EdgeInsets.only(right: 8),
                height: 48,
                child: Container(
                  color: Colors.white,
                  height: 48,
                  child: Row(
                    children: [
                      const SizedBox(width: 67),
                      Expanded(
                        child: TextFormField(
                          onFieldSubmitted: (value) =>
                              context.read<NavigationController>().navigateTo(
                            RouteConstant.addTask,
                            arguments: {'text': value},
                          ),
                          style: Theme.of(context).textTheme.bodyText1,
                          decoration: InputDecoration(
                            hintText: appLocalizations.addNewTask,
                            hintStyle: Theme.of(context).textTheme.bodyText2,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getBorderColor({required bool status, required bool isImportant}) {
    if (!status) {
      if (isImportant) {
        return Theme.of(context).errorColor;
      } else {
        return AppColors.labelTertiaryLight;
      }
    }

    return Colors.transparent;
  }

  Widget _getImportanceIcon(String importance) {
    if (importance == ImportanceTypeEnum.important.name) {
      return SvgPicture.asset(
        AppIcons.hightPriority,
        color: Theme.of(context).primaryColor,
      );
    } else if (importance == ImportanceTypeEnum.low.name) {
      return SvgPicture.asset(AppIcons.lowPriority);
    }

    return const SizedBox.shrink();
  }
}
