import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'core/constants/color.dart';
import 'core/routers/get_router.dart';
import 'features/chat/data/models/debate_room.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await dotenv.load(fileName: '.env');

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: grey110,
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(const MyApp());

  ///////// 디버그용 더미 데이터
  final DebateRoom testRoom = DebateRoom(
    title: 'AI와 인간의 미래',
    content: 'AI가 인간의 삶에 미치는 영향을 논의합니다.',
  );

  Get.toNamed(
    GetRouterName.debate,
    arguments: testRoom,
  );
  /////////
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: GetRouterName.debate, // 추후 자동로그인 로직 필요.
      getPages: GetRouter.getPages,
    );
  }
}
