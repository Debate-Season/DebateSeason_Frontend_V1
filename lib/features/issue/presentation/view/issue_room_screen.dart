import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/issue/data/models/remote/response/chat_room_res.dart';
import 'package:debateseason_frontend_v1/features/issue/presentation/view_model/issue_room_view_model.dart';
import 'package:debateseason_frontend_v1/features/issue/presentation/widgets/issue_card.dart';
import 'package:debateseason_frontend_v1/widgets/import_de.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      title: Obx(
        () => Text(controller.issueTitle.value, style: title),
      ),
      isCenter: false,
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // _newChatCount(),
          // Gaps.v40,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DeText(
          '참여 커뮤니티',
          style: title,
        ),
        Gaps.v16,
        _commItem(),
      ],
    );
  }

  Widget _commItem() {
    return Obx(() {
      final communities = controller.issueData?.map.keys.toList();
      final int len = communities?.length ?? 0;

      Widget comm(imagePath) {
        if (imagePath == null) {
          return Container(
            width: 36,
            height: 36,
            decoration: ShapeDecoration(
              color: brandColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        }
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: DeCachedImage(
            imagePath,
            width: 36,
            height: 36,
          ),
        );
      }

      return SizedBox(
        height: 36,
        child: ListView.separated(
          itemBuilder: (context, index) {
            return comm(communities?[index]);
          },
          separatorBuilder: (context, index) => Gaps.h8,
          itemCount: len,
          scrollDirection: Axis.horizontal,
        ),
      );
    });
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
    return Obx(() {
      final issue = controller.issueData;
      final List<ChatRoomRes>? chatRooms = issue?.chatRoomMap;
      final int len = chatRooms?.length ?? 0;

      return ListView.separated(
        itemBuilder: (context, index) {
          return _debateItem(index);
        },
        separatorBuilder: (context, index) => Gaps.v12,
        itemCount: len,
      );
    });
  }

  Widget _debateItem(int index) {
    return Obx(() {
      final List<ChatRoomRes>? chatRooms = controller.issueData?.chatRoomMap;
      final chatroom = chatRooms?[index];
      final percent = controller.getPercentages(controller.issueId);

      if (chatRooms == null) {
        return const Text('채팅방이 개설되지 않았습니다.');
      }

      return DeGestureDetector(
        onTap: () {
          Get.toNamed(
            GetRouterName.debate,
            arguments: {
              'chatroom_id': chatroom?.chatRoomId ?? -1,
              'issue_title': controller.issueTitle.value,
            },
          );
        },
        //child: IssueCard(chatroom: chatroom, callback: controller.getPercentages(controller.issueId ?? -1)),
        child: IssueCard(chatroom: chatroom),
      );
    });
  }
}
