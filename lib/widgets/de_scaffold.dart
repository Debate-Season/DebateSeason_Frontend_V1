import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:flutter/material.dart';

class DeScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;

  const DeScaffold({
    super.key,
    this.appBar,
    this.body,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.bottomSheet,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DeGestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: appBar,
          body: body,
          bottomNavigationBar: bottomNavigationBar,
          backgroundColor: backgroundColor ?? grey110,
          bottomSheet: bottomSheet,
        ),
      ),
    );
  }
}
