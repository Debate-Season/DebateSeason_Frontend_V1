import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/response/room_res.dart';
import 'package:debateseason_frontend_v1/features/chat/debate_constants.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/types/opinion_type.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/view_models/debate_ratio_view_model.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/view_models/debate_room_view_model.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/chat_bottom_sheet.dart';
import 'package:debateseason_frontend_v1/utils/de_snack_bar.dart';
import 'package:debateseason_frontend_v1/widgets/de_app_bar.dart';
import 'package:debateseason_frontend_v1/widgets/de_button_large.dart';
import 'package:debateseason_frontend_v1/widgets/de_dialog.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DebateRoomScreen extends GetView<DebateRoomViewModel> {
  const DebateRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      appBar: _appBar(),
      body: _body(),
      bottomSheet: _widgetDebateChat(),
    );
  }

  DeAppBar _appBar() {
    return DeAppBar(
      title: Obx(() {
        return Row(
          children: [
            DeGaps.h12,
            Expanded(
              child: Column(
                children: [
                  DeText(
                    controller.issueTitle,
                    style: DeFonts.caption12SB.copyWith(color: DeColors.grey10),
                  ),
                  DeText(
                    DebateConstants.debateRoom,
                    style: DeFonts.caption12M.copyWith(color: DeColors.grey50),
                  ),
                ],
              ),
            ),
            DeGaps.h24,
          ],
        );
      }),
    );
  }

  Widget _body() {
    return Padding(
      padding: DeDimensions.horizontal20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DeGaps.v12,
          _widgetDebateTopic(),
          DeGaps.v12,
          _widgetDebateDetail(),
          DeGaps.v20,
          _widgetDebateVote(),
        ],
      ),
    );
  }

  // todo api 연결 끝나면 하단 코드 위젯파일로 분리하기
  //-----------------------------------------------------------------------------
  Widget _widgetDebateTopic() {
    return Container(
      padding: DeDimensions.padding8x10,
      decoration: ShapeDecoration(
        color: DeColors.grey80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Column(
        children: [
          DeText(
            DebateConstants.debateTopic,
            style: DeFonts.caption12M.copyWith(color: DeColors.brandColor),
          ),
          Obx(() {
            final room = controller.roomData;
            return DeText(
              room.title,
              style: DeFonts.body14M,
            );
          }),
        ],
      ),
    );
  }

  Widget _widgetDebateDetail() {
    return Obx(() {
      final room = controller.roomData;
      return DeText(
        room.content, // todo 3줄 초과 시 더보기 버튼 추가
        style: DeFonts.body14R,
      );
    });
  }

  Widget _widgetDebateVote() {
    return Obx(() {
      final room = controller.roomData;
      final percentages = getPercentages(room);
      final agreeRatioText = percentages[0];
      final disagreeRatioText = percentages[1];

      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _widgetVoteButton('찬성', agreeRatioText),
          DeText(
            DebateConstants.vs,
            style: DeFonts.body14M.copyWith(color: DeColors.grey50),
          ),
          _widgetVoteButton('반대', disagreeRatioText),
        ],
      );
    });
  }

  Widget _widgetVoteButton(final String data, String ratio) {
    return Obx(() {
      final room = controller.roomData;

      var opinion = controller.voteStatus;
      int agree = room.agree;
      int disagree = room.disagree;

      var widgetColor = data == OpinionType.agree.valueKr
          ? DeColors.redDark
          : DeColors.blueDark;
      if (opinion == OpinionType.agree.value) {
        widgetColor = data == OpinionType.agree.valueKr
            ? DeColors.red
            : DeColors.blueDark;
      } else if (opinion == OpinionType.disagree.value) {
        widgetColor = data == OpinionType.agree.valueKr
            ? DeColors.redDark
            : DeColors.blue;
      }

      String detail = DebateConstants.voting;
      if (opinion != OpinionType.neutral.value) {
        detail = data == OpinionType.agree.valueKr ? '$agree표' : '$disagree표';
      }

      return GestureDetector(
        onTap: () {
          if (opinion == OpinionType.neutral.value) {
            if (data == OpinionType.agree.valueKr) {
              controller.postVoteData(OpinionType.agree, room.chatRoomId);
            } else if (data == OpinionType.disagree.valueKr) {
              controller.postVoteData(OpinionType.disagree, room.chatRoomId);
            }
            deSnackBar('내 입장을 $data(으)로 투표했습니다.');
          } else {
            String dataEn = '';
            if (data == OpinionType.agree.valueKr) {
              dataEn = OpinionType.agree.value;
            } else if (data == OpinionType.disagree.valueKr) {
              dataEn = OpinionType.disagree.value;
            }

            if (controller.voteStatus != dataEn) {
              DeDialog.show(
                dialogTitle: DebateConstants.changeVoteTitle,
                dialogText: DebateConstants.changeVoteConfirm,
                doneText: DebateConstants.changeVoteButton,
                cancelText: DebateConstants.changeVoteCancel,
                onTapDone: () async {
                  if (data == OpinionType.agree.valueKr) {
                    await controller.postVoteData(
                      OpinionType.agree,
                      room.chatRoomId,
                    );
                  } else if (data == OpinionType.disagree.valueKr) {
                    await controller.postVoteData(
                      OpinionType.disagree,
                      room.chatRoomId,
                    );
                  }
                  //await controller.postVoteData(data, room.chatRoomId);
                  if (Get.isDialogOpen ?? true) {
                    deSnackBar('내 입장을 $data(으)로 변경했습니다.');
                  }
                },
              );
            }
          }
        },
        child: Container(
          width: 120.0,
          //나중에 사이즈 다시 확인
          height: 120.0,
          padding: DeDimensions.all16,
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
              DeText(
                data,
                style: DeFonts.caption12SB,
              ),
              DeText(
                '$ratio%',
                style: DeFonts.header20B,
              ),
              DeText(
                detail,
                style: DeFonts.caption12M,
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _widgetDebateChat() {
    return Obx(() {
      final room = controller.roomData;

      String opinion = controller.voteStatus;

      return ChatBottomSheet(
        // 이렇게 해야 텍스트박스에 노란 밑줄 지워짐
        widget: DeGestureDetector(
          onTap: () {},
          child: Column(
            children: [
              DefaultTextStyle(
                style: DeFonts.body16M,
                child: DeButtonLarge(
                  DebateConstants.enterRoom,
                  onPressed: () {
                    if (opinion == OpinionType.neutral.value) {
                      deSnackBar(DebateConstants.enterRoomReject);
                      return;
                    }
                    final newRoom = RoomRes(
                      chatRoomId: room.chatRoomId,
                      title: room.title,
                      content: room.content,
                      agree: room.agree,
                      disagree: room.disagree,
                      createdAt: room.createdAt,
                      opinion: opinion,
                    );
                    Get.toNamed(
                      GetRouterName.chat,
                      arguments: {
                        'room': newRoom,
                      },
                    );
                  },
                  enable: opinion != 'none',
                ),
              ),
              DeGaps.v20,
            ],
          ),
        ),
      );
    });
  }
}
