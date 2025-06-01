import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/best_chat_room_entity.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/cupertino.dart';

class DebateCard extends StatelessWidget {
  final BestChatRoomEntity bestChatRoom;

  const DebateCard({super.key, required this.bestChatRoom});

  @override
  Widget build(BuildContext context) {
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
              bestChatRoom.issueTitle,
              style: DeFonts.caption12M.copyWith(color: DeColors.grey10),
            ),
          ),
          DeGaps.v8,
          SizedBox(
            height: 48, // fontsize * lineHeight * 2
            child: DeText(
              bestChatRoom.debateTitle,
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
          DeText(bestChatRoom.time,
              style: DeFonts.caption12M.copyWith(color: DeColors.brand)),
        ],
      ),
    );
  }
}
