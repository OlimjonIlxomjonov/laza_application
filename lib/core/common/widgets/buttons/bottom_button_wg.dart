import 'package:flutter/material.dart';

import '../../../utils/responsiveness/app_responsivness.dart';
import '../../constants/colors/app_colors.dart';
import '../../textstyles/app_text_styles.dart';

class BottomButtonWg extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BottomButtonWg({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(top: 15),
        color: AppColors.backgroundNText,
        width: double.infinity,
        height: appH(75),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppTextStyles.inter.medium(
            color: AppColors.white,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
