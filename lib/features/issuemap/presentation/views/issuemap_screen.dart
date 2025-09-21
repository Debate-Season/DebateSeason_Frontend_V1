import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/issuemap/category_constants.dart';
import 'package:debateseason_frontend_v1/features/issuemap/domain/entities/category_entity.dart';
import 'package:debateseason_frontend_v1/features/issuemap/presentation/view_models/issuemap_view_model.dart';
import 'package:debateseason_frontend_v1/utils/date_format_util.dart';
import 'package:debateseason_frontend_v1/utils/exit_app_util.dart';
import 'package:debateseason_frontend_v1/widgets/import_de.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class IssuemapScreen extends GetView<IssuemapViewModel> {
  const IssuemapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        ExitAppUtil.onWillPop();
      },
      child: DeScaffold(
        appBar: _appBar(),
        body: _body(),
      ),
    );
  }

  DeAppBar _appBar() {
    return DeAppBar(
      isBack: false,
      title: DeText(
        '이슈맵',
        style: DeFonts.header20B,
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: DeDimensions.padding20x12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _categoryTitle(),
          DeGaps.v12,
          _categoryList(),
        ],
      ),
    );
  }

  Widget _categoryTitle() {
    return DeGestureDetector(
      onTap: () {},
      child: DeText(
        CategoryConstants.allCategory,
        style: DeFonts.header28Sb,
      ),
    );
  }

  Widget _categoryList() {
    return Obx(() {
      final categoryList = controller.categories;

      return categoryList.when(
        loading: () {
          return const Center(
            child: DeProgressIndicator(),
          );
        },
        success: (categoryList) {
          if (categoryList.isEmpty) {
            return Center(
              child: DeText(
                CategoryConstants.noData,
                style: DeFonts.body16Sb.copyWith(color: DeColors.grey50),
              ),
            );
          }

          return Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                final category = categoryList[index];

                return _categoryItem(category: category);
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding: DeDimensions.vertical16,
                  child: Divider(
                    height: 1,
                    color: DeColors.grey100,
                  ),
                );
              },
            ),
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

  Widget _categoryItem({required CategoryEntity category}) {
    return DeGestureDetector(
      onTap: () {
        Get.toNamed(GetRouterName.issue, arguments: {
          'issue_id': category.issueId,
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DeText(
                  category.title,
                  style: DeFonts.body16Sb,
                ),
                DeGaps.v4,
                Row(
                  children: [
                    DeText(
                      CategoryConstants.issueCreateDate,
                      style:
                          DeFonts.caption12M.copyWith(color: DeColors.grey50),
                    ),
                    DeGaps.h2,
                    DeText(
                      DateFormatUtil.yyyyMD(dateTime: category.createdAt),
                      style:
                          DeFonts.caption12M.copyWith(color: DeColors.grey30),
                    ),
                    DeGaps.h8,
                    DeText(
                      CategoryConstants.debateTopic,
                      style:
                          DeFonts.caption12M.copyWith(color: DeColors.grey50),
                    ),
                    DeGaps.h2,
                    DeText(
                      category.countChatRoom.toString(),
                      style:
                          DeFonts.caption12M.copyWith(color: DeColors.grey30),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: DeDimensions.all8,
            child: SvgPicture.asset(DeIcons.icArrowRightGrey50),
          ),
        ],
      ),
    );
  }
}
