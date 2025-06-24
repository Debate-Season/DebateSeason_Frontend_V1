import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/type/district_type.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/type/province_type.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/profile_input_view_model.dart';
import 'package:debateseason_frontend_v1/features/profile/profile_constants.dart';
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
                    child: _widgetProvince(context: context),
                  ),
                  Container(
                    width: 2,
                    height: MediaQuery.of(context).size.height * 0.7,
                    color: DeColors.grey90,
                  ),
                  Expanded(
                    child: _widgetDistrict(context: context),
                  ),
                ],
              ),
            ),
            _widgetBottomButton(),
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

  Widget _widgetProvince({required BuildContext context}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView.builder(
        itemCount: ProvinceType.values.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final province = ProvinceType.values[index];

          return Obx(() {
            var isSelected = false;
            if (title == ProfileConstants.PROFILE_RESIDENCE) {
              isSelected = controller.selectedResidenceProvince == province;
            } else {
              isSelected = controller.selectedHomeTownProvince == province;
            }

            return DeGestureDetector(
              onTap: () {
                if (title == ProfileConstants.PROFILE_RESIDENCE) {
                  controller.setSelectedResidenceProvince(province: province);
                } else {
                  controller.setSelectedHomeTownProvince(province: province);
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                color: isSelected ? DeColors.grey80 : DeColors.grey90,
                child: DeText(
                  province.name,
                  style: DeFonts.body16Sb.copyWith(color: DeColors.grey30),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          });
        },
      ),
    );
  }

  Widget _widgetDistrict({required BuildContext context}) {
    return Obx(() {
      ProvinceType selectedProvince = ProvinceType.seoul;
      DistrictType? selectedDistrict;
      if (title == ProfileConstants.PROFILE_RESIDENCE) {
        selectedProvince = controller.selectedResidenceProvince;
        selectedDistrict = controller.selectedResidenceDistrict;
      } else {
        selectedProvince = controller.selectedHomeTownProvince;
        selectedDistrict = controller.selectedHomeTownDistrict;
      }

      return Container(
        height: MediaQuery.of(context).size.height * 0.7,
        color: DeColors.grey80,
        child: ListView.builder(
          itemCount: controller.getDistrictList(selectedProvince).length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final district =
                controller.getDistrictList(selectedProvince)[index];
            final isSelected = selectedDistrict == district;

            return DeGestureDetector(
              onTap: () {
                if (title == ProfileConstants.PROFILE_RESIDENCE) {
                  controller.setSelectedResidenceDistrict(district);
                } else {
                  controller.setSelectedHomeTownDistrict(district);
                }
              },
              child: Container(
                color: isSelected ? DeColors.grey70 : DeColors.grey80,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: DeText(
                  district.name,
                  style: DeFonts.body16Sb.copyWith(color: DeColors.grey30),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
      );
    });
  }

  Widget _widgetBottomButton() {
    return Obx(() {
      String selectedProvince = ProvinceType.seoul.name;
      String selectedDistrict = '';

      if (title == ProfileConstants.PROFILE_RESIDENCE) {
        selectedProvince = controller.selectedResidenceProvince.name;
        selectedDistrict = controller.selectedResidenceDistrict?.name ?? '';
      } else {
        selectedProvince = controller.selectedHomeTownProvince.name;
        selectedDistrict = controller.selectedHomeTownDistrict?.name ?? '';
      }

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: DeButtonLarge(
          ProfileConstants.PROFILE_CHOICE,
          onPressed: () {
            if (title == ProfileConstants.PROFILE_RESIDENCE) {
              controller.residenceController.text =
                  '$selectedProvince $selectedDistrict';
            } else {
              controller.homeTownController.text =
                  '$selectedProvince $selectedDistrict';
            }
            Get.back();
          },
          enable: selectedDistrict.isNotEmpty,
        ),
      );
    });
  }
}
