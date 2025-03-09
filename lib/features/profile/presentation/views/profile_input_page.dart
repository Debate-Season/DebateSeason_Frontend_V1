import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/profile_input_view_model.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/widgets/import_profile.dart';
import 'package:debateseason_frontend_v1/features/profile/profile_constants.dart';
import 'package:debateseason_frontend_v1/utils/de_snack_bar.dart';
import 'package:debateseason_frontend_v1/widgets/import_de.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileInputPage extends GetView<ProfileInputViewModel> {
  const ProfileInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DeScaffold(
        appBar: _appBar(isModifyScreen: controller.isModifyScreen),
        body: _body(),
      );
    });
  }

  DeAppBar _appBar({required bool isModifyScreen}) {
    return DeAppBar(
      title: DeText(
        isModifyScreen
            ? ProfileConstants.profileModifyAppbarText
            : ProfileConstants.profileCreateAppbarText,
        style: DeFonts.header20B,
      ),
      isBack: isModifyScreen,
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
          DeGaps.v12,
          // todo MVP 구현
          // _widgetProfileColor(),
          // Gaps.v32,
          Padding(
            padding: DeDimensions.horizontal20,
            child: Column(
              children: [
                _widgetNickName(),
                DeGaps.v32,
                _widgetCommunity(),
                DeGaps.v32,
                _widgetGender(),
                DeGaps.v32,
                _widgetAge(),
                DeGaps.v40,
                Obx(() {
                  return DeButtonLarge(
                    controller.isModifyScreen
                        ? ProfileConstants.profileModifyBtnText
                        : ProfileConstants.profileCreateBtnText,
                    onPressed: controller.isModifyScreen
                        ? () => controller.patchProfile().then((result) {
                              result.when(loading: () {
                                controller.setApiLoading(isApiLoading: true);
                              }, success: (message) {
                                controller.setApiLoading(isApiLoading: false);
                                Get.back();
                              }, failure: (msg) {
                                controller.setApiLoading(isApiLoading: false);
                                deSnackBar(msg);
                              });
                            })
                        : () => controller.postProfile().then((result) {
                              result.when(loading: () {
                                controller.setApiLoading(isApiLoading: true);
                              }, success: (message) {
                                controller.setApiLoading(isApiLoading: false);
                                Get.offAllNamed(GetRouterName.home);
                              }, failure: (msg) {
                                controller.setApiLoading(isApiLoading: false);
                                deSnackBar(msg);
                              });
                            }),
                    enable: controller.isValidStartBtn(),
                  );
                }),
                DeGaps.v20,
              ],
            ),
          ),
        ],
      ),
    );
  }

  /*Widget _widgetProfileColor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: DeDimensions.horizontal20,
          child: DeText(
            '프로필 사진',
            style: DeFonts.body14Sb,
          ),
        ),
        DeGaps.v8,
        // todo 프로필 사진 선택
        Center(
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: DeColors.blue,
              borderRadius: BorderRadius.circular(50),
            ),
            child: SizedBox.shrink(),
          ),
        )
      ],
    );
  }*/

  Widget _widgetNickName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DeText(
          '닉네임',
          style: DeFonts.body14Sb,
        ),
        DeGaps.v8,
        DeTextField(
          style: DeFonts.body16M,
          hintText: '한글, 영문 조합 최대 8자',
          controller: controller.nicknameController,
          focusNode: controller.nicknameFocusNode,
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
                DeGaps.v4,
                DeText(
                  nicknameErrorText,
                  style: DeFonts.caption12M.copyWith(color: DeColors.red),
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
          style: DeFonts.body14Sb,
        ),
        DeGaps.v8,
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
                controller.nicknameFocusNode.unfocus();
              });
            }
          },
          child: DeTextField(
            style: DeFonts.body16M,
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
          style: DeFonts.body14Sb,
        ),
        DeGaps.v4,
        DeText(
          '본 정보는 타인에게 공개되지 않습니다.',
          style: DeFonts.caption12M.copyWith(color: DeColors.grey50),
        ),
        DeGaps.v8,
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
                    imagePath: DeIcons.icMen,
                    isSelected: profileAgeRange == genderMan,
                  ),
                ),
              ),
              DeGaps.h8,
              Expanded(
                child: DeGestureDetector(
                  onTap: () => controller.setGender(gender: genderWomen),
                  child: ProfileGenderCard(
                    genderWomen,
                    imagePath: DeIcons.icWomen,
                    isSelected: profileAgeRange == genderWomen,
                  ),
                ),
              ),
              DeGaps.h8,
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
          style: DeFonts.body14Sb,
        ),
        DeGaps.v4,
        DeText(
          '본 정보는 타인에게 공개되지 않습니다.',
          style: DeFonts.caption12M.copyWith(color: DeColors.grey50),
        ),
        DeGaps.v8,
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
              ).whenComplete(() {
                controller.nicknameFocusNode.unfocus();
              });
            }
          },
          child: DeTextField(
            style: DeFonts.body16M,
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
