import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/issue/data/models/remote/response/chat_room_res.dart';
import 'package:debateseason_frontend_v1/features/issue/presentation/widgets/issue_card.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:debateseason_frontend_v1/widgets/de_app_bar.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:debateseason_frontend_v1/features/issue/presentation/view_model/issue_room_view_model.dart';

class IssueRoomScreen extends GetView<IssueRoomViewModel> {
  const IssueRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  DeAppBar _appBar() {
    return DeAppBar(
      title: '이슈',
      isBack: true,
      isCenter: false,
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _newChatCount(),
          Gaps.v40,
          _joinedCommunities(),
          Gaps.v40,
          Expanded(
            child: _debateView(),
          ),
        ],
      ),
    );
  }

  Widget _newChatCount() {
    return Container(
      padding: Dimensions.vertical12,
      decoration: ShapeDecoration(
        color: grey120,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Column(
        children: [
          DeText(
            '오늘 신규 대화',
            style: body16M.copyWith(color: grey50),
          ),
          Gaps.v12,
          DeText(
            '-개',
            style: body16Sb.copyWith(color: grey10),
          ),
        ],
      ),
    );
  }

  Widget _joinedCommunities() {
    Widget comm() {
      return Container(
        width: 36,
        height: 36,
        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
        decoration: ShapeDecoration(
          color: brandColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DeText(
          '참여 커뮤니티',
          style: title,
        ),
        Gaps.v16,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal, // 가로 스크롤 설정
          child: Row(
            children: [
              comm(),
              comm(),
              comm(),
              comm(),
              comm(),
              comm(),
              comm(),
              comm(),
              comm(),
              comm(),
              comm(),
              comm(),
              comm(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _debateView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DeText('토론방', style: title),
        Gaps.v4,
        DeText(
          'AI가 생성한 본 이슈의 주요 토론 주제입니다.',
          style: cation12M.copyWith(color: grey50),
        ),
        Gaps.v8,
        Expanded(child: _debateList()),
      ],
    );
  }

  Widget _debateList() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return _debateItem();
      },
      separatorBuilder: (context, index) => Gaps.v12,
      itemCount: 10,
    );
  }

  Widget _debateItem() {
    return Obx((){
      final issue = controller.issueData;
      final List<ChatRoomRes>? chatRooms = issue?.chatRoomMap;

      log.d(issue);
      log.d(chatRooms);
      final chatroom = chatRooms?[1];
      final crId = chatroom?.chatRoomId;
      log.d(crId);

      if(issue == null){
          return const Text('dddd');
        }

        return DeGestureDetector(
          onTap: () {
            Get.toNamed(
              GetRouterName.debate,
              //arguments: 'chat_room_id',
            );
          },
          child: IssueCard(),
        );
      }
    );
  }
}
