import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_applicaiton/core/common/constants/strings/app_strings.dart';
import 'package:laza_applicaiton/core/common/textstyles/app_text_styles.dart';
import 'package:laza_applicaiton/core/common/widgets/app_bar/action_app_bar.dart';
import 'package:laza_applicaiton/core/common/widgets/buttons/bottom_button_wg.dart';
import 'package:laza_applicaiton/core/common/widgets/text_field/validated_text_field.dart';
import 'package:laza_applicaiton/core/page_routes/route_generator.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/auth_event.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/create_new_password/create_new_password_bloc.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/create_new_password/create_new_password_state.dart';
import 'package:laza_applicaiton/features/auth/presentation/screen/auth_page.dart';

import '../../../../../../core/common/constants/colors/app_colors.dart';

class NewPasswordPage extends StatefulWidget {
  final String token;

  const NewPasswordPage({super.key, required this.token});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void newPassword() {
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    if (password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please Fill all blanks!'),
          backgroundColor: AppColors.red,
        ),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Passwords are not matching!'),
          backgroundColor: AppColors.red,
        ),
      );
      return;
    }

    BlocProvider.of<CreateNewPasswordBloc>(
      context,
    ).add(CreateNewPasswordEvent(password, widget.token));
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
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.newPassword,
              style: AppTextStyles.inter.semiBold(
                color: AppColors.black,
                fontSize: 28,
              ),
            ),
            Column(
              children: [
                ValidatedTextField(
                  fieldType: FieldType.password,
                  label: 'Password',
                  controller: _passwordController,
                ),
                ValidatedTextField(
                  fieldType: FieldType.password,
                  label: 'Confirm Password',
                  controller: _confirmPasswordController,
                ),
              ],
            ),
            Text(
              AppStrings.pleaseWriteNewPassword,
              style: AppTextStyles.inter.regular(
                color: AppColors.grey,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          BlocConsumer<CreateNewPasswordBloc, CreateNewPasswordState>(
            builder: (context, state) {
              if (state is CreateNewPasswordLoading) {
                return Center(child: CircularProgressIndicator());
              } else {
                return BottomButtonWg(
                  text: 'Reset Password',
                  onPressed: newPassword,
                );
              }
            },
            listener: (context, state) {
              if (state is CreateNewPasswordLoaded) {
                AppRoute.go(AuthPage());
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Successfully changed!'),
                    backgroundColor: AppColors.green,
                  ),
                );
              } else if (state is CreateNewPasswordError) {
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
