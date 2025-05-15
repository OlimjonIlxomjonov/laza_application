import 'package:flutter/cupertino.dart';

double appH(double number) => AppResponsiveness.height(number);

double appW(double number) => AppResponsiveness.width(number);

class AppResponsiveness {
  static late double screenHeight;
  static late double screenWidth;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
  }

  static double height(double number) => (number / 812) * screenHeight;

  static double width(double number) => (number / 375) * screenWidth;
}
