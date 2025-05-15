import 'package:flutter/material.dart';
import 'package:laza_applicaiton/core/common/constants/colors/app_colors.dart';
import 'package:laza_applicaiton/core/common/textstyles/app_text_styles.dart';
import 'package:laza_applicaiton/core/utils/responsiveness/app_responsivness.dart';

class ActionAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? text;
  final VoidCallback onPressed;
  final List<Widget>? actions;

  const ActionAppBar({
    super.key,
    this.text,
    required this.onPressed,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(left: 20),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.white,
          centerTitle: true,
          title: Text(
            text ?? '',
            style: AppTextStyles.inter.semiBold(
              color: AppColors.black,
              fontSize: 17,
            ),
          ),
          leading: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: AppColors.greyBackground,
              padding: EdgeInsets.all(10),
            ),
            icon: Icon(
              Icons.arrow_back,
              size: appH(25),
              color: AppColors.black,
            ),
            onPressed: onPressed,
          ),
          actions: actions,
          actionsPadding: EdgeInsets.only(right: 20),
          flexibleSpace: Container(
            decoration: BoxDecoration(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
