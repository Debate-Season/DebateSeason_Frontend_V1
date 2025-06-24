import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/type/image_type.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/profile_image_view_model.dart';
import 'package:debateseason_frontend_v1/features/profile/profile_constants.dart';
import 'package:debateseason_frontend_v1/utils/de_snack_bar.dart';
import 'package:debateseason_frontend_v1/widgets/de_app_bar.dart';
import 'package:debateseason_frontend_v1/widgets/de_button_large.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileImageScreen extends GetView<ProfileImageViewModel> {
  const ProfileImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  DeAppBar _appBar() {
    return DeAppBar(
      title: Text(
        '프로필 사진 등록하기',
        style: DeFonts.header20B,
      ),
      isBack: false,
    );
  }

  Widget _body() {
    return Column(
      children: [
        DeGaps.v40,
        _widgetMainImage(),
        DeGaps.v32,
        _widgetImages(),
        Spacer(),
        _widgetBottomButton(),
      ],
    );
  }

  Widget _widgetMainImage() {
    return Obx(() {
      final selectedImage = controller.selectedImage;

      return Container(
        width: 120,
        height: 120,
        margin: EdgeInsets.symmetric(horizontal: 120),
        decoration: BoxDecoration(
          color: selectedImage.color,
          shape: BoxShape.circle,
        ),
      );
    });
  }

  Widget _widgetImages() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DeText(
            '색상',
            style: DeFonts.caption12SB.copyWith(color: DeColors.grey50),
          ),
        ),
        DeGaps.v12,
        SizedBox(
          height: 107,
          child: ListView.separated(
            controller: controller.scrollController,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: ImageType.values.length,
            itemBuilder: (context, index) {
              final imageItem = ImageType.values[index];

              return _widgetImageCard(item: imageItem);
            },
            separatorBuilder: (context, index) => DeGaps.h8,
          ),
        )
      ],
    );
  }

  Widget _widgetImageCard({required ImageType item}) {
    return DeGestureDetector(
      onTap: () => controller.setImage(imageType: item),
      child: Obx(() {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: item == controller.selectedImage
                ? Border.all(color: DeColors.brand, width: 2)
                : Border.all(color: DeColors.grey90, width: 1),
          ),
          child: Column(
            children: [
              Container(
                width: item == controller.selectedImage ? 42 : 41,
                height: item == controller.selectedImage ? 42 : 41,
                decoration: BoxDecoration(
                  color: item.color,
                  shape: BoxShape.circle,
                ),
              ),
              DeGaps.v6,
              DeText(
                item.name,
                style: DeFonts.caption12SB,
              )
            ],
          ),
        );
      }),
    );
  }

  Widget _widgetBottomButton() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: DeButtonLarge(
          controller.isModifyScreen
              ? ProfileConstants.PROFILE_MODIFY_BTN_TEXT
              : ProfileConstants.PROFILE_CREATE_BTN_TEXT,
          onPressed: controller.isModifyScreen
              ? () => Get.back()
              : () => controller.postProfile().then((result) {
                    result.when(loading: () {
                      controller.setApiLoading(isApiLoading: true);
                    }, success: (_) {
                      controller.setApiLoading(isApiLoading: false);
                      Get.offAllNamed(GetRouterName.main);
                    }, failure: (msg) {
                      controller.setApiLoading(isApiLoading: false);
                      deSnackBar(msg);
                    });
                  }),
        ),
      );
    });
  }
}
