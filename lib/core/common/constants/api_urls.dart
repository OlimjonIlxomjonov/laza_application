abstract class ApiUrls {
  /// AUTH API
  static const authBaseUrl = 'https://manuchehra.pythonanywhere.com/api/';
  static const homeBaseUrl = 'https://fakestoreapi.com/';

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

  /// HOME
  static const String products = 'products/';
  static const String productsCategories = 'products/categories/';
  static const String categories = 'products/category/';
}
