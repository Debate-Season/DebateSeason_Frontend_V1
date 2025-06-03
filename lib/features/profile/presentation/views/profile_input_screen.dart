import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/profile_input_view_model.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/widgets/import_profile.dart';
import 'package:debateseason_frontend_v1/features/profile/profile_constants.dart';
import 'package:debateseason_frontend_v1/utils/amplitude_util.dart';
import 'package:debateseason_frontend_v1/utils/de_snack_bar.dart';
import 'package:debateseason_frontend_v1/widgets/import_de.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileInputScreen extends GetView<ProfileInputViewModel> {
  const ProfileInputScreen({super.key});

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
            ? ProfileConstants.PROFILE_MODIFY_APPBAR_TEXT
            : ProfileConstants.PROFILE_CREATE_APPBAR_TEXT,
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
                // DeGaps.v32,
                // _widgetResidence(),
                // DeGaps.v32,
                // _widgetHomeTown(),
                DeGaps.v40,
                _widgetBottomButton(),
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
        Row(
          children: [
            DeText(
              ProfileConstants.PROFILE_NICK_NAME,
              style: DeFonts.body14Sb,
            ),
            DeText(
              ProfileConstants.PROFILE_ESSENTIAL_STAR,
              style: DeFonts.body14Sb.copyWith(color: DeColors.brand),
            ),
          ],
        ),
        DeGaps.v8,
        DeTextField(
          style: DeFonts.body16M,
          hintText: ProfileConstants.PROFILE_NICK_NAME_HINT_TEXT,
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
        Row(
          children: [
            DeText(
              ProfileConstants.PROFILE_AFFILIATED_COMMUNITY,
              style: DeFonts.body14Sb,
            ),
            DeText(
              ProfileConstants.PROFILE_ESSENTIAL_STAR,
              style: DeFonts.body14Sb.copyWith(color: DeColors.brand),
            )
          ],
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
                    ProfileConstants.PROFILE_AFFILIATED_COMMUNITY,
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
            hintText: ProfileConstants.PROFILE_COMMUNITY_HINT_TEXT,
            controller: controller.communityController,
            enabled: false,
            isCleanIcon: false,
          ),
        ),
      ],
    );
  }

  Widget _widgetGender() {
    const genderMan = ProfileConstants.PROFILE_GENDER_MAN;
    const genderWomen = ProfileConstants.PROFILE_GENDER_WOMEN;
    const genderOther = ProfileConstants.PROFILE_GENDER_OTHER;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            DeText(
              ProfileConstants.PROFILE_GENDER,
              style: DeFonts.body14Sb,
            ),
            DeText(
              ProfileConstants.PROFILE_ESSENTIAL_STAR,
              style: DeFonts.body14Sb.copyWith(color: DeColors.brand),
            )
          ],
        ),
        DeGaps.v4,
        DeText(
          ProfileConstants.PROFILE_PRIVACY_NOTICE,
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
        Row(
          children: [
            DeText(
              ProfileConstants.PROFILE_AGE,
              style: DeFonts.body14Sb,
            ),
            DeText(
              ProfileConstants.PROFILE_ESSENTIAL_STAR,
              style: DeFonts.body14Sb.copyWith(color: DeColors.brand),
            )
          ],
        ),
        DeGaps.v4,
        DeText(
          ProfileConstants.PROFILE_PRIVACY_NOTICE,
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
                    ProfileConstants.PROFILE_AGE,
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
            hintText: ProfileConstants.PROFILE_AGE_HINT_TEXT,
            controller: controller.ageController,
            enabled: false,
            isCleanIcon: false,
          ),
        ),
      ],
    );
  }

// Widget _widgetResidence() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Row(
//         children: [
//           DeText(
//             ProfileConstants.PROFILE_RESIDENCE,
//             style: DeFonts.body14Sb,
//           ),
//           DeText(
//             ProfileConstants.PROFILE_ESSENTIAL_STAR,
//             style: DeFonts.body14Sb.copyWith(color: DeColors.brand),
//           )
//         ],
//       ),
//       DeGaps.v4,
//       DeText(
//         ProfileConstants.PROFILE_PRIVACY_NOTICE,
//         style: DeFonts.caption12M.copyWith(color: DeColors.grey50),
//       ),
//       DeGaps.v8,
//       DeGestureDetector(
//         onTap: () {
//           if (Get.context != null) {
//             showModalBottomSheet(
//               context: Get.context!,
//               isScrollControlled: true,
//               builder: (context) {
//                 return ProfileLocationBottomSheet(
//                   title: ProfileConstants.PROFILE_RESIDENCE,
//                 );
//               },
//             );
//           }
//         },
//         child: DeTextField(
//           style: DeFonts.body16M,
//           hintText: ProfileConstants.PROFILE_RESIDENCE_HINT_TEXT,
//           controller: controller.residenceController,
//           enabled: false,
//           isCleanIcon: false,
//         ),
//       ),
//     ],
//   );
// }
//
// Widget _widgetHomeTown() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Row(
//         children: [
//           DeText(
//             ProfileConstants.PROFILE_HOME_TOWN,
//             style: DeFonts.body14Sb,
//           ),
//           DeText(
//             ProfileConstants.PROFILE_ESSENTIAL_STAR,
//             style: DeFonts.body14Sb.copyWith(color: DeColors.brand),
//           )
//         ],
//       ),
//       DeGaps.v4,
//       DeText(
//         ProfileConstants.PROFILE_PRIVACY_NOTICE,
//         style: DeFonts.caption12M.copyWith(color: DeColors.grey50),
//       ),
//       DeGaps.v8,
//       DeGestureDetector(
//         onTap: () {
//           if (Get.context != null) {
//             showModalBottomSheet(
//               context: Get.context!,
//               isScrollControlled: true,
//               builder: (context) {
//                 return ProfileLocationBottomSheet(
//                   title: ProfileConstants.PROFILE_HOME_TOWN,
//                 );
//               },
//             );
//           }
//         },
//         child: DeTextField(
//           style: DeFonts.body16M,
//           hintText: ProfileConstants.PROFILE_HOME_TOWN_HINT_TEXT,
//           controller: controller.homeTownController,
//           enabled: false,
//           isCleanIcon: false,
//         ),
//       ),
//       DeGaps.v12,
//       Row(
//         children: [
//           DeText(
//             ProfileConstants.PROFILE_SAME_TO_RESIDENCE,
//             style: DeFonts.body14M.copyWith(color: DeColors.grey50),
//           ),
//           const Spacer(),
//           Obx(() {
//             bool isChecked = false;
//             isChecked = controller.selectedResidenceDistrict != null &&
//                 controller.selectedResidenceProvince ==
//                     controller.selectedHomeTownProvince &&
//                 controller.selectedResidenceDistrict ==
//                     controller.selectedHomeTownDistrict;
//
//             return Checkbox(
//               value: isChecked,
//               onChanged: (value) {
//                 if (value ?? false) {
//                   controller.checkSameToResidence();
//                 } else {
//                   controller.uncheckSameToResidence();
//                 }
//               },
//             );
//           }),
//         ],
//       ),
//     ],
//   );
// }
//
  Widget _widgetBottomButton() {
    return Obx(() {
      return DeButtonLarge(
        controller.isModifyScreen
            ? ProfileConstants.PROFILE_MODIFY_BTN_TEXT
            : ProfileConstants.PROFILE_CREATE_BTN_TEXT,
        onPressed: controller.isModifyScreen
            ? () => controller.patchProfile().then((result) {
                  result.when(loading: () {
                    controller.setApiLoading(isApiLoading: true);
                  }, success: (_) {
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
                  }, success: (_) {
                    controller.setApiLoading(isApiLoading: false);
                    AmplitudeUtil.trackEvent(eventName: '토론철 시작하기');
                    Get.offAllNamed(GetRouterName.issuemap);
                  }, failure: (msg) {
                    controller.setApiLoading(isApiLoading: false);
                    deSnackBar(msg);
                  });
                }),
        enable: controller.isValidStartBtn(),
      );
    });
  }
}
