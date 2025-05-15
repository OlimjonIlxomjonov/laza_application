import 'package:flutter/material.dart';
import '../../utils/responsiveness/app_responsivness.dart';
import 'app_text_styles.dart';
import 'font_family.dart';

class InterTextStyle extends AppTextStyles {
  @override
  TextStyle bold({required Color color, required double fontSize}) => TextStyle(
    fontSize: AppResponsiveness.height(fontSize),
    color: color,
    fontWeight: FontWeight.bold,
    fontFamily: FontFamily.inter,
  );

  @override
  TextStyle medium({required Color color, required double fontSize}) =>
      TextStyle(
        fontSize: AppResponsiveness.height(fontSize),
        color: color,
        fontWeight: FontWeight.w500,
        fontFamily: FontFamily.inter,
      );

  @override
  TextStyle regular({required Color color, required double fontSize}) =>
      TextStyle(
        fontSize: AppResponsiveness.height(fontSize),
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.inter,
      );

  @override
  TextStyle semiBold({required Color color, required double fontSize}) =>
      TextStyle(
        fontSize: AppResponsiveness.height(fontSize),
        color: color,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.inter,
      );
}
