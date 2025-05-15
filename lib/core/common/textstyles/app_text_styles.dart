import 'package:flutter/material.dart';

import 'inter_text_style.dart';

abstract class AppTextStyles {
  static final InterTextStyle inter = InterTextStyle();

  TextStyle bold({required Color color, required double fontSize});

  TextStyle semiBold({required Color color, required double fontSize});

  TextStyle medium({required Color color, required double fontSize});

  TextStyle regular({required Color color, required double fontSize});
}
