import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:laza_applicaiton/core/common/constants/strings/app_strings.dart';
import 'package:laza_applicaiton/core/common/textstyles/app_text_styles.dart';
import 'package:laza_applicaiton/core/common/widgets/app_bar/action_app_bar.dart';
import 'package:laza_applicaiton/core/common/widgets/buttons/bottom_button_wg.dart';
import 'package:laza_applicaiton/core/page_routes/route_generator.dart';
import 'package:laza_applicaiton/core/utils/responsiveness/app_responsivness.dart';
import 'package:laza_applicaiton/features/auth/presentation/screen/onboarding/on_boarding_page.dart';
import 'package:laza_applicaiton/features/auth/presentation/screen/sign_in/sign_in_page.dart';
import 'package:laza_applicaiton/features/auth/presentation/screen/sign_up/sign_up_page.dart';
import 'package:laza_applicaiton/features/home/presentation/screens/products/home_page.dart';
import 'package:laza_applicaiton/features/home/presentation/screens/main_page.dart';

import '../../../../core/common/constants/colors/app_colors.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBar(
        onPressed: () {
          AppRoute.go(OnBoardingPage());
        },
        actions: [
          IconButton(
            onPressed: () {
              AppRoute.go(MainPage());
            },
            icon: Icon(Icons.skip_next),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                AppStrings.letsGetStarted,
                style: AppTextStyles.inter.semiBold(
                  color: AppColors.black,
                  fontSize: 28,
                ),
              ),
            ),
            Column(
              spacing: 10,
              children: [
                _continueButtons(
                  'assets/images/facebook.png',
                  'Facebook',
                  () {},
                  AppColors.indigo,
                ),
                _continueButtons(
                  'assets/images/twitter.png',
                  'Google',
                  () {},
                  AppColors.blue,
                ),
                _continueButtons(
                  'assets/images/google.png',
                  'Google',
                  () {},
                  AppColors.deepOrange,
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                style: AppTextStyles.inter.regular(
                  color: AppColors.grey,
                  fontSize: 15,
                ),
                text: AppStrings.alreadyHaveAccount,
                children: [
                  TextSpan(
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            AppRoute.go(SignInPage());
                          },
                    text: ' Signin',
                    style: AppTextStyles.inter.medium(
                      color: AppColors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomButtonWg(
        text: 'Create an Account',
        onPressed: () {
          AppRoute.go(SignUpPage());
        },
      ),
    );
  }
}

Widget _continueButtons(
  String myIcons,
  text,
  VoidCallback onPressed,
  Color color,
) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      minimumSize: Size(appW(335), appH(50)),
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    onPressed: onPressed,
    child: Row(
      spacing: 5,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(myIcons),
        Text(
          text,
          style: AppTextStyles.inter.semiBold(
            color: AppColors.white,
            fontSize: 17,
          ),
        ),
      ],
    ),
  );
}
