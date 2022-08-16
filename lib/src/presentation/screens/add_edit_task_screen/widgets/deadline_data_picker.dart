import 'package:todo_app/src/imports.dart';

typedef StringCallback = void Function(DateTime? val);

class DeadlineDataPicker extends StatefulWidget {
  final AppLocalizations appLocalizations;
  final DateTime? selectedDate;
  final StringCallback callback;

  const DeadlineDataPicker({
    Key? key,
    required this.selectedDate,
    required this.callback,
    required this.appLocalizations,
  }) : super(key: key);

  @override
  State<DeadlineDataPicker> createState() => _DeadlineDataPickerState();
}

class _DeadlineDataPickerState extends State<DeadlineDataPicker> {
  DateTime? selectedDate;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedDate = widget.selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context).languageCode;
    bool isToggled = selectedDate == null ? false : true;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.appLocalizations.makeUpTo,
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
                    style: Theme.of(context).textTheme.subtitle2,
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
                widget.callback(selectedDate);
              } else {
                await _selectDate(context);
              }

              setState(() {
                isToggled = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(
    BuildContext context,
  ) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      confirmText: widget.appLocalizations.ready,
    );
    if (pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
      widget.callback(selectedDate);
    }
  }
}
