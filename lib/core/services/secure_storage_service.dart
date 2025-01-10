import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStoreService {
  static final SecureStoreService _instance = SecureStoreService._internal();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  factory SecureStoreService() {
    return _instance;
  }

  SecureStoreService._internal();

  Future<void> getAccessToken() async {
    await _storage.read(key: 'access_token');
  }

  Future<void> setAccessToken({required String accessToken}) async {
    await _storage.write(key: 'access_token', value: accessToken);
  }

  Future<void> getRefreshToken() async {
    await _storage.read(key: 'refresh_token');
  }

  Future<void> setRefreshToken({required String refreshToken}) async {
    await _storage.write(key: 'refresh_token', value: refreshToken);
  }
}
