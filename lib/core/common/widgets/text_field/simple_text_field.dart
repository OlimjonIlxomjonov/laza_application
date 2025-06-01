import 'package:flutter/material.dart';

import '../../../utils/responsiveness/app_responsivness.dart';
import '../../constants/colors/app_colors.dart';

class SimpleTextField extends StatelessWidget {
  final String hintText;
  final bool inputType;

  const SimpleTextField({
    super.key,
    required this.hintText,
    required this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 5),
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: appH(50),
      decoration: BoxDecoration(
        color: AppColors.greyBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        keyboardType: inputType ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
