import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/category/domain/entities/category_entity.dart';
import 'package:debateseason_frontend_v1/features/category/presentation/view_models/category_view_model.dart';
import 'package:debateseason_frontend_v1/utils/date_format_util.dart';
import 'package:debateseason_frontend_v1/widgets/import_de.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoryScreen extends GetView<CategoryViewModel> {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: DeColors.grey110,
      title: Image.asset(
        'assets/images/img_debate_logo.png',
        width: 84,
        height: 24,
      ),
      actions: [
        DeGestureDetector(
          onTap: () {
            Get.toNamed(GetRouterName.profile);
          },
          child: Padding(
            padding: Dimensions.all8,
            child: SvgPicture.asset('assets/icons/ic_profile_grey10.svg'),
          ),
        ),
        Gaps.h20,
      ],
      elevation: 0,
      scrolledUnderElevation: 0,
      titleSpacing: 20,
      automaticallyImplyLeading: false,
    );
  }

  Widget _body() {
    return Padding(
      padding: Dimensions.padding20x12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _categoryTitle(),
          Gaps.v12,
          _categoryList(),
        ],
      ),
    );
  }

  Widget _categoryTitle() {
    return DeGestureDetector(
      onTap: () {},
      child: DeText(
        '전체',
        style: headerLarge,
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
                '데이터가 없습니다.',
                style: body16Sb.copyWith(color: DeColors.grey50),
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
                  padding: Dimensions.vertical16,
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
              style: body16Sb.copyWith(color: DeColors.red),
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
                  style: body16Sb,
                ),
                Gaps.v4,
                Row(
                  children: [
                    DeText(
                      '생성일',
                      style: cation12M.copyWith(color: DeColors.grey50),
                    ),
                    Gaps.h2,
                    DeText(
                      DateFormatUtil.yyyyMD(dateTime: category.createdAt),
                      style: cation12M.copyWith(color: DeColors.grey30),
                    ),
                    Gaps.h8,
                    DeText(
                      '토론주제',
                      style: cation12M.copyWith(color: DeColors.grey50),
                    ),
                    Gaps.h2,
                    DeText(
                      category.countChatRoom.toString(),
                      style: cation12M.copyWith(color: DeColors.grey30),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: Dimensions.all8,
            child: SvgPicture.asset('assets/icons/ic_arrow_right_grey50.svg'),
          ),
        ],
      ),
    );
  }
}
