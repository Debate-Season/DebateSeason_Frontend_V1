import 'dart:io';

import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/profile_view_model.dart';
import 'package:debateseason_frontend_v1/utils/de_snack_bar.dart';
import 'package:debateseason_frontend_v1/widgets/de_app_bar.dart';
import 'package:debateseason_frontend_v1/widgets/de_dialog.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileWithdrawPage extends GetView<ProfileViewModel> {
  const ProfileWithdrawPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  DeAppBar _appBar() {
    return DeAppBar(
      title: '회원탈퇴',
      isBack: true,
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      padding: Dimensions.horizontal20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.v12,
          DeText(
            '탈퇴 정책 안내',
            style: header,
          ),
          Gaps.v8,
          DeText(
            '탈퇴 정책 안내',
            style: cation12M.copyWith(color: grey30),
          ),
          Gaps.v20,
          DeText(
            '절차',
            style: header,
          ),
          Gaps.v8,
          DeText(
            '회원 탈퇴를 신청하면 계정이 로그아웃되고 5일 뒤 탈퇴가 진행됩니다. 삭제 전 다시 로그인하면 탈퇴를 취소할 수 있습니다.',
            style: body14M.copyWith(color: grey30),
          ),
          DeText(
            '탈퇴가 완료될 경우, 해당 아이는 복구가 불가능합니다.',
            style: body14M.copyWith(color: red),
          ),
          Gaps.v20,
          DeText(
            '삭제되는 정보',
            style: header,
          ),
          Gaps.v8,
          Text.rich(
            TextSpan(
              text: '탈퇴가 완료되면 ',
              style: body14M.copyWith(color: grey30),
              children: [
                TextSpan(
                  text: '고유아이디, 닉네임, 성별 정보',
                  style: body14M.copyWith(color: brandColor),
                ),
                TextSpan(
                  text: '가 삭제됩니다. 내가 선택한 진영과 작성한 대화는 삭제되지 않습니다.',
                  style: body14M.copyWith(color: grey30),
                ),
              ],
            ),
          ),
          Gaps.v40,
          DeGestureDetector(
            onTap: () {
              DeDialog(
                dialogTitle: '회원 탈퇴 신청',
                dialogText: '회원 탈퇴를 신청하면 계정이 로그아웃되고 5일 뒤 회원 정보가 완전히 삭제됩니다.\n'
                    '삭제 전 다시 로그인하면 탈퇴를 취소할 수 있습니다.\n'
                    '탈퇴를 신청하시겠습니까?',
                cancelText: '탈퇴 취소',
                doneText: '탈퇴 신청하기',
                onTapDone: () {
                  controller.postWithdraw().then((result) {
                    result.when(
                      loading: () {},
                      success: (msg) {
                        if (Platform.isAndroid) {
                          controller.kakaoLogout().then((_) {
                            Get.offAllNamed(GetRouterName.auth);
                            deSnackBar('회원탈퇴 되었습니다.');
                          });
                        }
                      },
                      failure: (msg) {
                        deSnackBar(msg);
                      },
                    );
                  });
                },
              );
            },
            child: Container(
              width: double.infinity,
              padding: Dimensions.vertical12,
              decoration: BoxDecoration(
                color: grey80,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                  child: DeText(
                '탈퇴 신청하기',
                style: body16M,
              )),
            ),
          )
        ],
      ),
    );
  }
}
