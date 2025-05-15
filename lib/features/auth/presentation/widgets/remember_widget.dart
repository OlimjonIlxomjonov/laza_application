import 'package:flutter/material.dart';
import 'package:laza_applicaiton/core/common/constants/strings/app_strings.dart';
import 'package:laza_applicaiton/core/common/textstyles/app_text_styles.dart';

import '../../../../core/common/constants/colors/app_colors.dart';

class RememberMeSwitch extends StatefulWidget {
  const RememberMeSwitch({super.key});

  @override
  State<RememberMeSwitch> createState() => _RememberMeSwitchState();
}

class _RememberMeSwitchState extends State<RememberMeSwitch> {
  bool isRemembered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.rememberMe,
            style: AppTextStyles.inter.medium(
              color: AppColors.black,
              fontSize: 13,
            ),
          ),
          Transform.scale(
            scale: 0.8, // Makes the switch smaller
            child: Switch(
              value: isRemembered,
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveTrackColor: Colors.grey.shade300,
              inactiveThumbColor: Colors.white,
              onChanged: (value) {
                setState(() => isRemembered = value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
