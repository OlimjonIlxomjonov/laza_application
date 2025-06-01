import 'package:flutter/material.dart';

abstract class AppColors {
  static const primary = _PrimaryBlue();

  static const Color secondary = Color(0xFFFFD300);
  static const Color white = Colors.white;
  static const Color black = Color(0xFF1D1E20);
  static const Color red = Color(0xFFFF5757);
  static const Color pink = Color(0xFFE91E63);
  static const Color purple = Color(0xFF9775FA);
  static const Color deepPurple = Color(0xFF673AB7);
  static const Color indigo = Color(0xFF4267B2);
  static const Color blue = Color(0xFF2196F3);
  static const Color lightBlue = Color(0xFF1DA1F2);
  static const Color cyan = Color(0xFF00BCD4);
  static const Color teal = Color(0xFF009688);
  static const Color green = Color(0xFF4CAF50);
  static const Color lightGreen = Color(0xFF8BC34A);
  static const Color lime = Color(0xFFCDDC39);
  static const Color yellow = Color(0xFFFFEB3B);
  static const Color amber = Color(0xFFFFC107);
  static const Color orange = Color(0xFFFF9800);
  static const Color deepOrange = Color(0xFFEA4335);
  static const Color brown = Color(0xFF795548);
  static const Color blueGrey = Color(0xFF607D8B);
  static const Color grey = Color(0xFF8F959E);
  static const Color greyBackground = Color(0xFFF5F6FA);

  static const Color backgroundNText = Color(0xFF9775FA);

  /// dark mode
  static const Color scaffoldBackground = Color(0xff1B262C);
}

class _PrimaryBlue {
  const _PrimaryBlue();

  final blue100 = const Color(0xFFEBEFFE);
  final blue200 = const Color(0xFFADBFFC);
  final blue300 = const Color(0xFF859EFA);
  final blue400 = const Color(0xFF5C7EF9);
  final blue500 = const Color(0xFF335EF7);

  Color call() => blue500;
}
