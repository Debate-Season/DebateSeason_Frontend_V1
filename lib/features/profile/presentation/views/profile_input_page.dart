import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/profile_input_view_model.dart';
import 'package:debateseason_frontend_v1/features/auth/presentation/widgets/auth_card.dart';
import 'package:debateseason_frontend_v1/widgets/de_app_bar.dart';
import 'package:debateseason_frontend_v1/widgets/de_bottom_sheet.dart';
import 'package:debateseason_frontend_v1/widgets/de_button_large.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
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
                  '선택하기',
                  onPressed: () {},
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
        ),
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
          ),
        ),
      ],
    );
  }

  Widget _widgetGender() {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: AuthCard('남성', imagePath: '1')),
            Gaps.h8,
            Expanded(child: AuthCard('여성', imagePath: '2')),
            Gaps.h8,
            Expanded(child: AuthCard('무응답')),
          ],
        ),
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
            // 나이대 선택 바텀시트
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
          ),
        ),
      ],
    );
  }

  Widget _widgetCommunityBottomSheetBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DeTextField(
          controller: controller.communitySearchController,
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
          itemCount: 9,
          itemBuilder: (context, index) {
            if (index == 0) {
              return AuthCard(
                '무소속',
                isCommunity: true,
              );
            }

            return AuthCard(
              '커뮤니티명',
              imagePath: '1',
              isCommunity: true,
            );
          },
        ),
        Gaps.v16,
        DeButtonLarge(
          '등록하기',
          onPressed: () {},
          enable: false,
        ),
        Gaps.v16,
      ],
    );
  }

  Widget _widgetAgeBottomSheetBody() {
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
          itemCount: 9,
          itemBuilder: (context, index) {
            if (index == 8) {
              return AuthCard(
                '90대 이상',
                isCommunity: true,
              );
            }

            return AuthCard(
              '${1 + index}0대',
              isCommunity: true,
            );
          },
        ),
        Gaps.v16,
        DeButtonLarge(
          '선택하기',
          onPressed: () {},
          enable: false,
        ),
        Gaps.v16,
      ],
    );
  }
}
