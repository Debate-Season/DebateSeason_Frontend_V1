import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:flutter/material.dart';

class ChatBottomSheet extends StatelessWidget {
  final Widget widget;

  const ChatBottomSheet({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return DeGestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 16),
        decoration: BoxDecoration(
          color: grey80,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: _widgetGrabber(),
            ),
            Gaps.v16,
            Row(
              children: [],
            ),
            Gaps.v16,
            widget,
          ],
        ),
      ),
    );
  }

  Widget _widgetGrabber() {
    return Container(
      width: 40,
      height: 5,
      margin: Dimensions.all8,
      decoration: BoxDecoration(
        color: grey50,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
