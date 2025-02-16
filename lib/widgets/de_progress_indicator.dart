import 'dart:io';

import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeProgressIndicator extends StatelessWidget {
  const DeProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return CircularProgressIndicator(
        color: DeColors.brandColor,
      );
    }
    if (Platform.isIOS) {
      return CupertinoActivityIndicator(
        color: DeColors.brandColor,
      );
    } else {
      return CircularProgressIndicator.adaptive();
    }
  }
}
