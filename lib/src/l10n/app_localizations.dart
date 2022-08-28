import 'package:flutter/material.dart';

abstract class AppLocalizations {
  // the return type is now non-nullable
  static AppLocalizations of(BuildContext context) {
    // note the ! at the end
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }
}
