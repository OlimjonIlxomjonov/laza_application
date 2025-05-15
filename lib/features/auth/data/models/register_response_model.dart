import 'package:laza_applicaiton/features/auth/domain/entities/register_response.dart';

class RegisterResponseModel extends RegisterResponseUser {
  RegisterResponseModel({required super.userId});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(userId: json['user_id']);
  }

  Map<String, dynamic> toJson() {
    return {'user_id': userId};
  }
}
