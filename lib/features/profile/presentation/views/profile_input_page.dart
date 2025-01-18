import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/profile_input_view_model.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/widgets/profile_age_bottom_sheet.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/widgets/profile_community_bottom_sheet.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/widgets/profile_gender_card.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/widgets/profile_text_card.dart';
import 'package:debateseason_frontend_v1/features/profile/profile_constants.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:debateseason_frontend_v1/widgets/de_app_bar.dart';
import 'package:debateseason_frontend_v1/widgets/de_bottom_sheet.dart';
import 'package:debateseason_frontend_v1/widgets/de_button_large.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_progress_indicator.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:debateseason_frontend_v1/widgets/de_text_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ProfileInputPage extends GetView<ProfileInputViewModel> {
  const ProfileInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  DeAppBar _appBar() {
    return DeAppBar(
      title: controller.isCreateScreen
          ? ProfileConstants.profileCreateAppbarText
          : ProfileConstants.profileModifyAppbarText,
      isBack: true,
    );
  }

  Widget _body() {
    Obx(() {
      if (controller.isApiLoading) {
        return DeProgressIndicator();
      }
      return SizedBox();
    });

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.v40,
          // todo MVP 구현
          // _widgetProfileColor(),
          // Gaps.v32,
          Padding(
            padding: Dimensions.horizontal20,
            child: Column(
              children: [
                _widgetNickName(),
                Gaps.v32,
                _widgetCommunity(),
                Gaps.v32,
                _widgetGender(),
                Gaps.v32,
                _widgetAge(),
                Gaps.v40,
                Obx(() {
                  return DeButtonLarge(
                    controller.isCreateScreen
                        ? ProfileConstants.profileCreateBtnText
                        : ProfileConstants.profileModifyBtnText,
                    onPressed: controller.isCreateScreen
                        ? () => controller.postProfile().then((result) {
                              result.when(loading: () {
                                controller.setApiLoading(isApiLoading: true);
                              }, success: (message) {
                                controller.setApiLoading(isApiLoading: false);
                                Get.offAllNamed(GetRouterName.home);
                              }, failure: (msg) {
                                controller.setApiLoading(isApiLoading: false);
                                Fluttertoast.showToast(msg: msg);
                              });
                            })
                        : () => controller.patchProfile().then((result) {
                              result.when(loading: () {
                                controller.setApiLoading(isApiLoading: true);
                              }, success: (message) {
                                controller.setApiLoading(isApiLoading: false);
                                Get.back();
                              }, failure: (msg) {
                                controller.setApiLoading(isApiLoading: false);
                                Fluttertoast.showToast(msg: msg);
                              });
                            }),
                    enable: controller.isValidStartBtn(),
                  );
                }),
                Gaps.v20,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _widgetProfileColor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: Dimensions.horizontal20,
          child: DeText(
            '프로필 사진',
            style: body14Sb,
          ),
        ),
        Gaps.v8,
        // todo 프로필 사진 선택
        Center(
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: blue,
              borderRadius: BorderRadius.circular(50),
            ),
            child: SizedBox.shrink(),
          ),
        )
      ],
    );
  }

  Widget _widgetNickName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DeText(
          '닉네임',
          style: body14Sb,
        ),
        Gaps.v8,
        DeTextField(
          style: body16M,
          hintText: '사용할 닉네임을 입력해주세요.',
          controller: controller.nicknameController,
          autofocus: false,
          onChanged: (nickname) {
            if (controller.isValidNickname(nickname)) {
              controller.onChangedNickname(nickname: nickname);
            }
          },
        ),
        Obx(() {
          final nicknameErrorText = controller.nicknameErrorText;
          if (nicknameErrorText.isNotEmpty) {
            return Column(
              children: [
                Gaps.v4,
                DeText(
                  nicknameErrorText,
                  style: cation12M.copyWith(color: red),
                ),
              ],
            );
          }

          return SizedBox.shrink();
        })
      ],
    );
  }

  Widget _widgetCommunity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DeText(
          '소속 커뮤니티',
          style: body14Sb,
        ),
        Gaps.v8,
        DeGestureDetector(
          onTap: () {
            // 커뮤니티 선택 바텀시트
            if (Get.context != null) {
              showModalBottomSheet(
                context: Get.context!,
                isScrollControlled: true,
                builder: (context) {
                  return DeBottomSheet(
                    '소속 커뮤니티',
                    widget: ProfileCommunityBottomSheet(),
                  );
                },
              ).whenComplete(() {
                if (controller.selectedCommunityId !=
                    controller.profile.community.id) {
                  controller.setSelectedCommunityId(
                      communityId: controller.profile.community.id);
                }
                controller.communitySearchController.clear();
              });
            }
          },
          child: DeTextField(
            style: body16M,
            hintText: '주로 활동하는 커뮤니티를 등록해 주세요.',
            controller: controller.communityController,
            enabled: false,
            isCleanIcon: false,
          ),
        ),
      ],
    );
  }

  Widget _widgetGender() {
    const genderMan = '남성';
    const genderWomen = '여성';
    const genderOther = '무응답';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DeText(
          '성별',
          style: body14Sb,
        ),
        Gaps.v4,
        DeText(
          '본 정보는 타인에게 공개되지 않습니다.',
          style: cation12M.copyWith(color: grey50),
        ),
        Gaps.v8,
        Obx(() {
          final profileAgeRange = controller.profile.gender;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: DeGestureDetector(
                  onTap: () => controller.setGender(gender: genderMan),
                  child: ProfileGenderCard(
                    genderMan,
                    imagePath: 'assets/icons/ic_men.svg',
                    isSelected: profileAgeRange == genderMan,
                  ),
                ),
              ),
              Gaps.h8,
              Expanded(
                child: DeGestureDetector(
                  onTap: () => controller.setGender(gender: genderWomen),
                  child: ProfileGenderCard(
                    genderWomen,
                    imagePath: 'assets/icons/ic_women.svg',
                    isSelected: profileAgeRange == genderWomen,
                  ),
                ),
              ),
              Gaps.h8,
              Expanded(
                child: DeGestureDetector(
                  onTap: () => controller.setGender(gender: genderOther),
                  child: ProfileTextCard(
                    genderOther,
                    isSelected: profileAgeRange == genderOther,
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }

  Widget _widgetAge() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DeText(
          '나이대',
          style: body14Sb,
        ),
        Gaps.v4,
        DeText(
          '본 정보는 타인에게 공개되지 않습니다.',
          style: cation12M.copyWith(color: grey50),
        ),
        Gaps.v8,
        DeGestureDetector(
          onTap: () {
            if (Get.context != null) {
              showModalBottomSheet(
                context: Get.context!,
                isScrollControlled: true,
                builder: (context) {
                  return DeBottomSheet(
                    '나이대',
                    widget: ProfileAgeBottomSheet(),
                  );
                },
              );
            }
          },
          child: DeTextField(
            style: body16M,
            hintText: '나이대를 선택해주세요.',
            controller: controller.ageController,
            enabled: false,
            isCleanIcon: false,
          ),
        ),
      ],
    );
  }
}
