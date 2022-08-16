import 'package:todo_app/src/core/theme/typography/typography.dart';

class AppTextStyle {
  static const largeTitle = TextStyle(
    fontFamily: AppFontFamily.roboto,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 32,
    height: 1.18,
  );

  static const title = TextStyle(
    fontFamily: AppFontFamily.roboto,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 20,
    height: 1.6,
    letterSpacing: 0.5,
  );

  static const button = TextStyle(
    fontFamily: AppFontFamily.roboto,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.7,
    letterSpacing: 0.16,
  );

  static const body = TextStyle(
    fontFamily: AppFontFamily.roboto,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.25,
  );

  static const subhead = TextStyle(
    fontFamily: AppFontFamily.roboto,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.43,
  );
}
