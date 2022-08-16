import 'package:todo_app/src/imports.dart';

typedef ImportanceCallback = void Function(ImportanceTypeEnum val);

class DropdownImportanceLevel extends StatefulWidget {
  final AppLocalizations appLocalizations;
  final ImportanceTypeEnum dropdownValue;
  final ImportanceCallback callback;

  const DropdownImportanceLevel({
    Key? key,
    required this.appLocalizations,
    required this.dropdownValue,
    required this.callback,
  }) : super(key: key);

  @override
  State<DropdownImportanceLevel> createState() =>
      _DropdownImportanceLevelState();
}

class _DropdownImportanceLevelState extends State<DropdownImportanceLevel> {
  late ImportanceTypeEnum dropdownValue;
  bool showListItems = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    dropdownValue = widget.dropdownValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.appLocalizations.importance,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          PopupMenuButton<ImportanceTypeEnum>(
            initialValue: dropdownValue,
            child: Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 16),
              child: Text(
                _getImportanceTitle(
                  appLocalizations: widget.appLocalizations,
                  title: dropdownValue,
                ),
                style: _getTextStyleBtn(dropdownValue),
              ),
            ),
            onSelected: (ImportanceTypeEnum? newValue) {
              if (newValue != null) {
                setState(() => dropdownValue = newValue);
                widget.callback(dropdownValue);
              }
            },
            itemBuilder: (context) => ImportanceTypeEnum.values.map(
              (ImportanceTypeEnum type) {
                return PopupMenuItem<ImportanceTypeEnum>(
                  value: type,
                  child: Container(
                    padding: const EdgeInsets.all(0)
                        .resolve(Directionality.of(context)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _getImportanceTitle(
                          appLocalizations: widget.appLocalizations,
                          title: type,
                        ),
                        style: _getTextStyleInList(type),
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
          const Divider(
            height: 1,
          ),
        ],
      ),
    );
  }

  TextStyle? _getTextStyleBtn(ImportanceTypeEnum type) {
    if (type == ImportanceTypeEnum.basic) {
      return Theme.of(context).textTheme.subtitle1;
    } else if (type == ImportanceTypeEnum.important) {
      return Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(color: Theme.of(context).primaryColor);
    }

    return Theme.of(context).textTheme.bodyText1;
  }

  TextStyle? _getTextStyleInList(ImportanceTypeEnum type) {
    if (type != ImportanceTypeEnum.important) {
      return Theme.of(context).textTheme.bodyText1;
    }

    return Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(color: Theme.of(context).primaryColor);
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
}
