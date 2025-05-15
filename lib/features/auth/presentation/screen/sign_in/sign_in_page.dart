import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_applicaiton/core/common/constants/strings/app_strings.dart';
import 'package:laza_applicaiton/core/common/textstyles/app_text_styles.dart';
import 'package:laza_applicaiton/core/common/widgets/app_bar/action_app_bar.dart';
import 'package:laza_applicaiton/core/common/widgets/buttons/bottom_button_wg.dart';
import 'package:laza_applicaiton/core/page_routes/route_generator.dart';
import 'package:laza_applicaiton/core/utils/responsiveness/app_responsivness.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/auth_event.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/sign_in/sign_in_state.dart';
import 'package:laza_applicaiton/features/auth/presentation/screen/forgot_password/pages/forgot_password_page.dart';
import 'package:laza_applicaiton/features/auth/presentation/widgets/remember_widget.dart';
import 'package:laza_applicaiton/features/home/presentation/creens/home_page.dart';
import '../../../../../core/common/constants/colors/app_colors.dart';
import '../../../../../core/common/widgets/text_field/validated_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void logInUser() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill in all fields"),
          backgroundColor: AppColors.red,
        ),
      );
      return;
    }
    BlocProvider.of<SignInBloc>(context).add(SignInEvent(email, password));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBar(
        onPressed: () {
          AppRoute.close();
        },
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  AppStrings.welcome,
                  style: AppTextStyles.inter.semiBold(
                    color: AppColors.black,
                    fontSize: 28,
                  ),
                ),
                Text(
                  AppStrings.pleaseEnter,
                  style: AppTextStyles.inter.regular(
                    color: AppColors.grey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ValidatedTextField(
                  fieldType: FieldType.email,
                  label: "Email Address",
                  controller: _emailController,
                ),
                ValidatedTextField(
                  fieldType: FieldType.password,
                  label: "Password",
                  controller: _passwordController,
                ),
                SizedBox(height: appH(10)),
                TextButton(
                  child: Text(
                    AppStrings.forgotPassword,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.inter.regular(
                      color: AppColors.red,
                      fontSize: 15,
                    ),
                  ),
                  onPressed: () {
                    AppRoute.go(ForgotPasswordPage());
                  },
                ),
                RememberMeSwitch(),
              ],
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: AppTextStyles.inter.regular(
                  color: AppColors.grey,
                  fontSize: 15,
                ),
                text: AppStrings.byConnectingUrAccount,
                children: [
                  TextSpan(
                    // recognizer:
                    //     TapGestureRecognizer()
                    //       ..onTap = () {
                    //         AppRoute.go(SignInPage());
                    //       },
                    text: ' ${AppStrings.termAndConditions}',
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
      bottomNavigationBar: BlocConsumer<SignInBloc, SignInState>(
        builder: (context, state) {
          if (state is SignInLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return BottomButtonWg(text: 'Login', onPressed: logInUser);
          }
        },
        listener: (context, state) {
          if (state is SignInLoaded) {
            AppRoute.go(HomePage());
          } else if (state is SignInError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.red,
              ),
            );
          }
        },
      ),
    );
  }
}
