import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static final SecureStorageService _instance =
      SecureStorageService._internal();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  factory SecureStorageService() {
    return _instance;
  }

  SecureStorageService._internal();

  Future<void> setAccessToken({required String accessToken}) async {
    await _storage.write(key: 'access_token', value: 'Bearer $accessToken');
  }

  Future<String> getAccessToken() async => _read('access_token');

  Future<void> setRefreshToken({required String refreshToken}) async {
    await _storage.write(key: 'refresh_token', value: refreshToken);
  }

  Future<String> getRefreshToken() async => _read('refresh_token');

  Future<void> clear() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      log.e('보안 저장소 초기화 실패: $e');
    }
  }

  // KeyStore/Keychain 키가 무효화되면 read가 예외를 던진다. 이때 예외를 그대로
  // 올리면 호출부가 스플래시·인터셉터에서 그대로 멈추므로 빈 값으로 낮춘다.
  Future<String> _read(String key) async {
    try {
      return await _storage.read(key: key) ?? '';
    } catch (e) {
      log.e('보안 저장소 읽기 실패($key), 빈 값으로 처리: $e');
      return '';
    }
  }
}
