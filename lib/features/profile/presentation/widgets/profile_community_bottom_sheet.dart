import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/entities/community_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/profile_input_view_model.dart';
import 'package:debateseason_frontend_v1/features/profile/profile_constants.dart';
import 'package:debateseason_frontend_v1/widgets/de_button_large.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_progress_indicator.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:debateseason_frontend_v1/widgets/de_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_community_card.dart';

class ProfileCommunityBottomSheet extends GetView<ProfileInputViewModel> {
  const ProfileCommunityBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final communities = controller.communities;
      final selectedCommunities = controller.selectedCommunities;

      if (controller.communitySearchController.text.isNotEmpty) {
        return selectedCommunities.when(
          loading: () {
            return const Center(
              child: DeProgressIndicator(),
            );
          },
          success: (communities) {
            return _widgetCommunities(
              context: context,
              communities: communities,
            );
          },
          failure: (error) {
            return Center(
              child: DeText(
                error,
                style: DeFonts.body16Sb.copyWith(color: DeColors.red),
              ),
            );
          },
        );
      }

      return communities.when(
        loading: () {
          return const Center(
            child: DeProgressIndicator(),
          );
        },
        success: (communities) {
          return _widgetCommunities(
            context: context,
            communities: communities,
          );
        },
        failure: (error) {
          return Center(
            child: DeText(
              error,
              style: DeFonts.body16Sb.copyWith(color: DeColors.red),
            ),
          );
        },
      );
    });
  }

  Widget _widgetCommunities({
    required BuildContext context,
    required List<CommunityEntity> communities,
  }) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DeTextField(
            controller: controller.communitySearchController,
            hintText: ProfileConstants.PROFILE_EMPTY_HINT_TEXT,
            fillColor: DeColors.grey90,
            onChanged: (searchWord) =>
                controller.onChangedCommunity(searchWord: searchWord),
          ),
          DeGaps.v16,
          SizedBox(
            height: Get.mediaQuery.size.height * 0.3,
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.9,
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
                    final selectedCommunityId = controller.selectedCommunityId;

                    return ProfileCommunityCard(
                      community.name,
                      imagePath: community.iconUrl,
                      isSelected: selectedCommunityId == community.id,
                    );
                  }),
                );
              },
            ),
          ),
          DeGaps.v16,
          Obx(() {
            final selectedCommunityId = controller.selectedCommunityId;

            return DeButtonLarge(
              ProfileConstants.PROFILE_REGISTER,
              onPressed: () {
                controller.setCommunityId(
                  communityId: selectedCommunityId,
                );
                Get.back();
              },
              enable: selectedCommunityId > 0,
            );
          }),
          DeGaps.v16,
        ],
      ),
    );
  }
}
