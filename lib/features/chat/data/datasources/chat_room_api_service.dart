import 'dart:convert';
import 'package:debateseason_frontend_v1/core/constants/app_constants.dart';
import 'package:http/http.dart' as http;

class ChatRoomApiService {
  Future<Map<String, String>> fetchChatRoomDetails(int chatRoomId) async {
    final response = await http.get(
      Uri.parse("${AppConstants.baseUrl}/api/v1/$chatRoomId"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {
        'title': data['title'],
        'content': data['content'],
      };
    } else {
      throw Exception('Failed to load chat room details');
    }
  }
}
