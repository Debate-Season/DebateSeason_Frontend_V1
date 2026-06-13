// filename: lib/utils/jwt_util.dart
import 'dart:convert';

import 'package:debateseason_frontend_v1/utils/logger.dart';

class JwtUtil {
  const JwtUtil._();

  // 디코딩 가능한 JWT이고 exp가 현재 시각 이전일 때만 true.
  // Bearer 접두사/형식 오류/디코드 실패 시에는 만료를 단정할 수 없어 false.
  static bool isExpired(String token) {
    final exp = _readExp(token);
    if (exp == null) {
      return false;
    }
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    return exp <= now;
  }

  static int? _readExp(String token) {
    try {
      final raw = token.startsWith('Bearer ') ? token.substring(7) : token;
      final parts = raw.split('.');
      if (parts.length != 3) {
        return null;
      }
      final payload = utf8.decode(base64Url.decode(base64Url.normalize(parts[1])));
      final map = jsonDecode(payload) as Map<String, dynamic>;
      return map['exp'] as int?;
    } catch (e) {
      log.d('JWT decode 실패: $e');
      return null;
    }
  }
}
