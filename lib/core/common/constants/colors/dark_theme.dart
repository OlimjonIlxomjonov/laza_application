import 'package:flutter/material.dart';
import 'package:laza_applicaiton/core/common/constants/colors/app_colors.dart';

final ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  primaryColor: AppColors.primary(),
  colorScheme: ColorScheme.dark(
    primary: AppColors.primary(),
    secondary: AppColors.secondary,
    surface: AppColors.backgroundNText,
  ),
  textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
);
