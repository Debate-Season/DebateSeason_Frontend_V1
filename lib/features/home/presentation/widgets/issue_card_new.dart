import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/best_issue_room_entity.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class IssueCardNew extends StatelessWidget {
  final BestIssueRoomEntity bestIssueRoom;

  const IssueCardNew({super.key, required this.bestIssueRoom});

  @override
  Widget build(BuildContext context) {
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
            bestIssueRoom.title,
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
                  //Row(
                  //  children: [
                  //    DeText('관심등록 ',
                  //        style: DeFonts.caption12M
                  //            .copyWith(color: DeColors.grey50)),
                  //    DeText('27만',
                  //        style: DeFonts.caption12M
                  //            .copyWith(color: DeColors.grey30))
                  //  ],
                  //),
                  Row(
                    children: [
                      DeText('토론주제 ',
                          style: DeFonts.caption12M
                              .copyWith(color: DeColors.grey50)),
                      DeText(bestIssueRoom.countChatRoom.toString(),
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
}
