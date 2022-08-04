import 'package:todo_app/src/imports.dart';

class AddTaskScreen extends StatefulWidget {
  final TaskModel? task;
  const AddTaskScreen({Key? key, this.task}) : super(key: key);

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
    _textController = TextEditingController(text: widget.task?.text ?? '');
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
    final currentLocale = Localizations.localeOf(context).languageCode;
    final appLocalizations = AppLocalizations.of(context)!;

    bool isToggled = selectedDate == null ? false : true;

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

                    // TODO(Denis): нужно пофиксить предупреждение линта
                    // Стоит ли в UI вычислять uuid/deviceid или делать это в блоке?
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
                    Padding(
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
                              hintText:
                                  appLocalizations.taskFormFieldPlaceholder,
                              hintStyle: Theme.of(context).textTheme.bodyText2,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              appLocalizations.importance,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            SizedBox(
                              width: 200,
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<ImportanceTypeEnum>(
                                    isExpanded: true,
                                    iconSize: 0.0,
                                    value: dropdownValue,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: ImportanceTypeEnum.values
                                        .map((ImportanceTypeEnum level) {
                                      return DropdownMenuItem<
                                          ImportanceTypeEnum>(
                                        value: level,
                                        child: Text(
                                          _getImportanceTitle(
                                            appLocalizations: appLocalizations,
                                            title: level,
                                          ),
                                          style: level !=
                                                  ImportanceTypeEnum.important
                                              ? Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                              : Theme.of(context)
                                                  .textTheme
                                                  .subtitle1!
                                                  .copyWith(
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (ImportanceTypeEnum? newValue) {
                                      if (newValue != null) {
                                        setState(
                                            () => dropdownValue = newValue);
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const Divider(
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                appLocalizations.makeUpTo,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              const SizedBox(height: 4),
                              Visibility(
                                maintainSize: true,
                                maintainAnimation: true,
                                maintainState: true,
                                visible: isToggled,
                                child: InkWell(
                                  onTap: () => _selectDate(context),
                                  child: Text(
                                    DateFormat('d MMMM y', currentLocale)
                                        .format(selectedDate ?? DateTime.now())
                                        .toString(),
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Switch(
                            value: isToggled,
                            onChanged: (value) async {
                              if (!value) {
                                selectedDate = null;
                              }

                              await _selectDate(context);
                              setState(() {
                                isToggled = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: !isEditMode
                          ? null
                          : () {
                              context
                                  .read<TaskBloc>()
                                  .add(TaskEvent.deleteTask(widget.task!));

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
                                  : Theme.of(context).primaryColor,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              appLocalizations.delete,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                    color: !isEditMode
                                        ? Theme.of(context).disabledColor
                                        : Theme.of(context).primaryColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
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

  String _getImportanceTitle({
    required AppLocalizations appLocalizations,
    required ImportanceTypeEnum title,
  }) {
    switch (title) {
      case ImportanceTypeEnum.low:
        return appLocalizations.lowImportanceEnum;
      case ImportanceTypeEnum.important:
        return '!! ${appLocalizations.importantImportanceEnum}';
      default:
        return appLocalizations.basicImportanceEnum;
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final currentLocale = Localizations.localeOf(context).languageCode;

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      locale: Locale(currentLocale),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }
}
