import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/response/room_res.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/types/opinion_type.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/view_model/debate_room_view_model.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/chat_bottom_sheet.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/debate_app_bar.dart';
import 'package:debateseason_frontend_v1/utils/de_snack_bar.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:debateseason_frontend_v1/widgets/de_button_large.dart';
import 'package:debateseason_frontend_v1/widgets/de_dialog.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_progress_indicator.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DebateRoomScreen extends GetView<DebateRoomViewModel> {
  const DebateRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      DeScaffold(
        appBar: _appBar(),
        body: _body(),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: _widgetDebateChat(),
      )
    ]);
  }

  DebateAppBar _appBar() {
    return DebateAppBar(
      titleWidget: _widgetAppBarTitle(),
      actions: [
        DeGestureDetector(
          onTap: () {},
          child: Padding(
            padding: Dimensions.all8,
            child: SvgPicture.asset(''),
          ),
        ),
        Gaps.h20,
      ],
    );
  }

  Widget _widgetAppBarTitle() {
    return Obx(() {
      return Row(
        children: [
          Gaps.h12,
          Expanded(
            child: Column(
              children: [
                DeText(
                  controller.issueTitle!,
                  style: cation12SB.copyWith(color: grey10),
                ),
                DeText('토론방', style: cation12M.copyWith(color: grey50)),
              ],
            ),
          ),
          Gaps.h12,
          Padding(
            padding: Dimensions.all8,
            child: SvgPicture.asset(''),
          ),
          Gaps.h12,
        ],
      );
    });
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

  // todo api 연결 끝나면 하단 코드 위젯파일로 분리하기
  //-----------------------------------------------------------------------------
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
          Obx(() {
            final room = controller.roomData;
            log.d(room?.toJson());
            if (room == null) {
              return DeProgressIndicator();
            }
            return DeText(
              room.title,
              style: body14M,
            );
          }),
        ],
      ),
    );
  }

  Widget _widgetDebateDetail() {
    return Obx(() {
      final room = controller.roomData;
      if (room == null) {
        return DeProgressIndicator();
      }
      return DeText(
        room.content, // todo 3줄 초과 시 더보기 버튼 추가
        style: body14R,
      );
    });
  }

  Widget _widgetDebateVote() {
    return Obx(() {
      final room = controller.roomData;
      if (room == null) {
        return DeProgressIndicator();
      }
      int agree = room.agree;
      int disagree = room.disagree;
      int total = agree + disagree;
      double agreeRatio = agree / total;
      double disagreeRatio = disagree / total;

      if (total == 0) {
        agreeRatio = 0;
        disagreeRatio = 0;
      }
      String agreeRatioText = (agreeRatio * 100).toStringAsFixed(0);
      String disagreeRatioText = (disagreeRatio * 100).toStringAsFixed(0);

      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _widgetVoteButton('찬성', agreeRatioText),
          DeText(
            'VS',
            style: body14M.copyWith(color: grey50),
          ),
          _widgetVoteButton('반대', disagreeRatioText),
        ],
      );
    });
  }

  Widget _widgetVoteButton(final String data, String ratio) {
    return Obx(() {
      final room = controller.roomData;
      if (room == null) {
        return DeProgressIndicator();
      }

      var opinion = controller.voteStatus.value;
      int agree = room.agree;
      int disagree = room.disagree;

      var widgetColor = data == '찬성' ? redDark : blueDark;
      if (opinion == OpinionType.agree.value) {
        widgetColor = data == '찬성' ? red : blueDark;
      } else if (opinion == OpinionType.disagree.value) {
        widgetColor = data == '찬성' ? redDark : blue;
      }

      String detail = '투표하기';
      if (opinion != OpinionType.neutral.value) {
        detail = data == '찬성' ? '$agree표' : '$disagree표';
      }

      return GestureDetector(
        onTap: () {
          if (opinion == OpinionType.neutral.value) {
            if (data == '찬성') {
              controller.postVoteData(OpinionType.agree, room.chatRoomId);
            } else if (data == '반대') {
              controller.postVoteData(OpinionType.disagree, room.chatRoomId);
            }
            deSnackBar('내 입장을 $data(으)로 투표했습니다.');
          } else {
            DeDialog.show(
              dialogTitle: '입장 변경',
              dialogText: '입장을 변경하시겠습니까?',
              doneText: '변경하기',
              cancelText: '유지',
              onTapDone: () async {
                if (data == '찬성') {
                  await controller.postVoteData(
                      OpinionType.agree, room.chatRoomId);
                } else if (data == '반대') {
                  await controller.postVoteData(
                      OpinionType.disagree, room.chatRoomId);
                }
                //await controller.postVoteData(data, room.chatRoomId);
                if (Get.isDialogOpen ?? true) {
                  deSnackBar('내 입장을 $data(으)로 변경했습니다.');
                }
              },
            );
          }
        },
        child: Container(
          width: 120.0,
          //나중에 사이즈 다시 확인
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
              DeText(
                data,
                style: cation12SB,
              ),
              DeText(
                '$ratio%',
                style: header,
              ),
              DeText(
                detail,
                style: cation12M,
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
      if (room == null) {
        return DeProgressIndicator();
      }
      String opinion = controller.voteStatus.value;

      return ChatBottomSheet(
        // 이렇게 해야 텍스트박스에 노란 밑줄 지워짐
        widget: DeGestureDetector(
          onTap: () {},
          child: Column(
            children: [
              DefaultTextStyle(
                style: body16M,
                child: DeButtonLarge(
                  '토론방 입장하기',
                  onPressed: () {
                    if (opinion == OpinionType.neutral.value) {
                      deSnackBar('대화를 시작하려면 입장(찬성/반대)을 선택해주세요.');
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
              Gaps.v20,
            ],
          ),
        ),
      );
    });
  }
}
