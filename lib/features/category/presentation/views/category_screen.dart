import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/features/category/presentation/view_models/category_view_model.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

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
      backgroundColor: grey110,
      title: Image.asset(
        'assets/images/img_debate_logo.png',
        width: 84,
        height: 24,
      ),
      actions: [
        DeGestureDetector(
          onTap: () {
            // todo Profile 화면전환
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
    return DeText(
      '전체',
      style: headerLarge,
    );
  }

  Widget _categoryList() {
    // return ListView.separated(
    //   itemCount: itemCount,
    //   itemBuilder: (context, index) {
    //     return _categoryItem();
    //   },
    //   separatorBuilder: (context, index) {
    //     return Padding(
    //       padding: Dimensions.vertical16,
    //       child: Divider(
    //         height: 1,
    //         color: grey100,
    //       ),
    //     );
    //   },
    // );

    return _categoryItem();
  }

  Widget _categoryItem() {
    return DeGestureDetector(
      onTap: () {
        // todo 이슈 상세 화면전환
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DeText(
                '이슈명',
                style: body16Sb,
              ),
              Gaps.v4,
              Row(
                children: [
                  DeText(
                    '생성일',
                    style: cation12M.copyWith(color: grey50),
                  ),
                  Gaps.h2,
                  DeText(
                    '2024.6.11',
                    style: cation12M.copyWith(color: grey30),
                  ),
                  Gaps.h8,
                  DeText(
                    '토론주제',
                    style: cation12M.copyWith(color: grey50),
                  ),
                  Gaps.h2,
                  DeText(
                    '7',
                    style: cation12M.copyWith(color: grey30),
                  ),
                ],
              ),
            ],
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
