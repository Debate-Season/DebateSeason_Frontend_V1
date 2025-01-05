import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/view_model/debate_room_view_model.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/debate_room.dart';

import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/chat_bottom_sheet.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/debate_app_bar.dart';

class DebateRoomScreen extends GetView<DebateRoomViewModel> {
  // 디버그용 더미 데이터
  final DebateRoom room = Get.arguments as DebateRoom? ??
      DebateRoom(
        title: 'AI와 인간의 미래',
        content: 'AI가 인간의 삶에 미치는 영향을 논의합니다. AI가 인간의 삶에 미치는 영향을 논의합니다.AI가 인간의 삶에 미치는 영향을 논의합니다.',);

  //DebateRoomScreen({Key? key, required this.room}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DeScaffold(
          appBar: _appBar(),
          body: _body(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _widgetDebateChat(),
        )
      ]
    );
  }

  DebateAppBar _appBar() {
    return DebateAppBar(title: room.title);
  }

  Widget _body() {
    return Padding(
      padding: Dimensions.horizontal20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Gaps.v12,
          _widgetDebateTopic(),
          Gaps.v12,
          _widgetDebateDetail(),
          Gaps.v20,
          _widgetDebateVote(),
        ],
      ),
    );
  }

  Widget _widgetDebateTopic() {
    return Container(
      padding: Dimensions.padding8x10,
      decoration: ShapeDecoration(
        color: grey80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Column(
        children: [
          DeText(
            '토론주제',
            style: cation12M.copyWith(color: brandColor),
          ),
          DeText(
            room.title,
            style: body14M,
          ),
        ],
      ),
    );
  }

  Widget _widgetDebateDetail() {
    return DeText(
      room.content,
      style: body14R,
    );
  }

  Widget _widgetDebateVote() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _widgetVoteButton('찬성', '78' ), //변수 가져오기
        DeText('VS', style: body14M.copyWith(color: grey50),),
        _widgetVoteButton('반대', '22' ),
      ],
    );
  }

  Widget _widgetVoteButton(final String data, String ratio) {
    final widgetColor = data == '찬성' ? redDark : blueDark;

    return GestureDetector(
      onTap: () => {log.d('voted')},
      child: Container(
        width: 120.0, //나중에 사이즈 다시 확인
        height: 120.0,
        padding: Dimensions.all16,
        decoration: ShapeDecoration(
          color: widgetColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DeText(data, style: cation12SB,),
            DeText('$ratio%', style: header,),
            DeText('투표하기', style: cation12M,),

          ],
        ),
      ),
    );
  }

  // 이렇게해야 되는데 오버플로우 남. 사이즈 제한 등 정리해야할 듯
  Widget _widgetDebateChat() {
  //   if (!Get.isRegistered<ChatRoomViewModel>()) {
  //     Get.put(ChatRoomViewModel());
  //   }
  //
    return ChatBottomSheet(
  //       widget: ChatRoomScreen(),
      widget: Text('text'),
    );
  }
}
