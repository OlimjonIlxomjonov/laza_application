import 'package:flutter/material.dart';
import 'package:laza_applicaiton/core/common/constants/colors/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.white,
  primaryColor: AppColors.primary(),
  colorScheme: ColorScheme.light(
    primary: AppColors.primary(),
    secondary: AppColors.secondary,
    surface: AppColors.greyBackground,
  ),
  textTheme: TextTheme(bodyMedium: TextStyle(color: AppColors.black)),
);
