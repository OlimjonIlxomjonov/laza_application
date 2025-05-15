abstract class ApiUrls {
  /// AUTH API
  static const authBaseUrl = 'https://manuchehra.pythonanywhere.com/api/';

  /// AUTH
  static const String auth = 'auth/';
  static const String register = '${auth}register/';
  static const String login = '${auth}login/';
  static const String forgotPassword = '${auth}reset-password/';
  static const String resetPasswordConfirm =
      '${auth}reset-password/confirm-code';
  static const String resetNewPassword =
      '${auth}reset-password/confirm-password/';
  static const String confirmEmail = '${auth}confirm-email/';
}
