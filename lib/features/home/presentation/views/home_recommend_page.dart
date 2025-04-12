import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/home/presentation/widgets/issue_card.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeRecommendPage extends StatelessWidget {
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
        DeGaps.v20,
        _bestDebate(),
        DeGaps.v40,
        _bestIssue(),
        DeGaps.v42,
        _myDebate(),
      ],
    );
  }

  Widget _bestDebate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: DeDimensions.horizontal20,
          child: DeText(
            '인기 토론',
            style: DeFonts.header18Sb.copyWith(color: DeColors.grey10),
          ),
        ),
        DeGaps.v12,
        _bestDebateList(),
      ],
    );
  }

  Widget bestDebateItem() {
    return Container(
      width: 320,
      padding: DeDimensions.all16,
      decoration: BoxDecoration(
          color: DeColors.grey110,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: DeColors.grey90,
            width: 1,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: DeDimensions.padding6x2,
            decoration: BoxDecoration(
                color: DeColors.tag, borderRadius: BorderRadius.circular(6)),
            child: DeText(
              '동덕여자대학교 남녀공학 전환 반대 시위',
              style: DeFonts.caption12M.copyWith(color: DeColors.grey10),
            ),
          ),
          DeGaps.v8,
          SizedBox(
            height: 48, // fontsize * lineHeight * 2
            child: DeText(
              '대한민국 헌법상 계엄령 조항은 시대에 맞게 개정될 필요가 있는가?',
              style: DeFonts.body16M.copyWith(color: DeColors.grey10),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
              DeText('관심등록 ',
                  style: DeFonts.caption12M.copyWith(color: DeColors.grey50)),
              DeText('198만',
                  style: DeFonts.caption12M.copyWith(color: DeColors.grey30))
            ],
          ),
          DeGaps.v8,
          DeText('4분 전 대화',
              style: DeFonts.caption12M.copyWith(color: DeColors.brand)),
        ],
      ),
    );
  }

  Widget _bestDebateList() {
    final scrollController = ScrollController(
      initialScrollOffset: (320 + 20) * 5000,
    );
    return SizedBox(
      height: 158,
      child: ListView.separated(
        controller: scrollController,
        itemBuilder: (context, index) {
          //final realIndex = index % 5;
          return bestDebateItem();
        },
        separatorBuilder: (context, index) => DeGaps.h8,
        itemCount: 10000,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _bestIssue() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: DeDimensions.horizontal20,
          child: DeText(
            '인기 이슈',
            style: DeFonts.header18Sb.copyWith(color: DeColors.grey10),
          ),
        ),
        DeGaps.v12,
        _bestIssueList(),
      ],
    );
  }

  Widget _bestIssueList() {
    return SizedBox(
      height: 102, // todo 높이 조정
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Row(
            children: [
              if (index == 0) DeGaps.h20,
              bestIssueItem(),
              DeGaps.h8,
            ],
          );
        },
        itemCount: 5,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget bestIssueItem() {
    return Container(
      width: 200,
      padding: DeDimensions.all16,
      decoration: BoxDecoration(
          color: DeColors.grey110,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: DeColors.grey90,
            width: 1,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DeText(
            '동덕여자대학교 남녀공학 전환 반대 시위',
            style: DeFonts.body16Sb.copyWith(color: DeColors.grey10),
            overflow: TextOverflow.ellipsis,
          ),
          DeGaps.v8,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      DeText('관심등록 ',
                          style: DeFonts.caption12M
                              .copyWith(color: DeColors.grey50)),
                      DeText('27만',
                          style: DeFonts.caption12M
                              .copyWith(color: DeColors.grey30))
                    ],
                  ),
                  Row(
                    children: [
                      DeText('토론주제 ',
                          style: DeFonts.caption12M
                              .copyWith(color: DeColors.grey50)),
                      DeText('8개',
                          style: DeFonts.caption12M
                              .copyWith(color: DeColors.grey30))
                    ],
                  ),
                ],
              ),
              SvgPicture.asset(
                DeIcons.icArrowRightGrey50,
                width: 20,
                height: 20,
              )
            ],
          ),
        ],
      ),
    );
  }

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
    return Padding(
      padding: DeDimensions.horizontal20,
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _debateItem(index);
        },
        separatorBuilder: (context, index) => DeGaps.v12,
        itemCount: 4,
      ),
    );
  }

  Widget _debateItem(int index) {
    return DeGestureDetector(
      onTap: () {
        Get.toNamed(
          GetRouterName.debate,
          arguments: {
            'chatroom_id': 1,
            'issue_title': 'issueData.title',
          },
        );
      },
      child: IssueCard(chatroom: ['tdddd']),
    );
  }
}
