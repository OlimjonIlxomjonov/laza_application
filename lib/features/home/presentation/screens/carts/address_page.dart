import 'package:flutter/material.dart';
import 'package:laza_applicaiton/core/common/constants/colors/app_colors.dart';
import 'package:laza_applicaiton/core/common/textstyles/app_text_styles.dart';
import 'package:laza_applicaiton/core/common/widgets/app_bar/action_app_bar.dart';
import 'package:laza_applicaiton/core/common/widgets/text_field/simple_text_field.dart';
import 'package:laza_applicaiton/core/page_routes/route_generator.dart';
import 'package:laza_applicaiton/features/auth/presentation/widgets/remember_widget.dart';

import '../../../../../core/utils/responsiveness/app_responsivness.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBar(
        text: 'Address',
        onPressed: () {
          AppRoute.close();
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: AppTextStyles.inter.medium(
                color: AppColors.black,
                fontSize: 17,
              ),
            ),
            SizedBox(height: 10),
            SimpleTextField(hintText: 'Mrh Raju', inputType: false),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Country',
                    style: AppTextStyles.inter.medium(
                      color: AppColors.black,
                      fontSize: 17,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'City',
                    style: AppTextStyles.inter.medium(
                      color: AppColors.black,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              spacing: 20,
              children: [
                Expanded(
                  child: SimpleTextField(
                    hintText: 'Bangladesh',
                    inputType: false,
                  ),
                ),
                Expanded(
                  child: SimpleTextField(hintText: 'Sylhet', inputType: false),
                ),
              ],
            ),
            Text(
              'Phone Number',
              style: AppTextStyles.inter.medium(
                color: AppColors.black,
                fontSize: 17,
              ),
            ),
            SizedBox(height: 10),
            SimpleTextField(hintText: '+880 1453-987533', inputType: true),
            Text(
              'Address',
              style: AppTextStyles.inter.medium(
                color: AppColors.black,
                fontSize: 17,
              ),
            ),
            SizedBox(height: 10),
            SimpleTextField(
              hintText: 'Chhatak, Sunamgonj 12/8AB',
              inputType: false,
            ),
            RememberMeSwitch(text: 'Save as primary address'),
          ],
        ),
      ),
    );
  }
}
