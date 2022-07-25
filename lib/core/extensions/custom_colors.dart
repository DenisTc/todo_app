import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color? white;
  final Color? green;
  final Color? red;

  const CustomColors({
    required this.white,
    required this.green,
    required this.red,
  });

  @override
  ThemeExtension<CustomColors> copyWith({
    Color? white,
    Color? green,
    Color? red,
  }) {
    return CustomColors(
      white: white ?? this.white,
      green: green ?? this.green,
      red: red ?? this.red,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
      ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      white: Color.lerp(white, other.green, t),
      green: Color.lerp(green, other.green, t),
      red: Color.lerp(red, other.red, t),
    );
  }

  @override
  String toString() => 'CustomColors(white: $white, green: $green, red: $red)';

  static const light = CustomColors(
    white: AppColors.whiteLight,
    green: AppColors.greenLight,
    red: AppColors.redLight,
  );

  static const dark = CustomColors(
    white: AppColors.whiteDark,
    green: AppColors.greenDark,
    red: AppColors.redDark,
  );
}
