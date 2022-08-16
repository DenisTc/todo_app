import 'package:todo_app/src/imports.dart';
import 'package:todo_app/src/presentation/screens/add_edit_task_screen/widgets/deadline_data_picker.dart';
import 'package:todo_app/src/presentation/screens/add_edit_task_screen/widgets/dropdown_importance_level.dart';

class AddTaskScreen extends StatefulWidget {
  final TaskModel? task;
  final String? text;

  const AddTaskScreen({
    Key? key,
    this.task,
    this.text,
  }) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late TextEditingController _textController;
  late ImportanceTypeEnum dropdownValue;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    _textController =
        TextEditingController(text: widget.task?.text ?? widget.text);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dropdownValue = ImportanceTypeEnum.values.firstWhere(
      (element) => element.name == widget.task?.importance,
      orElse: () => ImportanceTypeEnum.basic,
    );

    selectedDate = widget.task?.deadline != null
        ? DateTime.fromMillisecondsSinceEpoch(widget.task!.deadline!)
        : null;
  }

  @override
  Widget build(BuildContext context) {
    final isEditMode = widget.task != null;
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            forceElevated: false,
            pinned: true,
            elevation: Theme.of(context).appBarTheme.elevation,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: GestureDetector(
              onTap: () => context.read<NavigationController>().pop(),
              child: SvgPicture.asset(
                AppIcons.close,
                height: 15,
                width: 15,
                fit: BoxFit.scaleDown,
              ),
            ),
            actions: [
              Visibility(
                child: TextButton(
                  onPressed: () async {
                    final id = widget.task?.id ?? const Uuid().v4();
                    final createdAt = widget.task?.createdAt ??
                        DateTime.now().millisecondsSinceEpoch;
                    final deviceId = await PlatformDeviceId.getDeviceId;

                    final task = TaskModel(
                      id: id,
                      text: _textController.text,
                      importance: dropdownValue.name,
                      deadline: selectedDate?.millisecondsSinceEpoch,
                      createdAt: createdAt,
                      changedAt: DateTime.now().millisecondsSinceEpoch,
                      lastUpdatedBy: deviceId!,
                    );

                    if (!mounted) return;
                    if (isEditMode) {
                      context.read<TaskBloc>().add(TaskEvent.updateTask(task));
                    } else {
                      context.read<TaskBloc>().add(TaskEvent.addTask(task));
                    }

                    context.read<NavigationController>().pop();
                  },
                  child: Text(
                    appLocalizations.save,
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _TextFormField(
                      textController: _textController,
                      appLocalizations: appLocalizations,
                    ),
                    DropdownImportanceLevel(
                      appLocalizations: appLocalizations,
                      dropdownValue: dropdownValue,
                      callback: (val) {
                        setState(() => dropdownValue = val);
                      },
                    ),
                    DeadlineDataPicker(
                      appLocalizations: appLocalizations,
                      selectedDate: selectedDate,
                      callback: (val) {
                        setState(() => selectedDate = val);
                      },
                    ),
                    const Divider(height: 1),
                    const SizedBox(height: 8),
                    _DeleteTaskButton(
                      isEditMode: isEditMode,
                      widget: widget,
                      appLocalizations: appLocalizations,
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TextFormField extends StatelessWidget {
  const _TextFormField({
    Key? key,
    required TextEditingController textController,
    required this.appLocalizations,
  })  : _textController = textController,
        super(key: key);

  final TextEditingController _textController;
  final AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        top: 8,
        right: 16,
        bottom: 12,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 6,
          ),
          child: TextFormField(
            controller: _textController,
            minLines: 4,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            style: Theme.of(context).textTheme.bodyText1,
            decoration: InputDecoration(
              hintText: appLocalizations.taskFormFieldPlaceholder,
              hintStyle: Theme.of(context).textTheme.bodyText2,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}

class _DeleteTaskButton extends StatelessWidget {
  const _DeleteTaskButton({
    Key? key,
    required this.isEditMode,
    required this.widget,
    required this.appLocalizations,
  }) : super(key: key);

  final bool isEditMode;
  final AddTaskScreen widget;
  final AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: !isEditMode
          ? null
          : () {
              context.read<TaskBloc>().add(TaskEvent.deleteTask(widget.task!));

              context.read<NavigationController>().pop();
            },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            SvgPicture.asset(
              AppIcons.delete,
              color: !isEditMode
                  ? Theme.of(context).disabledColor
                  : Theme.of(context).errorColor,
            ),
            const SizedBox(width: 12),
            Text(
              appLocalizations.delete,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: !isEditMode
                        ? Theme.of(context).disabledColor
                        : Theme.of(context).errorColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
