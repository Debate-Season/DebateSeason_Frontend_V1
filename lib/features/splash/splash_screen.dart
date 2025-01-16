import 'dart:async';

import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/core/services/secure_storage_service.dart';
import 'package:debateseason_frontend_v1/core/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final int splashDuration = 2;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: splashDuration), () {
      autoLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'assets/images/splash_logo.gif',
          width: 80,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Future<void> autoLogin() async {
    final storage = SecureStorageService();
    final pref = SharedPreferencesService();

    final String accessToken = await storage.getAccessToken();
    final bool profileStatus = pref.getProfileStatus();

    if (accessToken.isNotEmpty) {
      if (profileStatus) {
        Get.offAllNamed(GetRouterName.home);
      } else {
        Get.offAllNamed(GetRouterName.profileInput);
      }
    } else {
      Get.offAllNamed(GetRouterName.auth);
    }
  }
}
