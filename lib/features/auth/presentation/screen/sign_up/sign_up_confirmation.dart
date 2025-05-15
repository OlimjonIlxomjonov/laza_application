import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_applicaiton/core/common/constants/colors/app_colors.dart';
import 'package:laza_applicaiton/core/common/constants/strings/app_strings.dart';
import 'package:laza_applicaiton/core/common/textstyles/app_text_styles.dart';
import 'package:laza_applicaiton/core/common/widgets/app_bar/action_app_bar.dart';
import 'package:laza_applicaiton/core/common/widgets/buttons/bottom_button_wg.dart';
import 'package:laza_applicaiton/core/page_routes/route_generator.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/auth_event.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/confirmation/confirmation_state.dart';
import 'package:laza_applicaiton/features/auth/presentation/screen/forgot_password/pages/forgot_password_page.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../core/utils/responsiveness/app_responsivness.dart';
import '../../bloc/confirmation/confirmation_bloc.dart';

class SignUpConfirmation extends StatefulWidget {
  final int userId;
  final String email;

  const SignUpConfirmation({
    super.key,
    required this.userId,
    required this.email,
  });

  @override
  State<SignUpConfirmation> createState() => _SignUpConfirmationState();
}

class _SignUpConfirmationState extends State<SignUpConfirmation> {
  String _enteredCode = '';
  int _seconds = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _seconds = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          _seconds--;
        });
      }
    });
  }

  void _onResendPressed() {
    _startTimer();
  }

  void _confirmCode() {
    if (_enteredCode.length == 4) {
      context.read<ConfirmationBloc>().add(
        ConfirmationCodeEvent(widget.userId, int.parse(_enteredCode)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter all 4 digits'),
          backgroundColor: Colors.red,
        ),
      );
    }
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
          spacing: appH(70),
          children: [
            Text(
              AppStrings.verificationCode,
              style: AppTextStyles.inter.semiBold(
                color: AppColors.black,
                fontSize: 28,
              ),
            ),
            Image.asset('assets/images/secure_cloud.png'),
            PinCodeTextField(
              length: 4,
              obscureText: false,
              animationType: AnimationType.fade,
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: appH(98),
                fieldWidth: appW(83),
                activeFillColor: Colors.blue.shade100,
                selectedFillColor: Colors.grey.shade50,
                inactiveFillColor: AppColors.white,
                inactiveColor: Colors.grey.shade200,
                selectedColor: AppColors.blue,
                activeColor: Colors.blue,
              ),
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              appContext: context,
              onChanged: (value) {
                setState(() {
                  _enteredCode = value;
                });
              },
            ),
            Spacer(),
            _seconds > 0
                ? RichText(
                  text: TextSpan(
                    style: AppTextStyles.inter.medium(
                      color: AppColors.black,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: '$_seconds ',
                        style: AppTextStyles.inter.medium(
                          color: AppColors.blue,
                          fontSize: 18,
                        ),
                      ),
                      const TextSpan(text: 'resend confirmation code'),
                    ],
                  ),
                )
                : GestureDetector(
                  onTap: () {
                    _onResendPressed();
                  },
                  child: Text(
                    'Resend',
                    style: AppTextStyles.inter.medium(
                      color: AppColors.blue,
                      fontSize: 18,
                    ),
                  ),
                ),
          ],
        ),
      ),
      bottomNavigationBar: BlocConsumer<ConfirmationBloc, ConfirmationState>(
        builder: (context, state) {
          if (state is ConfirmationLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return BottomButtonWg(
              text: 'Confirm Code',
              onPressed: () {
                _confirmCode();
              },
            );
          }
        },
        listener: (context, state) {
          if (state is ConfirmationLoaded) {
            // AppRoute.go(SignUpConfirmation(userId: userId, email: email));
          } else if (state is ConfirmationError) {
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
