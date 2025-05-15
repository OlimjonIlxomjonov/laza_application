import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_applicaiton/core/common/constants/strings/app_strings.dart';
import 'package:laza_applicaiton/core/common/textstyles/app_text_styles.dart';
import 'package:laza_applicaiton/core/common/widgets/app_bar/action_app_bar.dart';
import 'package:laza_applicaiton/core/common/widgets/buttons/bottom_button_wg.dart';
import 'package:laza_applicaiton/core/page_routes/route_generator.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/auth_event.dart';
import 'package:laza_applicaiton/features/auth/presentation/screen/sign_up/sign_up_confirmation.dart';
import 'package:laza_applicaiton/features/auth/presentation/widgets/remember_widget.dart';

import '../../../../../core/common/constants/colors/app_colors.dart';
import '../../../../../core/common/widgets/text_field/validated_text_field.dart';
import '../../bloc/sign_up/sign_up_bloc.dart';
import '../../bloc/sign_up/sign_up_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void registerUser() {
    final emailOrPhone = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (emailOrPhone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter your email or phone number."),
          backgroundColor: AppColors.red,
        ),
      );
      return;
    }
    if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter your password."),
          backgroundColor: AppColors.red,
        ),
      );
      return;
    }

    context.read<SignUpBloc>().add(SignUpEvent(emailOrPhone, password));
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
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.signUP,
              style: AppTextStyles.inter.semiBold(
                color: AppColors.black,
                fontSize: 28,
              ),
            ),
            Column(
              children: [
                ValidatedTextField(
                  fieldType: FieldType.username,
                  label: "Username",
                  controller: _usernameController,
                ),
                ValidatedTextField(
                  fieldType: FieldType.password,
                  label: "Password",
                  controller: _passwordController,
                ),
                ValidatedTextField(
                  fieldType: FieldType.email,
                  label: "Email Address",
                  controller: _emailController,
                ),
                RememberMeSwitch(),
              ],
            ),
            SizedBox(),
          ],
        ),
      ),
      bottomNavigationBar: BlocConsumer<SignUpBloc, SignUpState>(
        builder: (context, state) {
          if (state is SignUpLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return BottomButtonWg(
              text: 'Sign Up',
              onPressed: () {
                registerUser();
              },
            );
          }
        },
        listener: (context, state) {
          if (state is SignUpLoaded) {
            AppRoute.go(
              SignUpConfirmation(
                userId: state.user.userId,
                email: _emailController.text,
              ),
            );
          } else if (state is SignUpError) {
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
