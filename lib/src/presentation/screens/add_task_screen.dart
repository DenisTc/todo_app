import 'package:todo_app/src/imports.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final items = [
    'Нет',
    'Низкий',
    'Высокий',
  ];

  String? dropdownvalue;
  bool isToggled = false;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
          TextButton(
            onPressed: () {},
            child: Text(
              appLocalizations.save,
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    minLines: 4,
                    maxLines: 10,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: appLocalizations.taskFormFieldPlaceholder,
                      hintStyle: Theme.of(context).textTheme.bodyText2,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appLocalizations.importance,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      iconSize: 0.0,
                      value: dropdownvalue ?? items.first,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                  const Divider(
                    height: 1,
                  ),
                ],
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
                            DateFormat('d MMMM y', 'ru_RU')
                                .format(selectedDate)
                                .toString(),
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Switch(
                    activeColor: Theme.of(context).toggleableActiveColor,
                    value: isToggled,
                    onChanged: (value) {
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
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.delete,
                      color: customColors.red,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      appLocalizations.delete,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: customColors.red,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
    }
  }
}
