import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:flutter/material.dart';

class DeBottomSheetNoTitle extends StatelessWidget {
  final Widget widget;

  const DeBottomSheetNoTitle({
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
          color: DeColors.grey80,
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
            DeGaps.v16,
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
      margin: DeDimensions.all8,
      decoration: BoxDecoration(
        color: DeColors.grey50,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
