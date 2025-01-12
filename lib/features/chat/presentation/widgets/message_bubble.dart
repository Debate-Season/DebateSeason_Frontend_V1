import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/request/message_request.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/chat_date.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MessageBubble extends StatelessWidget {
  final MessageRequest message;
  final String category;

  const MessageBubble({super.key, required this.message, required this.category});

  @override
  Widget build(BuildContext context) {
    final isAgree = category == '찬성';
    final alignment = isAgree ? Alignment.centerLeft : Alignment.centerRight;
    final backgroundColor = isAgree ? redDark : blueDark;
    final borderRadius = BorderRadius.only(
      topLeft: isAgree ? Radius.circular(0.0) : Radius.circular(12.0),
      topRight: isAgree ? Radius.circular(12.0) : Radius.circular(0.0),
      bottomLeft: Radius.circular(12.0),
      bottomRight: Radius.circular(12.0),
    );

    Widget msgHeader() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _myProfile(),
          Gaps.h4,
          _myId(),
          Gaps.h4,
          _myCommunity(),
          Gaps.h4,
          SvgPicture.asset('assets/icons/ic_dot_grey50.svg'),
          Gaps.h4,
          _sendTime(),
        ],
      );
    }

    Widget msgBody() {
      return Container(
        padding: Dimensions.all12,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        child: Text(
          message.content,
          style: body14M,
        ),
      );
    }

    return Container(
      margin: Dimensions.all20,
      child: Column(
        children: [
          Align(
            alignment: alignment,
            child: msgHeader(),
          ),
          Gaps.v4,
          Align(
            alignment: alignment,
            child: msgBody(),
          ),
          ChatDateLine(),
        ],
      ),
    );
  }

  Widget _myProfile() {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: Color(0xFFE2B84C),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }

  Widget _myId() {
    return DeText(
      '난중일기',
      style: cation12SB.copyWith(color: grey10),
    );
  }

  Widget _myCommunity() {
    return DeText(
      '에펨코리아',
      style: cation12R.copyWith(color: grey30),
    );
  }

  Widget _sendTime() {
    return DeText(
      '20:05',
      style: cation12R.copyWith(color: grey30),
    );
  }
}
