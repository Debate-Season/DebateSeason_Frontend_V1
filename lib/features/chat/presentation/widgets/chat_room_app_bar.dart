import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/color.dart';
import '../../../../core/constants/text_style.dart';


class ChatRoomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;

  const ChatRoomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: grey80,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: body14Sb.copyWith(color: grey10),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Gaps.h12,
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(3.14),
            child: SizedBox(
              width: 24.0,
              height: 24.0,
              child: SvgPicture.asset(
                'assets/icons/settings.svg',
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
