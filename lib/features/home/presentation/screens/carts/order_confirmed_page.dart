import 'package:flutter/material.dart';
import 'package:laza_applicaiton/core/common/constants/colors/app_colors.dart';
import 'package:laza_applicaiton/core/common/textstyles/app_text_styles.dart';
import 'package:laza_applicaiton/core/common/widgets/app_bar/action_app_bar.dart';
import 'package:laza_applicaiton/core/common/widgets/buttons/bottom_button_wg.dart';
import 'package:laza_applicaiton/core/page_routes/route_generator.dart';
import 'package:laza_applicaiton/core/utils/responsiveness/app_responsivness.dart';
import 'package:laza_applicaiton/features/home/presentation/screens/carts/carts_page.dart';
import 'package:laza_applicaiton/features/home/presentation/screens/main_page.dart';

class OrderConfirmedPage extends StatefulWidget {
  const OrderConfirmedPage({super.key});

  @override
  State<OrderConfirmedPage> createState() => _OrderConfirmedPageState();
}

class _OrderConfirmedPageState extends State<OrderConfirmedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // appBar: ActionAppBar(
      //   onPressed: () {
      //     AppRoute.close();
      //   },
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(height: AppResponsiveness.screenHeight / 5),
                  Image.asset(
                    'assets/images/order-confirm.png',
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Order Confirmed!',
                    style: AppTextStyles.inter.semiBold(
                      color: AppColors.black,
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Your order has been confirmed, we will send you confirmation email shortly.',
                    style: AppTextStyles.inter.regular(
                      color: AppColors.grey,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Expanded(child: Container()),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, appH(50)),
                  shadowColor: Colors.transparent,
                  backgroundColor: AppColors.greyBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Go to Orders',
                  style: AppTextStyles.inter.medium(
                    color: AppColors.grey,
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomButtonWg(
        text: 'Continue Shopping',
        onPressed: () {
          AppRoute.go(MainPage());
        },
      ),
    );
  }
}
