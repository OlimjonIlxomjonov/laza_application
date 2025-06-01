import 'package:flutter/material.dart';
import 'package:laza_applicaiton/core/common/constants/colors/app_colors.dart';
import 'package:laza_applicaiton/core/common/textstyles/app_text_styles.dart';
import 'package:laza_applicaiton/core/common/widgets/app_bar/action_app_bar.dart';
import 'package:laza_applicaiton/core/page_routes/route_generator.dart';
import 'package:laza_applicaiton/core/utils/responsiveness/app_responsivness.dart';
import 'package:laza_applicaiton/features/home/presentation/screens/reviews/add_review_page.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBar(
        onPressed: () {
          AppRoute.close();
        },
        text: 'Reviews',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                '245 Reviews',
                style: AppTextStyles.inter.medium(
                  color: AppColors.black,
                  fontSize: 15,
                ),
              ),
              subtitle: Text(
                '4.8 ⭐⭐⭐⭐⭐',
                style: AppTextStyles.inter.regular(
                  color: AppColors.black,
                  fontSize: 13,
                ),
              ),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(appW(94), appH(34)),
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Color(0xFFFF7043),
                ),
                onPressed: () {
                  AppRoute.go(AddReviewPage());
                },
                child: Text(
                  'Add Review',
                  style: AppTextStyles.inter.medium(
                    color: AppColors.white,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            SizedBox(height: appH(10)),
            _reviews(),
            _reviews(),
            _reviews(),
            _reviews(),
          ],
        ),
      ),
    );
  }

  Widget _reviews() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Image.asset(
              'assets/images/reviewer.png',
              width: appW(40),
              height: appH(40),
              fit: BoxFit.cover,
            ),
            title: Text('Ronald Richards'),
            subtitle: Text('13 Sep, 2020'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: ' rating',
                        style: AppTextStyles.inter.regular(
                          color: AppColors.grey,
                          fontSize: 11,
                        ),
                      ),
                    ],
                    text: '4.8',
                    style: AppTextStyles.inter.medium(
                      color: AppColors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
                Text('⭐⭐⭐⭐⭐'),
              ],
            ),
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Pellentesque malesuada eget vitae amet...',
            style: AppTextStyles.inter.regular(
              color: AppColors.grey,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
