import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/profile_input_view_model.dart';
import 'package:debateseason_frontend_v1/features/profile/profile_constants.dart';
import 'package:debateseason_frontend_v1/widgets/de_button_large.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_text_card.dart';

class ProfileAgeBottomSheet extends GetView<ProfileInputViewModel> {
  const ProfileAgeBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
          itemCount: ProfileConstants.PROFILE_AGE_RANGE.length,
          itemBuilder: (context, index) {
            final age = ProfileConstants.PROFILE_AGE_RANGE[index];

            return Obx(() {
              final selectedAge = controller.selectedAge;

              return DeGestureDetector(
                onTap: () => controller.setSelectedAge(selectedAge: age),
                child: ProfileTextCard(
                  age,
                  isSelected:
                      selectedAge == ProfileConstants.PROFILE_AGE_RANGE[index],
                ),
              );
            });
          },
        ),
        DeGaps.v16,
        Obx(() {
          final selectedAge = controller.selectedAge;

          return DeButtonLarge(
            ProfileConstants.PROFILE_CHOICE,
            onPressed: () {
              controller.setAgeRange(ageRange: selectedAge);
              Get.back();
            },
            enable: selectedAge.isNotEmpty,
          );
        }),
        DeGaps.v16,
      ],
    );
  }
}
