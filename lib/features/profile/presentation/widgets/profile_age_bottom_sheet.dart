import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/profile_input_view_model.dart';
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
                child: ProfileTextCard(
                  age,
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
