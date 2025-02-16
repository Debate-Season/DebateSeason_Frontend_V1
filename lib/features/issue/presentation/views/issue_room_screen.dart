import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/issue/data/models/remote/response/chat_room_res.dart';
import 'package:debateseason_frontend_v1/features/issue/issue_constants.dart';
import 'package:debateseason_frontend_v1/features/issue/presentation/view_models/issue_room_view_model.dart';
import 'package:debateseason_frontend_v1/features/issue/presentation/widgets/issue_app_bar.dart';
import 'package:debateseason_frontend_v1/features/issue/presentation/widgets/issue_card.dart';
import 'package:debateseason_frontend_v1/widgets/de_cached_image.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IssueRoomScreen extends GetView<IssueRoomViewModel> {
  const IssueRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      appBar: IssueAppBar(
        title: Obx(() => Text(controller.issueTitle.value, style: DeFonts.title)),
        isCenter: false,
      ),
      body: _body(),
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
        color: DeColors.grey120,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Column(
        children: [
          DeText(
            IssueConstants.todayNewChat,
            style: DeFonts.body16M.copyWith(color: DeColors.grey50),
          ),
          Gaps.v12,
          DeText(
            IssueConstants.todayNewChatCount,
            style: DeFonts.body16Sb.copyWith(color: DeColors.grey10),
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
          IssueConstants.joinedCommunities,
          style: DeFonts.title,
        ),
        Gaps.v16,
        _comm(),
      ],
    );
  }

  Widget commItem(imagePath) {
    if (imagePath == null) {
      return Container(
        width: 36,
        height: 36,
        decoration: ShapeDecoration(
          color: DeColors.brandColor,
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

  Widget _comm() {
    return Obx(() {
      final communities = controller.issueData?.map.keys.toList();
      final int len = communities?.length ?? 0;

      return SizedBox(
        height: 36,
        child: ListView.separated(
          itemBuilder: (context, index) {
            return commItem(communities?[index]);
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
        DeText(IssueConstants.debateRoom, style: DeFonts.title),
        Gaps.v4,
        DeText(
          IssueConstants.debateTopicDescription,
          style: DeFonts.caption12M.copyWith(color: DeColors.grey50),
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

      if (chatRooms == null) {
        return const Text(IssueConstants.noChatRoom);
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
        child: IssueCard(chatroom: chatroom),
      );
    });
  }
}
