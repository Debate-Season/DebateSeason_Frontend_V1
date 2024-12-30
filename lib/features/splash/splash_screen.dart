import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';

import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int splashDuration = 3; // 예: 3초

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: splashDuration), () {
      Get.offNamed(GetRouterName.auth); // GetRouterName.auth 라우트로 이동
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // 배경색 설정
      body: Center(
        child: Image.asset(
          'assets/images/splash_logo.gif',
          width: 80,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
