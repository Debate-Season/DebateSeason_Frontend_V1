import 'dart:io';

import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeProgressIndicator extends StatelessWidget {
  const DeProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return CircularProgressIndicator(
        color: DeColors.brand,
      );
    }
    if (Platform.isIOS) {
      return CupertinoActivityIndicator(
        color: DeColors.brand,
      );
    } else {
      return CircularProgressIndicator.adaptive();
    }
  }
}
