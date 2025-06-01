import 'package:flutter/material.dart';
import 'package:laza_applicaiton/core/common/textstyles/app_text_styles.dart';

import '../../../../core/common/constants/colors/app_colors.dart';

class RememberMeSwitch extends StatefulWidget {
  final String text;

  const RememberMeSwitch({super.key, required this.text});

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
            widget.text,
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
