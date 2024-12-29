import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/widgets/de_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';

import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';


class ChatRoomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;

  const ChatRoomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      backgroundColor: grey80,
      automaticallyImplyLeading: false,
      title: Column(
        children: [
          Gaps.v8,
          Row(
            children: [
              Gaps.h20,
              Expanded(
                child: Text(
                  title,
                  style: body14Sb.copyWith(color: grey10),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Gaps.h12,
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => _widgetCloseDebate()
                  );
                },
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(3.14),
                  child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: SvgPicture.asset(
                      'assets/icons/ic_more_grey10.svg',
                    ),
                  ),
                ),
              ),
              Gaps.h20,
            ],
          ),
          Gaps.v8,
          Container(
            height: 1,
            color: grey70,
          )
        ],
      ),
    );
  }

  _widgetCloseDebate() {
    return DeBottomSheet(
        '토론 종료하기',
        widget: _widgetCloseDebateBottomSheetBody(),
    );
  }

  Widget _widgetCloseDebateBottomSheetBody() {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            log.d('토론방 나가기');
          },
          child: Container(
            padding: Dimensions.padding20x16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_exit_black.svg',
                    width: 24.0,
                    height: 24.0,
                  ),
                  Gaps.v16,
                  Expanded(
                    child: DeText(
                      '토론 종료하기',
                      style: body16M.copyWith(color: grey10),
                    ),
                  ),
                ],
              ),
            ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
