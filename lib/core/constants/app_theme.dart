import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/core/typography/typography.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backPrimaryLight,
      dividerColor: AppColors.supportSeparatorLight,
      toggleableActiveColor: AppColors.blueLight,
      errorColor: AppColors.redLight,
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
