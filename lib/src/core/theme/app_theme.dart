import 'package:flutter/services.dart';
import 'package:todo_app/src/core/constants/app_colors.dart';
import 'package:todo_app/src/core/extensions/custom_colors.dart';
import 'package:todo_app/src/core/theme/typography/typography.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark
            .copyWith(statusBarColor: AppColors.backPrimaryLight),
      ),
      scaffoldBackgroundColor: AppColors.backPrimaryLight,
      primaryColor: AppColors.redLight,
      dividerColor: AppColors.supportSeparatorLight,
      disabledColor: AppColors.labelDisableLight,
      toggleableActiveColor: AppColors.blueLight,
      errorColor: AppColors.redLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.blueLight,
      ),
      cardTheme: const CardTheme(
        elevation: 2,
        color: AppColors.backSecondaryLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(AppColors.backSecondaryLight),
        side: const BorderSide(
          color: AppColors.supportSeparatorLight,
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.labelTertiaryLight,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith(
          (states) {
            if (!states.contains(MaterialState.selected)) {
              return AppColors.supportOverlayLight;
            }
            return null;
          },
        ),
        trackColor: MaterialStateProperty.resolveWith(
          (states) {
            if (!states.contains(MaterialState.selected)) {
              return AppColors.supportOverlayLight;
            }
            return null;
          },
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.blueLight,
      ),
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

  static ThemeData get darkTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light
            .copyWith(statusBarColor: AppColors.backPrimaryDark),
      ),
      scaffoldBackgroundColor: AppColors.backPrimaryDark,
      primaryColor: AppColors.redDark,
      dividerColor: AppColors.supportSeparatorDark,
      disabledColor: AppColors.labelDisableDark,
      toggleableActiveColor: AppColors.blueDark,
      errorColor: AppColors.redDark,
      dialogBackgroundColor: AppColors.backSecondaryDark,
      colorScheme: const ColorScheme.light(
        onSurface: Colors.white,
        primary: AppColors.blueDark,
        background: AppColors.backSecondaryDark,
      ),
      cardTheme: const CardTheme(
        elevation: 2,
        color: AppColors.backSecondaryDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(AppColors.backSecondaryDark),
        side: const BorderSide(
          color: AppColors.supportSeparatorDark,
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.labelTertiaryDark,
      ),
      popupMenuTheme:
          const PopupMenuThemeData(color: AppColors.backElevatedDark),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith(
          (states) {
            if (!states.contains(MaterialState.selected)) {
              return AppColors.backElevatedDark;
            }
            return null;
          },
        ),
        trackColor: MaterialStateProperty.resolveWith(
          (states) {
            if (!states.contains(MaterialState.selected)) {
              return AppColors.supportOverlayDark;
            }
            return null;
          },
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.blueDark,
      ),
      extensions: const <ThemeExtension<dynamic>>[
        CustomColors.dark,
      ],
      textTheme: TextTheme(
        headline1: AppTextStyle.largeTitle.copyWith(
          color: AppColors.labelPrimaryDark,
        ),
        headline2: AppTextStyle.title.copyWith(
          color: AppColors.labelPrimaryDark,
        ),
        bodyText1: AppTextStyle.body.copyWith(
          color: AppColors.labelPrimaryDark,
        ),
        bodyText2: AppTextStyle.body.copyWith(
          color: AppColors.labelTertiaryDark,
        ),
        button: AppTextStyle.button.copyWith(
          color: AppColors.blueDark,
        ),
        subtitle1: AppTextStyle.subhead.copyWith(
          color: AppColors.labelTertiaryDark,
        ),
        subtitle2: AppTextStyle.subhead.copyWith(
          color: AppColors.blueDark,
        ),
      ),
    );
  }
}
