import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_applicaiton/core/common/constants/strings/app_strings.dart';
import 'package:laza_applicaiton/core/common/textstyles/app_text_styles.dart';
import 'package:laza_applicaiton/core/common/widgets/app_bar/action_app_bar.dart';
import 'package:laza_applicaiton/core/common/widgets/buttons/bottom_button_wg.dart';
import 'package:laza_applicaiton/core/common/widgets/text_field/validated_text_field.dart';
import 'package:laza_applicaiton/core/page_routes/route_generator.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/auth_event.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/reset_password/reset_password_bloc.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/reset_password/reset_password_state.dart';
import 'package:laza_applicaiton/features/auth/presentation/screen/forgot_password/pages/pin_page.dart';
import '../../../../../../core/common/constants/colors/app_colors.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  void _resetPassword() {
    String email = _emailController.text.trim();
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter your email"),
          backgroundColor: AppColors.red,
        ),
      );
      return;
    }
    BlocProvider.of<ResetPasswordBloc>(context).add(ResetPasswordEvent(email));
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
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Forgot Password',
              style: AppTextStyles.inter.semiBold(
                color: AppColors.black,
                fontSize: 28,
              ),
            ),
            Image.asset('assets/images/secure_cloud.png'),
            ValidatedTextField(
              fieldType: FieldType.email,
              label: 'Email Address',
              controller: _emailController,
            ),
            SizedBox(),
            Text(
              AppStrings.pleaseWriteUrEmail,
              textAlign: TextAlign.center,
              style: AppTextStyles.inter.regular(
                color: AppColors.grey,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
        builder: (context, state) {
          if (state is ResetPasswordLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return BottomButtonWg(
              text: 'Confirm Mail',
              onPressed: _resetPassword,
            );
          }
        },
        listener: (context, state) {
          if (state is ResetPasswordLoaded) {
            AppRoute.go(
              PinPage(
                userId: state.resetPassword.userId,
                email: _emailController.text,
              ),
            );
          } else if (state is ResetPasswordError) {
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
