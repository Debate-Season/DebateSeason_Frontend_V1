import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/best_chat_room_entity.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/best_issue_room_entity.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/chat_room_response_entity.dart';
import 'package:debateseason_frontend_v1/features/home/presentation/view_models/recommend_view_model.dart';
import 'package:debateseason_frontend_v1/features/home/presentation/widgets/debate_card.dart';
import 'package:debateseason_frontend_v1/features/home/presentation/widgets/issue_card.dart';
import 'package:debateseason_frontend_v1/features/home/presentation/widgets/issue_card_new.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeRecommendPage extends GetView<RecommendViewModel> {
  const HomeRecommendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return ListView(
      children: [
        _headlineNews(),
        DeGaps.v20,
        _bestDebate(),
        DeGaps.v40,
        _bestIssue(),
        DeGaps.v40,
        _myDebate(),
        DeGaps.v40,
        _recommendDebate(),
      ],
    );
  }

  Widget _headlineNews() {
    return Padding(
      padding: DeDimensions.horizontal20,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: DeDimensions.padding10x8,
            decoration: BoxDecoration(
              color: DeColors.grey110,
              borderRadius: BorderRadius.circular(10),
            ),
            child: DeText(
              '속보나올 자리',
              style: DeFonts.body14M,
            ),
          ),
          DeGaps.v4,
        ],
      ),
    );
  }

  //--------------------------------------------------

  Widget _bestDebate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: DeDimensions.horizontal20,
          child: DeText(
            '뜨겁게 논쟁 중인 찬반토론',
            style: DeFonts.header18Sb.copyWith(color: DeColors.grey10),
          ),
        ),
        DeGaps.v12,
        _bestDebateList(),
      ],
    );
  }

  Widget _bestDebateItem(BestChatRoomEntity debate) {
    return DeGestureDetector(
      onTap: () {
         Get.toNamed(
           GetRouterName.debate,
           arguments: {
             'chatroom_id': debate.debateId,
             'issue_title': debate.issueTitle,
           },
         );
      },
      child: DebateCard(bestChatRoom: debate),
    );
  }

  Widget _bestDebateList() {
    return Obx(() {
      final scrollController = ScrollController(
        initialScrollOffset: (317) * 500,
      );
      final debateData = controller.recommendData;

      return debateData.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        success: (debateData) {
          final debaterooms = debateData.top5BestChatRooms;
          final int len = debaterooms.length;
          return SizedBox(
            height: 140,
            child: ListView.separated(
              controller: scrollController,
              itemCount: 1000,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final realIndex = index % len;
                return _bestDebateItem(debaterooms[realIndex]);
              },
              separatorBuilder: (context, index) => DeGaps.h8,
            ),
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

  //--------------------------------------------------

  Widget _bestIssue() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: DeDimensions.horizontal20,
          child: DeText(
            '이런 이슈는 어때요?',
            style: DeFonts.header18Sb.copyWith(color: DeColors.grey10),
          ),
        ),
        DeGaps.v12,
        _bestIssueList(),
      ],
    );
  }

  Widget _bestIssueList() {
    return Obx(() {
      final issueData = controller.recommendData;
      return issueData.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (issueData) {
            final issuerooms = issueData.top5BestIssueRooms;
            return SizedBox(
              height: 90, // todo 높이 조정
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      if (index == 0) DeGaps.h20,
                      bestIssueItem(issuerooms[index]),
                      DeGaps.h8,
                    ],
                  );
                },
                itemCount: 5,
                scrollDirection: Axis.horizontal,
              ),
            );
          },
          failure: (error) => Center(
                  child: DeText(
                error,
                style: DeFonts.body16Sb.copyWith(color: DeColors.red),
              )));
    });
  }

  Widget bestIssueItem(BestIssueRoomEntity issue) {
    return DeGestureDetector(
      onTap: () {
        Get.toNamed(GetRouterName.issue, arguments: {
          'issue_id': issue.issueId,
        });
      },
      child: IssueCardNew(bestIssueRoom: issue),
    );
  }

  //--------------------------------------------------

  Widget _myDebate() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: DeDimensions.horizontal20,
          child: DeText('참여 중인 토론', style: DeFonts.header18Sb),
        ),
        DeGaps.v12,
        _debateList(),
      ],
    );
  }

  Widget _debateList() {
    return Obx((){
      final mydebateData = controller.recommendData;
      return mydebateData.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        success: (mydebateData){
          final mydebates = mydebateData.chatRoomResponse;
          final int len = mydebates?.length ?? 0;
          if(len == 0){
            return DeText(
              '참여 중인 토론이 없습니다. 지금 바로 토론에 참여해보세요.',
              style: DeFonts.body16Sb.copyWith(color: DeColors.grey10),
            );
          }
          return Padding(
            padding: DeDimensions.horizontal20,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _debateItem(mydebates![index]);
              },
              separatorBuilder: (context, index) => DeGaps.v12,
              itemCount: len,
            ),
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

  Widget _debateItem(ChatRoomResponseEntity chat) {
    return DeGestureDetector(
      onTap: () {
        Get.toNamed(
          GetRouterName.debate,
          arguments: {
            'chatroom_id': chat.chatRoomId,
            'issue_title': chat.title, //todo issuetitle와야함
          },
        );
      },
      child: IssueCard(chatroom: chat),
    );
  }

  //--------------------------------------------------

  Widget _recommendDebate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: DeDimensions.horizontal20,
          child: DeText('이런 토론을 추천해요', style: DeFonts.header18Sb),
        ),
        DeGaps.v12,
        _recommendDebateList(),
      ],
    );
  }

  Widget _recommendDebateList() {
    return DeText('asdf');
  }
}
