import 'package:flutter/material.dart';
import 'package:laza_applicaiton/core/common/constants/colors/app_colors.dart';
import 'package:laza_applicaiton/core/common/textstyles/app_text_styles.dart';
import 'package:laza_applicaiton/core/common/widgets/app_bar/action_app_bar.dart';
import 'package:laza_applicaiton/core/common/widgets/buttons/bottom_button_wg.dart';
import 'package:laza_applicaiton/core/page_routes/route_generator.dart';
import 'package:laza_applicaiton/core/utils/responsiveness/app_responsivness.dart';

class AddReviewPage extends StatefulWidget {
  const AddReviewPage({super.key});

  @override
  State<AddReviewPage> createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  double _rating = 2.5;
  final TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBar(
        onPressed: () {
          AppRoute.close();
        },
        text: 'Add Review',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
            SizedBox(height: appH(10)),
            Container(
              padding: const EdgeInsets.only(left: 20, top: 5),
              width: double.infinity,
              height: appH(50),
              decoration: BoxDecoration(
                color: AppColors.greyBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type your name',
                ),
              ),
            ),
            SizedBox(height: appH(20)),
            Text(
              'How was your experience ?',
              style: AppTextStyles.inter.medium(
                color: AppColors.black,
                fontSize: 17,
              ),
            ),
            SizedBox(height: appH(10)),
            Container(
              width: double.infinity,
              height: appH(213),
              decoration: BoxDecoration(
                color: AppColors.greyBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: _reviewController,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Describe your experience?',
                ),
              ),
            ),
            SizedBox(height: appH(25)),
            Text(
              'Star',
              style: AppTextStyles.inter.medium(
                color: AppColors.black,
                fontSize: 17,
              ),
            ),
            Row(
              children: [
                const Text("0.0"),
                Expanded(
                  child: Slider(
                    value: _rating,
                    min: 0.0,
                    max: 5.0,
                    divisions: 50,
                    label: _rating.toStringAsFixed(1),
                    onChanged: (value) {
                      setState(() {
                        _rating = value;
                      });
                    },
                    activeColor: Colors.purple,
                    inactiveColor: Colors.purple.shade100,
                  ),
                ),
                const Text("5.0"),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomButtonWg(
        text: 'Submit Review',
        onPressed: () {
          if (_reviewController.text.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Successfully added a review!'),
                backgroundColor: AppColors.green,
              ),
            );
            AppRoute.close();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Fill fields first!'),
                backgroundColor: AppColors.red,
              ),
            );
          }
        },
      ),
    );
  }
}
