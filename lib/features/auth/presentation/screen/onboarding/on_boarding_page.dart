import 'package:flutter/material.dart';
import 'package:laza_applicaiton/core/common/constants/colors/app_colors.dart';
import 'package:laza_applicaiton/core/common/constants/strings/app_strings.dart';
import 'package:laza_applicaiton/core/common/textstyles/app_text_styles.dart';
import 'package:laza_applicaiton/core/page_routes/route_generator.dart';
import 'package:laza_applicaiton/core/utils/responsiveness/app_responsivness.dart';
import 'package:laza_applicaiton/features/auth/presentation/screen/auth_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundNText,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/onboarding_image.png'),
              ),
            ),
          ),
          Positioned(
            bottom: appH(15),
            left: appH(15),
            right: appH(15),
            child: Container(
              width: appH(345),
              height: appH(244),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                child: Column(
                  spacing: 15,
                  children: [
                    Text(
                      AppStrings.lookGood,
                      style: AppTextStyles.inter.semiBold(
                        color: AppColors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      AppStrings.createYourIndividual,
                      style: AppTextStyles.inter.regular(
                        color: AppColors.grey,
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        _customGenderButton('Men'),
                        _customGenderButton('Women'),
                      ],
                    ),
                    TextButton(
                      child: Text(
                        'Skip',
                        style: AppTextStyles.inter.semiBold(
                          color: AppColors.grey,
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () {
                        AppRoute.go(AuthPage());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _customGenderButton(String gender) {
    final bool isSelected = selectedGender == gender;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        backgroundColor:
            isSelected ? AppColors.backgroundNText : AppColors.greyBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: Size(appW(152), appH(60)),
      ),
      onPressed: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Text(
        gender,
        style: AppTextStyles.inter.medium(
          color: isSelected ? AppColors.white : AppColors.grey,
          fontSize: 17,
        ),
      ),
    );
  }
}
