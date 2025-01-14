import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = FlutterSecureStorage();

  Future<void> setAccessToken({required String accessToken}) async {
    final bearerAccessToken = 'Bearer $accessToken';
    await _storage.write(key: 'access_token', value: bearerAccessToken);
  }

  Future<String> getAccessToken() async {
    return await _storage.read(key: 'access_token') ?? '';
  }

  Future<void> setRefreshToken({required String refreshToken}) async {
    final bearerRefreshToken = 'Bearer $refreshToken';
    await _storage.write(key: 'refresh_token', value: bearerRefreshToken);
  }

  Future<String> getRefreshToken() async {
    return await _storage.read(key: 'refresh_token') ?? '';
  }
}
