import 'package:todo_app/src/core/constants/app_colors.dart';
import 'package:todo_app/src/core/extensions/custom_colors.dart';
import 'package:todo_app/src/core/typography/typography.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backPrimaryLight,
      dividerColor: AppColors.supportSeparatorLight,
      disabledColor: AppColors.labelDisableLight,
      toggleableActiveColor: AppColors.blueLight,
      // checkboxTheme: CheckboxThemeData(),
      extensions: const <ThemeExtension<dynamic>>[
        CustomColors.light,
      ],
      textTheme: TextTheme(
        headline1: AppTextStyle.largeTitle.copyWith(
          color: AppColors.labelPrimaryLight,
        ),
        headline2: AppTextStyle.title.copyWith(
          color: AppColors.labelPrimaryLight,
        ),
        bodyText1: AppTextStyle.body.copyWith(
          color: AppColors.labelPrimaryLight,
        ),
        bodyText2: AppTextStyle.body.copyWith(
          color: AppColors.labelTertiaryLight,
        ),
        button: AppTextStyle.button.copyWith(
          color: AppColors.blueLight,
        ),
        subtitle1: AppTextStyle.subhead.copyWith(
          color: AppColors.labelTertiaryLight,
        ),
        subtitle2: AppTextStyle.subhead.copyWith(
          color: AppColors.blueLight,
        ),
      ),
    );
  }
}
