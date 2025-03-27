import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/type/province_type.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/profile_input_view_model.dart';
import 'package:debateseason_frontend_v1/widgets/import_de.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileLocationBottomSheet extends GetView<ProfileInputViewModel> {
  final String title;

  const ProfileLocationBottomSheet({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return DeGestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        decoration: BoxDecoration(
          color: DeColors.grey80,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: _widgetGrabber()),
            DeGaps.v16,
            _widgetHeader(context: context),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: DeColors.grey90, width: 2),
                  bottom: BorderSide(color: DeColors.grey90, width: 2),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: ListView.builder(
                        itemCount: ProvinceType.values.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final province = ProvinceType.values[index];

                          return Obx(() {
                            final isSelected =
                                controller.selectedProvince == province;

                            return DeGestureDetector(
                              onTap: () {
                                controller.setSelectedProvince(
                                    province: province);
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                color: isSelected
                                    ? DeColors.grey80
                                    : DeColors.grey90,
                                child: DeText(
                                  province.name,
                                  style: DeFonts.body16Sb
                                      .copyWith(color: DeColors.grey30),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: 2,
                    height: MediaQuery.of(context).size.height * 0.7,
                    color: DeColors.grey90,
                  ),
                  Expanded(
                    child: Obx(() {
                      final selectedProvince = controller.selectedProvince;
                      final selectedDistrict =
                          controller.selectedDistrict; // 선택된 district 가져오기

                      return Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        color: DeColors.grey70,
                        child: ListView.builder(
                          itemCount: controller
                              .getDistrictList(selectedProvince)
                              .length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final district = controller
                                .getDistrictList(selectedProvince)[index];
                            final isSelected = selectedDistrict == district;

                            return DeGestureDetector(
                              onTap: () {
                                controller.setSelectedDistrict(
                                  district,
                                );
                              },
                              child: Container(
                                color: isSelected
                                    ? DeColors.grey70
                                    : DeColors.grey80,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: DeText(
                                  district.name,
                                  style: DeFonts.body16Sb
                                      .copyWith(color: DeColors.grey30),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _widgetGrabber() {
    return Container(
      width: 40,
      height: 5,
      margin: DeDimensions.all8,
      decoration: BoxDecoration(
        color: DeColors.grey50,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget _widgetHeader({required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24, 0, 24, 16),
      child: Row(
        children: [
          Expanded(
            child: DeText(
              title,
              style: DeFonts.header18Sb,
            ),
          ),
          DeGestureDetector(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: DeDimensions.all10,
              child: SvgPicture.asset(
                DeIcons.icXGrey50,
                width: 20,
                height: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
