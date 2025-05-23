import 'dart:io';

import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/profile_view_model.dart';
import 'package:debateseason_frontend_v1/features/profile/profile_constants.dart';
import 'package:debateseason_frontend_v1/utils/de_snack_bar.dart';
import 'package:debateseason_frontend_v1/widgets/de_app_bar.dart';
import 'package:debateseason_frontend_v1/widgets/de_dialog.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileWithdrawScreen extends GetView<ProfileViewModel> {
  const ProfileWithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  DeAppBar _appBar() {
    return DeAppBar(
      title: DeText(
        '회원탈퇴',
        style: DeFonts.header20B,
      ),
      isBack: true,
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      padding: DeDimensions.horizontal20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DeGaps.v12,
          DeText(
            ProfileConstants.PROFILE_WITHDRAW_POLICY_TITLE,
            style: DeFonts.header20B,
          ),
          DeGaps.v8,
          DeText(
            ProfileConstants.PROFILE_WITHDRAW_POLICY_DESCRIPTION,
            style: DeFonts.caption12M.copyWith(color: DeColors.grey30),
          ),
          DeGaps.v20,
          DeText(
            ProfileConstants.PROFILE_WITHDRAW_PROCEDURE_TITLE,
            style: DeFonts.header20B,
          ),
          DeGaps.v8,
          DeText(
            ProfileConstants.PROFILE_WITHDRAW_PROCEDURE_DESCRIPTION,
            style: DeFonts.body14M.copyWith(color: DeColors.grey30),
          ),
          DeText(
            ProfileConstants.PROFILE_WITHDRAW_WARNING,
            style: DeFonts.body14M.copyWith(color: DeColors.red),
          ),
          DeGaps.v20,
          DeText(
            ProfileConstants.PROFILE_WITHDRAW_DELETED_INFO_TITLE,
            style: DeFonts.header20B,
          ),
          DeGaps.v8,
          Text.rich(
            TextSpan(
              text: ProfileConstants.PROFILE_WITHDRAW_DELETED_INFO_DESCRIPTION1,
              style: DeFonts.body14M.copyWith(color: DeColors.grey30),
              children: [
                TextSpan(
                  text: ProfileConstants
                      .PROFILE_WITHDRAW_DELETED_INFO_DESCRIPTION2,
                  style: DeFonts.body14M.copyWith(color: DeColors.brand),
                ),
                TextSpan(
                  text: ProfileConstants
                      .PROFILE_WITHDRAW_DELETED_INFO_DESCRIPTION3,
                  style: DeFonts.body14M.copyWith(color: DeColors.grey30),
                ),
              ],
            ),
          ),
          DeGaps.v40,
          DeGestureDetector(
            onTap: () {
              DeDialog.show(
                dialogTitle: ProfileConstants.PROFILE_WITHDRAW_DIALOG_TITLE,
                dialogText:
                    ProfileConstants.PROFILE_WITHDRAW_DIALOG_DESCRIPTION,
                cancelText:
                    ProfileConstants.PROFILE_WITHDRAW_DIALOG_CANCEL_TEXT,
                doneText: ProfileConstants.PROFILE_WITHDRAW_DONE_TEXT,
                onTapDone: () {
                  controller.postWithdraw().then((result) {
                    result.when(
                      loading: () {},
                      success: (_) {
                        controller.clearStorage();
                        if (Platform.isAndroid) {
                          controller.kakaoLogout().then((_) {
                            Get.offAllNamed(GetRouterName.auth);
                            deSnackBar(ProfileConstants
                                .PROFILE_WITHDRAW_SUCCESS_MESSAGE);
                          });
                        } else {
                          Get.offAllNamed(GetRouterName.auth);
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
              padding: DeDimensions.vertical12,
              decoration: BoxDecoration(
                color: DeColors.grey80,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                  child: DeText(
                ProfileConstants.PROFILE_WITHDRAW_DONE_TEXT,
                style: DeFonts.body16M,
              )),
            ),
          )
        ],
      ),
    );
  }
}
