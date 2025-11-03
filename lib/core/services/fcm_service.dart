import 'dart:io';
import 'package:debateseason_frontend_v1/core/services/shared_preferences_service.dart';
import 'package:debateseason_frontend_v1/features/notification/domain/entities/fcm_token_entity.dart';
import 'package:debateseason_frontend_v1/features/notification/domain/repositories/fcm_token_repository.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class FcmService {
  static final FcmService _instance = FcmService._internal();

  late final FirebaseMessaging _messaging;
  late final SharedPreferencesService _prefs;
  late final FcmTokenRepository _repository;

  String? _currentToken;
  String? _currentDeviceId;

  factory FcmService() => _instance;

  FcmService._internal();

  Future<void> initialize() async {
    _messaging = FirebaseMessaging.instance;
    _prefs = SharedPreferencesService();
    _repository = Get.find<FcmTokenRepository>();

    await _requestPermission();
    await _initializeDeviceId();
    await _setupTokenRefreshListener();
  }

  Future<void> _requestPermission() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    log.d('FCM Permission status: ${settings.authorizationStatus}');
  }

  Future<void> _initializeDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      _currentDeviceId = androidInfo.id; // Android ID
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      _currentDeviceId = iosInfo.identifierForVendor; // iOS IDFV
    }

    log.d('Device ID: $_currentDeviceId');
  }

  Future<void> _setupTokenRefreshListener() async {
    // 토큰이 변경될 때마다 호출됨
    _messaging.onTokenRefresh.listen((newToken) async {
      log.d('FCM Token refreshed: $newToken');

      if (_currentToken != newToken) {
        final oldToken = _currentToken;
        _currentToken = newToken;

        // 이전 토큰과 다르면 PUT 요청
        if (oldToken != null) {
          await _updateFcmToken();
        }
      }
    });
  }

  Future<void> registerFcmToken() async {
    try {
      _currentToken = await _messaging.getToken();

      if (_currentToken != null && _currentDeviceId != null) {
        // 토큰이 변경되었는지 확인
        if (!await _shouldUpdateToken()) {
          log.d('FCM Token already up to date');
          return;
        }

        log.d('Registering FCM Token: $_currentToken');

        final result = await _repository.postFcmToken(
          entity: FcmTokenEntity(
            fcmToken: _currentToken!,
            deviceId: _currentDeviceId!,
            deviceType: Platform.isAndroid ? 'android' : 'ios',
          ),
        );

        result.when(
          loading: () {},
          success: (_) async {
            // 등록 성공 시 로컬에 저장
            await _saveTokenToLocal();
            log.d('FCM Token registered successfully');
          },
          failure: (message) {
            log.e('FCM Token registration failed: $message');
          },
        );
      }
    } catch (e) {
      log.e('FCM Token registration error: $e');
    }
  }

  Future<void> _updateFcmToken() async {
    try {
      if (_currentToken != null && _currentDeviceId != null) {
        log.d('Updating FCM Token: $_currentToken');

        final result = await _repository.putFcmToken(
          entity: FcmTokenEntity(
            fcmToken: _currentToken!,
            deviceId: _currentDeviceId!,
            deviceType: Platform.isAndroid ? 'android' : 'ios',
          ),
        );

        result.when(
          loading: () {},
          success: (_) async {
            await _saveTokenToLocal();
            log.d('FCM Token updated successfully');
          },
          failure: (message) {
            log.e('FCM Token update failed: $message');
          },
        );
      }
    } catch (e) {
      log.e('FCM Token update error: $e');
    }
  }

  Future<void> _saveTokenToLocal() async {
    if (_currentToken != null && _currentDeviceId != null) {
      await _prefs.setString('last_fcm_token', _currentToken!);
      await _prefs.setString('last_device_id', _currentDeviceId!);
    }
  }

  Future<bool> _shouldUpdateToken() async {
    final lastToken = _prefs.getString('last_fcm_token');
    final lastDeviceId = _prefs.getString('last_device_id');

    return lastToken != _currentToken || lastDeviceId != _currentDeviceId;
  }

  // 백그라운드 메시지 핸들링을 위한 메서드들 (나중에 확장 가능)
  void setupForegroundMessageHandler() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log.d('Foreground message received: ${message.notification?.title}');
      // 포그라운드에서 알림 처리
    });
  }

  void setupBackgroundMessageHandler() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log.d('Background message opened app: ${message.notification?.title}');
      // 백그라운드에서 알림 탭 처리
    });
  }
}
