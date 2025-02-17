import 'dart:io';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ExitAppUtil {
  static DateTime? currentBackPressTime;

  static void onWillPop() async {
    if (Platform.isAndroid) {
      if (currentBackPressTime == null ||
          DateTime.now().difference(currentBackPressTime!) >
              const Duration(seconds: 2)) {
        currentBackPressTime = DateTime.now();
        Fluttertoast.showToast(
          msg: "뒤로가기 버튼을 한 번 더 누르시면 종료됩니다.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        return;
      }
      SystemNavigator.pop();
    }
  }
}
