import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/features/home/presentation/view_models/home_view_model.dart';
import 'package:debateseason_frontend_v1/features/home/presentation/views/home_media_page.dart';
import 'package:debateseason_frontend_v1/features/home/presentation/views/home_recommend_page.dart';
import 'package:debateseason_frontend_v1/widgets/de_app_bar.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:debateseason_frontend_v1/widgets/de_tab_short.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeViewModel> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      appBar: _appbar(),
      body: _body(),
    );
  }

  DeAppBar _appbar() {
    return DeAppBar(
      title: SizedBox(
          width: 91,
          height: 31,
          child: Image.asset('assets/images/img_debate_logo.png')),
      isBack: false,
    );
  }

  Widget _body() {
    return Padding(
      padding: DeDimensions.padding20x12,
      child: Column(
        children: [
          _headlineNews(),
          Expanded(
            child: DeTabShort(
              tabs: ['추천', '미디어'],
              tabViews: [HomeRecommendPage(), HomeMediaPage()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _headlineNews() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: DeColors.grey110,
            borderRadius: BorderRadius.circular(10),
          ),
          child: DeText(
            '속보나올 자리',
            style: DeFonts.body14M,
          ),
        ),
        DeGaps.v4,
      ],
    );
  }
}
