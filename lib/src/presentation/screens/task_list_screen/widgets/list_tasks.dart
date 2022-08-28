import 'package:todo_app/src/imports.dart';
import 'package:todo_app/src/presentation/cubit/task/task_cubit.dart';
import 'package:todo_app/src/presentation/router/model/app_state_manager.dart';

class ListTasks extends StatefulWidget {
  final List<TaskModel> listTask;
  final bool isShowColpletedTask;
  const ListTasks({
    Key? key,
    required this.listTask,
    required this.isShowColpletedTask,
  }) : super(key: key);

  @override
  State<ListTasks> createState() => _ListTasksState();
}

class _ListTasksState extends State<ListTasks> {
  @override
  Widget build(BuildContext context) {
    final navController = Provider.of<AppStateManager>(context);
    final taskCubit = BlocProvider.of<TaskCubit>(context);
    final appLocalizations = AppLocalizations.of(context)!;
    final customColors = Theme.of(context).extension<CustomColors>()!;
    final currentLocale = Localizations.localeOf(context).languageCode;
    final textController = TextEditingController();
    List<TaskModel> listTask = [];

    if (widget.isShowColpletedTask) {
      listTask = widget.listTask.where((item) => !item.done).toList();
    } else {
      listTask = widget.listTask;
    }

    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Center(
            child: ClipRRect(
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
                        itemCount: listTask.length,
                        itemBuilder: (_, i) {
                          final task = listTask[i];
                          final isImportant = task.importance ==
                              ImportanceTypeEnum.important.name;
                          String? deadline;

                          if (task.deadline != null) {
                            deadline = DateFormat('d MMMM y', currentLocale)
                                .format(DateTime.fromMillisecondsSinceEpoch(
                                    task.deadline!))
                                .toString();
                          }

                          return Dismissible(
                            key: Key(task.id),
                            confirmDismiss: (direction) async {
                              switch (direction) {
                                case DismissDirection.endToStart:
                                  taskCubit.deleteTask(task);
                                  break;
                                default:
                                  taskCubit.completeTask(task);
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
                                        padding: const EdgeInsets.only(
                                          top: 3,
                                          right: 15,
                                        ),
                                        child: SizedBox(
                                          height: 18,
                                          width: 18,
                                          child: ColoredBox(
                                            color: isImportant && !task.done
                                                ? Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(.16)
                                                : Colors.transparent,
                                            child: Checkbox(
                                              value: task.done,
                                              activeColor: customColors.green,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                              side: MaterialStateBorderSide
                                                  .resolveWith(
                                                (states) => BorderSide(
                                                  width: 2.0,
                                                  color: _getBorderColor(
                                                    status: task.done,
                                                    isImportant: isImportant,
                                                  ),
                                                ),
                                              ),
                                              onChanged: (_) =>
                                                  taskCubit.completeTask(task),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => navController.goToTask(task),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Visibility(
                                                visible: task.importance !=
                                                    ImportanceTypeEnum
                                                        .basic.name,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: task.done
                                                      ? Theme.of(context)
                                                          .textTheme
                                                          .bodyText2!
                                                          .copyWith(
                                                              decoration:
                                                                  TextDecoration
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
                                                  color: Theme.of(context)
                                                      .iconTheme
                                                      .color,
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (deadline != null)
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 4),
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
                        child: Row(
                          children: [
                            const SizedBox(width: 67),
                            Expanded(
                              child: TextFormField(
                                controller: textController,
                                onFieldSubmitted: (value) {
                                  navController.addNewTask(value);
                                  textController.clear();
                                },
                                style: Theme.of(context).textTheme.bodyText1,
                                decoration: InputDecoration(
                                  hintText: appLocalizations.addNewTask,
                                  hintStyle:
                                      Theme.of(context).textTheme.bodyText2,
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getBorderColor({required bool status, required bool isImportant}) {
    if (!status) {
      if (isImportant) {
        return Theme.of(context).primaryColor;
      } else {
        return Theme.of(context).checkboxTheme.side!.color;
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
