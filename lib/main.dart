import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/core/services/pip_controller.dart';
import 'package:debateseason_frontend_v1/core/services/shared_preferences_service.dart';
import 'package:debateseason_frontend_v1/features/main/pip_overlay.dart';
import 'package:debateseason_frontend_v1/features/splash/bindings/splash_binding.dart';
import 'package:debateseason_frontend_v1/widgets/de_pip.dart';
import 'package:firebase_core/firebase_core.dart';
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
  if (kDebugMode) {
    await dotenv.load(fileName: '.env.dev');
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
      builder: (context, widget) {
        // 시스템 폰트 영향 제거
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(1.0)),
          child: Stack(
            children: [
              widget!,
              const PipOverlay(),
            ],
          ),
        );
      },
    );
  }
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
