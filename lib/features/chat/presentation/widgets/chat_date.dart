import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';

class ChatDateLine extends StatelessWidget {
  const ChatDateLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gaps.v32,
        _date(),
        Gaps.v32,
      ],
    );
  }

  Widget _date() {
    return Container(
      padding: Dimensions.padding12x4,
      decoration:BoxDecoration(
        color: grey90,
        borderRadius: BorderRadius.circular(20.0)  
      ),
      child: DeText('오늘', style: cation12R.copyWith(color: grey50),),
    );
  }
}
