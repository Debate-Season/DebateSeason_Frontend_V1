import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/profile_input_view_model.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/widgets/profile_input_card.dart';
import 'package:debateseason_frontend_v1/widgets/de_app_bar.dart';
import 'package:debateseason_frontend_v1/widgets/de_bottom_sheet.dart';
import 'package:debateseason_frontend_v1/widgets/de_button_large.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_progress_indicator.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:debateseason_frontend_v1/widgets/de_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileInputPage extends GetView<ProfileInputViewModel> {
  const ProfileInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DeGestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: DeScaffold(
        appBar: _appBar(),
        body: _body(),
      ),
    );
  }

  DeAppBar _appBar() {
    return DeAppBar(
      title: '프로필 입력하기',
      isBack: false,
    );
  }

  Widget _body() {
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
                DeButtonLarge(
                  '토론철 시작하기',
                  onPressed: () => controller.postProfile(),
                  enable: false,
                ),
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
          controller: controller.profileController,
          onChanged: (text) {
            if (text.length > 3) {
              controller.onChangedNickname(nickname: text);
            }
          },
        ),
        Obx(() {
          final error = controller.nicknameError;

          if (error.isNotEmpty) {
            return Column(
              children: [
                Gaps.v4,
                DeText(
                  error,
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
                    widget: _widgetCommunityBottomSheetBody(),
                  );
                },
              );
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
                    child: ProfileInputCard(
                      genderMan,
                      imagePath: '1',
                      isSelected: profileAgeRange == genderMan,
                    )),
              ),
              Gaps.h8,
              Expanded(
                child: DeGestureDetector(
                    onTap: () => controller.setGender(gender: genderWomen),
                    child: ProfileInputCard(
                      genderWomen,
                      imagePath: '2',
                      isSelected: profileAgeRange == genderWomen,
                    )),
              ),
              Gaps.h8,
              Expanded(
                child: DeGestureDetector(
                    onTap: () => controller.setGender(gender: genderOther),
                    child: ProfileInputCard(
                      genderOther,
                      isSelected: profileAgeRange == genderOther,
                    )),
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
                    widget: _widgetAgeBottomSheetBody(),
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

  Widget _widgetCommunityBottomSheetBody() {
    return Obx(() {
      final communities = controller.communities;

      return communities.when(
        loading: () {
          return const Center(
            child: DeProgressIndicator(),
          );
        },
        success: (communities) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DeTextField(
                controller: controller.communitySearchController,
                hintText: '내용을 입력해 주세요.',
                fillColor: grey90,
                onChanged: (searchWord) =>
                    controller.onChangedCommunity(searchWord: searchWord),
              ),
              Gaps.v16,
              SizedBox(
                height: Get.mediaQuery.size.height * 0.3,
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1,
                  ),
                  itemCount: communities.length,
                  itemBuilder: (context, index) {
                    final community = communities[index];

                    return DeGestureDetector(
                      onTap: () {
                        controller.setSelectedCommunityId(
                          communityId: community.id,
                        );
                      },
                      child: Obx(() {
                        final selectedCommunityId =
                            controller.selectedCommunityId;

                        return ProfileInputCard(
                          community.name,
                          imagePath: community.iconUrl,
                          isCommunity: true,
                          isSelected: selectedCommunityId == community.id,
                        );
                      }),
                    );
                  },
                ),
              ),
              Gaps.v16,
              Obx(() {
                final selectedCommunityId = controller.selectedCommunityId;

                return DeButtonLarge(
                  '등록하기',
                  onPressed: () {
                    controller.setCommunityId(
                      communityId: selectedCommunityId,
                    );
                    Get.back();
                  },
                  enable: selectedCommunityId > 0,
                );
              }),
              Gaps.v16,
            ],
          );
        },
        failure: (error) {
          return Center(
            child: DeText(
              error,
              style: body16Sb.copyWith(color: red),
            ),
          );
        },
      );
    });
  }

  Widget _widgetAgeBottomSheetBody() {
    final List<String> ageRange = [
      '10대',
      '20대',
      '30대',
      '40대',
      '50대',
      '60대',
      '70대',
      '80대',
      '90대 이상',
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DeTextField(
          controller: controller.ageSearchController,
          hintText: '내용을 입력해 주세요.',
          fillColor: grey90,
        ),
        Gaps.v16,
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          itemCount: ageRange.length,
          itemBuilder: (context, index) {
            final age = ageRange[index];

            return Obx(() {
              final selectedAge = controller.selectedAge;

              return DeGestureDetector(
                onTap: () => controller.setSelectedAge(selectedAge: age),
                child: ProfileInputCard(
                  age,
                  isCommunity: true,
                  isSelected: selectedAge == ageRange[index],
                ),
              );
            });
          },
        ),
        Gaps.v16,
        Obx(() {
          final selectedAge = controller.selectedAge;

          return DeButtonLarge(
            '선택하기',
            onPressed: () {
              controller.setAgeRange(ageRange: selectedAge);
              Get.back();
            },
            enable: selectedAge.isNotEmpty,
          );
        }),
        Gaps.v16,
      ],
    );
  }
}
