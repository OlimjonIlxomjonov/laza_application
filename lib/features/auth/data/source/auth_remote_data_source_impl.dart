import 'package:laza_applicaiton/core/common/constants/api_urls.dart';
import 'package:laza_applicaiton/core/netwrok/dio_client.dart';
import 'package:laza_applicaiton/features/auth/data/models/auth_tokens_model.dart';
import 'package:laza_applicaiton/features/auth/data/models/register_response_model.dart';
import 'package:laza_applicaiton/features/auth/data/models/reset_password_model.dart';
import 'package:laza_applicaiton/features/auth/data/source/auth_remote_data_source.dart';

import '../../../../core/utils/logger/logger.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient = DioClient();

  @override
  Future<RegisterResponseModel> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioClient.post(
        ApiUrls.register,
        data: {'phone_or_email': email, 'password': password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Registered Successfully: ${response.data}');
        return RegisterResponseModel.fromJson(response.data);
      } else {
        logger.e('Registration Failed: ${response.data}');
        throw Exception('Registration Failed: ${response.data}');
      }
    } catch (e) {
      logger.e('Error while user registration: $e');
      rethrow;
    }
  }

  @override
  Future<AuthTokensModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioClient.post(
        ApiUrls.login,
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success: ${response.data}');
        return AuthTokensModel.fromJson(response.data);
      } else {
        logger.e('Failed: ${response.statusCode}');
        throw Exception('Failed: ${response.statusCode}');
      }
    } catch (e) {
      logger.e("Error occurred while logging in: $e");
      rethrow;
    }
  }

  @override
  Future<AuthTokensModel> confirmationCode({
    required int userId,
    required int code,
  }) async {
    try {
      final response = await dioClient.post(
        ApiUrls.confirmEmail,
        data: {'user_id': userId, 'code': code},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Email confirmation successful: ${response.data}');
        return AuthTokensModel.fromJson(response.data);
      } else {
        logger.e("Email confirmation failed: ${response.statusCode}");
        throw Exception('Email confirmation failed: ${response.statusCode}');
      }
    } catch (e) {
      logger.e('Error during email confirmation: $e');
      rethrow;
    }
  }

  /// RESET PASSWORD
  @override
  Future<ResetPasswordModel> resetPassword({required String message}) async {
    try {
      final response = await dioClient.post(
        ApiUrls.forgotPassword,
        data: {'phone_or_email': message},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Password Reset Success: ${response.statusCode}');
        return ResetPasswordModel.fromJson(response.data);
      } else {
        logger.w('Failed to reset Password: ${response.statusCode}');
        throw Exception('Failed to reset Password: ${response.statusCode}');
      }
    } catch (e) {
      logger.e('Error During password reset: $e');
      rethrow;
    }
  }

  @override
  Future<void> createNewPassword({
    required String password,
    required String token,
  }) async {
    try {
      dioClient.setToken(token);
      final response = await dioClient.post(
        ApiUrls.resetNewPassword,
        data: {'password_one': password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('New password created Successfully: ${response.statusCode}');
      } else {
        logger.w('Failed to create a new password: ${response.statusCode}');
        throw Exception(
          'Failed to create a new Password: ${response.statusCode}',
        );
      }
    } catch (e) {
      logger.e('Error occurred while creating new password: $e');
      rethrow;
    }
  }
}
