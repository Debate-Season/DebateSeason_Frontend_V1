import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeBottomSheet extends StatelessWidget {
  final String titleText;
  final Widget widget;

  const DeBottomSheet(
    this.titleText, {
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
            Gaps.v16,
            Row(
              children: [
                Expanded(
                  child: DeText(
                    titleText,
                    style: DeFonts.title,
                  ),
                ),
                DeGestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: Dimensions.all10,
                    child: SvgPicture.asset(
                      'assets/icons/ic_x_grey50.svg',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ],
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
        color: DeColors.grey50,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
