import 'package:http/http.dart' as http;
import 'dart:convert';
import '../common/constants/api_urls.dart';

class MyHttpClient {
  static final MyHttpClient _instance = MyHttpClient._internal();
  final http.Client _client;
  final Map<String, String> _headers = {'Content-Type': 'application/json'};

  MyHttpClient._internal() : _client = http.Client();

  factory MyHttpClient() => _instance;

  /// ADD TOKEN
  void setToken(String token) {
    _headers['Authorization'] = 'Bearer $token';
  }

  /// GET
  Future<http.Response> get(
    String path, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final uri = Uri.parse(
        '${ApiUrls.homeBaseUrl}$path',
      ).replace(queryParameters: queryParams);
      return await _client
          .get(uri, headers: _headers)
          .timeout(const Duration(seconds: 30));
    } catch (e) {
      rethrow;
    }
  }

  /// POST
  Future<http.Response> post(String path, {dynamic data}) async {
    try {
      final uri = Uri.parse('${ApiUrls.homeBaseUrl}$path');
      return await _client
          .post(
            uri,
            headers: _headers,
            body: data != null ? jsonEncode(data) : null,
          )
          .timeout(const Duration(seconds: 30));
    } catch (e) {
      rethrow;
    }
  }

  /// DELETE
  Future<http.Response> delete(
    String path, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final uri = Uri.parse(
        '${ApiUrls.homeBaseUrl}$path',
      ).replace(queryParameters: queryParams);
      return await _client
          .delete(uri, headers: _headers)
          .timeout(const Duration(seconds: 30));
    } catch (e) {
      rethrow;
    }
  }
}
