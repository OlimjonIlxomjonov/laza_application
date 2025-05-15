import 'package:laza_applicaiton/features/auth/domain/entities/reset_password.dart';

class ResetPasswordModel extends ResetPassword {
  ResetPasswordModel({required super.userId, required super.message});

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordModel(
      userId: json['user_id'],
      message: json['message'],
    );
  }
}
