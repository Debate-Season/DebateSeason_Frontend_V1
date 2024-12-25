import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/request/message_request.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final MessageRequest message;
  final String category;

  const MessageBubble({super.key, required this.message, required this. category});

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

    return Align(
      alignment: alignment,
      child: Container(
        margin: Dimensions.all20,
        padding: Dimensions.all12,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        child: Text(
          message.content,
          style: body14M,
        ),
      )
    );
  }
}
