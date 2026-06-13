import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/core/services/pip_controller.dart';
import 'package:debateseason_frontend_v1/core/services/secure_storage_service.dart';
import 'package:debateseason_frontend_v1/core/services/shared_preferences_service.dart';
import 'package:debateseason_frontend_v1/features/splash/bindings/splash_binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'core/constants/de_colors.dart';
import 'core/routers/get_router.dart';
import 'utils/amplitude_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final prefsService = SharedPreferencesService();
  await prefsService.init();
  await _reconcileStaleSecureStorage(prefsService);
  if (kDebugMode) {
    final envFile = Platform.isAndroid ? '.env.dev.android' : '.env.dev.ios';
    await dotenv.load(fileName: envFile);
  } else {
    await dotenv.load(fileName: '.env.prod');
    AmplitudeUtil.init();
  }

  _initUiSettings();

  Get.put(PipController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: SplashBinding(),
      initialRoute: GetRouterName.splash,
      getPages: GetRouter.getPages,
      theme: ThemeData.light(),
      builder: (context, child) {
        final mq = MediaQuery.of(context);
        return MediaQuery(
          data: mq.copyWith(textScaler: TextScaler.linear(1.0)),
          child: child!,
        );

      },
    );
  }
}

// iOS Keychain은 앱 삭제 후에도 토큰을 보존한다. SharedPreferences는 삭제되므로
// 첫 실행 플래그가 없고 기존 로그인 흔적(social_type)도 없으면 재설치로 보고
// 잔존 토큰을 제거해, stale 토큰으로 인증 화면을 건너뛰는 문제를 막는다.
Future<void> _reconcileStaleSecureStorage(
  SharedPreferencesService prefs,
) async {
  if (prefs.getBool('app_initialized')) {
    return;
  }
  await prefs.setBool('app_initialized', true);
  if (prefs.getSocialType().isNotEmpty) {
    return;
  }
  await SecureStorageService().clear();
}

void _initUiSettings() {
  // 시스템 상태바 색상 변경
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: DeColors.grey120,
    statusBarIconBrightness: Brightness.light,
  ));

  // 세로 방향 고정
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
