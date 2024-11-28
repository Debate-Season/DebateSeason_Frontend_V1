// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:debateseason_frontend_v1/core/constants/app_constants.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class AuthRepository {
//   final FlutterSecureStorage _storage = FlutterSecureStorage();

//   // 로그인 요청
//   Future<bool> login(String username, String password) async {
//     final url = Uri.parse("${AppConstants.baseUrl}/auth/login");

//     try {
//       final response = await http.post(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({"username": username, "password": password}),
//       );

//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//         final accessToken = jsonResponse['accessToken'];
//         final refreshToken = jsonResponse['refreshToken'];

//         // 토큰 저장
//         await _storage.write(key: 'accessToken', value: accessToken);
//         await _storage.write(key: 'refreshToken', value: refreshToken);

//         return true; // 로그인 성공
//       } else {
//         return false; // 로그인 실패
//       }
//     } catch (e) {
//       return false; // 네트워크 또는 기타 오류
//     }
//   }

//   // Access Token 갱신
//   Future<bool> refreshAccessToken() async {
//     final url = Uri.parse("${AppConstants.baseUrl}/auth/refresh");
//     final refreshToken = await _storage.read(key: 'refreshToken');

//     if (refreshToken == null) {
//       return false; // Refresh Token이 없는 경우
//     }

//     try {
//       final response = await http.post(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({"refreshToken": refreshToken}),
//       );

//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//         final newAccessToken = jsonResponse['accessToken'];

//         // 새로운 Access Token 저장
//         await _storage.write(key: 'accessToken', value: newAccessToken);
//         return true; // 토큰 갱신 성공
//       } else {
//         return false; // 갱신 실패
//       }
//     } catch (e) {
//       return false; // 네트워크 또는 기타 오류
//     }
//   }

//   // 인증된 API 요청
//   Future<http.Response?> authenticatedRequest(
//       Uri url, Map<String, String> headers) async {
//     String? accessToken = await _storage.read(key: 'accessToken');

//     if (accessToken == null) {
//       return null; // Access Token이 없는 경우
//     }

//     try {
//       // API 요청
//       final response = await http.get(
//         url,
//         headers: {
//           ...headers,
//           "Authorization": "Bearer $accessToken",
//         },
//       );

//       // Access Token 만료 처리
//       if (response.statusCode == 401) {
//         final refreshed = await refreshAccessToken();

//         if (refreshed) {
//           // 갱신된 토큰으로 재요청
//           accessToken = await _storage.read(key: 'accessToken');
//           return await http.get(
//             url,
//             headers: {
//               ...headers,
//               "Authorization": "Bearer $accessToken",
//             },
//           );
//         } else {
//           return null; // 갱신 실패
//         }
//       }

//       return response; // 요청 성공
//     } catch (e) {
//       return null; // 네트워크 오류
//     }
//   }

//   // 로그아웃
//   Future<void> logout() async {
//     await _storage.delete(key: 'accessToken');
//     await _storage.delete(key: 'refreshToken');
//   }
// }
