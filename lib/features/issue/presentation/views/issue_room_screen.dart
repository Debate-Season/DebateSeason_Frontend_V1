import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/issue/issue_constants.dart';
import 'package:debateseason_frontend_v1/features/issue/presentation/view_models/issue_room_view_model.dart';
import 'package:debateseason_frontend_v1/features/issue/presentation/widgets/issue_card.dart';
import 'package:debateseason_frontend_v1/widgets/import_de.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        () => Text(
          controller.issueData.when(
            loading: () => '로딩중',
            success: (issueData) => issueData.title,
            failure: (error) => error,
          ),
          style: DeFonts.header,
        ),
      ),
      actions: [
        DeGestureDetector(
          onTap: () {},
          child: Padding(
            padding: DeDimensions.all8,
            child: SvgPicture.asset(DeIcons.icBookmarkGrey50),
          ),
        ),
        DeGestureDetector(
          onTap: () {},
          child: Padding(
            padding: DeDimensions.all8,
            child: SvgPicture.asset(DeIcons.icAssistantGrey50),
          ),
        ),
      ],
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
          DeGaps.v40,
          _joinedCommunities(),
          DeGaps.v40,
          Expanded(
            child: _debateView(),
          ),
        ],
      ),
    );
  }

  Widget _newChatCount() {
    return Container(
      padding: DeDimensions.vertical12,
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
          DeGaps.v12,
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
        DeGaps.v12,
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
      final issueData = controller.issueData;

      return issueData.when(
        loading: () => const Center(
          child: DeProgressIndicator(),
        ),
        success: (issueData) {
          final communities = issueData.map.keys.toList();
          final int len = communities.length;
          if (len == 0) {
            return const SizedBox(
              height: 36,
              child: DeText(
                '참여 중인 커뮤니티가 없어요. 토론에 참여해보세요!',
                style: DeFonts.body14M,
              ),
            );
          }
          return SizedBox(
            height: 36,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return commItem(communities[index]);
              },
              separatorBuilder: (context, index) => DeGaps.h8,
              itemCount: len,
              scrollDirection: Axis.horizontal,
            ),
          );
        },
        failure: (error) => const SizedBox(
            height: 36,
            child: Center(
              child: DeText('데이터 로딩 실패'),
            )),
      );
    });
  }

  Widget _debateView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DeText(IssueConstants.debateRoom, style: DeFonts.title),
        DeGaps.v4,
        DeText(
          IssueConstants.debateTopicDescription,
          style: DeFonts.caption12M.copyWith(color: DeColors.grey50),
        ),
        DeGaps.v12,
        Expanded(child: _debateList()),
      ],
    );
  }

  Widget _debateList() {
    return Obx(() {
      final issueData = controller.issueData;

      return issueData.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        success: (issueData) {
          final int len = issueData.chatRoomMap.length;
          return ListView.separated(
            itemBuilder: (context, index) {
              return _debateItem(index);
            },
            separatorBuilder: (context, index) => DeGaps.v12,
            itemCount: len,
          );
        },
        failure: (error) => Center(
          child: DeText(
            error,
            style: DeFonts.body16Sb.copyWith(color: DeColors.red),
          ),
        ),
      );
    });
  }

  Widget _debateItem(int index) {
    final issueData = controller.issueData;
    return issueData.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      success: (issueData) {
        final chatRoomMap = issueData.chatRoomMap;
        final chatroom = chatRoomMap[index];
        return DeGestureDetector(
          onTap: () {
            Get.toNamed(
              GetRouterName.debate,
              arguments: {
                'chatroom_id': chatroom.chatRoomId,
                'issue_title': issueData.title,
              },
            );
          },
          child: IssueCard(chatroom: chatroom),
        );
      },
      failure: (error) => Center(
        child: DeText(
          error,
          style: DeFonts.body16Sb.copyWith(color: DeColors.red),
        ),
      ),
    );
  }
}
