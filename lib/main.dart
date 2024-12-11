import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'core/routers/get_router.dart';

void main() async {
  await dotenv.load(fileName: '.env');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: GetRouterName.login, // 추후 자동로그인 로직 필요.
      getPages: GetRouter.getPages,
    );
  }
}
