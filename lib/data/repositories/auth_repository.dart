import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:debateseason_frontend_v1/core/constants/app_constants.dart';

class AuthRepository {
  Future<bool> login(String username, String password) async {
    final url = Uri.parse("${AppConstants.baseUrl}/auth/login");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"username": username, "password": password}),
      );

      if (response.statusCode == 200) {
        return true; // 로그인 성공
      } else {
        return false; // 로그인 실패
      }
    } catch (e) {
      return false; // 네트워크 또는 기타 오류
    }
  }
}
