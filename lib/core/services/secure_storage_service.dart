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
    await _storage.write(key: 'access_token', value: accessToken);
  }

  Future<String> getAccessToken() async {
    return await _storage.read(key: 'access_token') ?? '';
  }

  Future<void> setRefreshToken({required String refreshToken}) async {
    await _storage.write(key: 'refresh_token', value: refreshToken);
  }

  Future<String> getRefreshToken() async {
    return await _storage.read(key: 'refresh_token') ?? '';
  }
}
