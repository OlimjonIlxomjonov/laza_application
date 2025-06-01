import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:laza_applicaiton/core/common/constants/colors/app_colors.dart';
import 'package:laza_applicaiton/core/common/textstyles/app_text_styles.dart';
import 'package:laza_applicaiton/core/common/widgets/app_bar/action_app_bar.dart';
import 'package:laza_applicaiton/core/common/widgets/buttons/bottom_button_wg.dart';
import 'package:laza_applicaiton/core/common/widgets/text_field/simple_text_field.dart';
import 'package:laza_applicaiton/core/page_routes/route_generator.dart';
import 'package:laza_applicaiton/core/utils/responsiveness/app_responsivness.dart';
import 'package:laza_applicaiton/features/auth/presentation/widgets/remember_widget.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBar(
        onPressed: () {
          AppRoute.close();
        },
        text: 'Payment',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: appH(200),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                children: [
                  Image.asset(
                    'assets/images/credit-card.png',
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 15),
                  Image.asset(
                    'assets/images/credit-card.png',
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 15),
                  Image.asset(
                    'assets/images/credit-card.png',
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      minimumSize: Size(double.infinity, appH(50)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: AppColors.purple, width: 1),
                      ),
                    ),
                    child: Row(
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(IconlyLight.plus, color: AppColors.purple),
                        Text(
                          'Add new card',
                          style: AppTextStyles.inter.medium(
                            color: AppColors.purple,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Card Owner',
                    style: AppTextStyles.inter.medium(
                      color: AppColors.black,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 10),
                  SimpleTextField(hintText: 'Mrh Raju', inputType: false),
                  Text(
                    'Card Number',
                    style: AppTextStyles.inter.medium(
                      color: AppColors.black,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 10),
                  SimpleTextField(
                    hintText: '5254 7634 8734 7690',
                    inputType: true,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'EXP',
                          style: AppTextStyles.inter.medium(
                            color: AppColors.black,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'CVV',
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
                    spacing: 15,
                    children: [
                      Expanded(
                        child: SimpleTextField(
                          hintText: '24/24',
                          inputType: true,
                        ),
                      ),
                      Expanded(
                        child: SimpleTextField(
                          hintText: '7763',
                          inputType: true,
                        ),
                      ),
                    ],
                  ),
                  RememberMeSwitch(text: 'Save card info'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomButtonWg(text: 'Save Card', onPressed: () {}),
    );
  }
}
