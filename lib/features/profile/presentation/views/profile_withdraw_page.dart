import 'dart:io';

import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
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
            ProfileConstants.profileWithdrawPolicyTitle,
            style: header,
          ),
          Gaps.v8,
          DeText(
            ProfileConstants.profileWithdrawPolicyDescription,
            style: cation12M.copyWith(color: grey30),
          ),
          Gaps.v20,
          DeText(
            ProfileConstants.profileWithdrawProcedureTitle,
            style: header,
          ),
          Gaps.v8,
          DeText(
            ProfileConstants.profileWithdrawProcedureDescription,
            style: body14M.copyWith(color: grey30),
          ),
          DeText(
            ProfileConstants.profileWithdrawWarning,
            style: body14M.copyWith(color: red),
          ),
          Gaps.v20,
          DeText(
            ProfileConstants.profileWithdrawDeletedInfoTitle,
            style: header,
          ),
          Gaps.v8,
          Text.rich(
            TextSpan(
              text: ProfileConstants.profileWithdrawDeletedInfoDescription1,
              style: body14M.copyWith(color: grey30),
              children: [
                TextSpan(
                  text: ProfileConstants.profileWithdrawDeletedInfoDescription2,
                  style: body14M.copyWith(color: brandColor),
                ),
                TextSpan(
                  text: ProfileConstants.profileWithdrawDeletedInfoDescription3,
                  style: body14M.copyWith(color: grey30),
                ),
              ],
            ),
          ),
          Gaps.v40,
          DeGestureDetector(
            onTap: () {
              DeDialog.show(
                dialogTitle: ProfileConstants.profileWithdrawDialogTitle,
                dialogText: ProfileConstants.profileWithdrawDialogDescription,
                cancelText: ProfileConstants.profileWithdrawDialogCancelText,
                doneText: ProfileConstants.profileWithdrawDoneText,
                onTapDone: () {
                  controller.postWithdraw().then((result) {
                    result.when(
                      loading: () {},
                      success: (msg) {
                        if (Platform.isAndroid) {
                          controller.kakaoLogout().then((_) {
                            Get.offAllNamed(GetRouterName.auth);
                            deSnackBar(
                                ProfileConstants.profileWithdrawSuccessMessage);
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
              padding: Dimensions.vertical12,
              decoration: BoxDecoration(
                color: grey80,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                  child: DeText(
                ProfileConstants.profileWithdrawDoneText,
                style: body16M,
              )),
            ),
          )
        ],
      ),
    );
  }
}
