import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/features/home/presentation/view_models/media_view_model.dart';
import 'package:debateseason_frontend_v1/features/home/presentation/view_models/recommend_view_model.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<RecommendViewModel> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      body: Obx(
        () => Text(
          controller.recommendData.when(
            loading: () => '로딩중',
            success: (issueData) => 'recommendData.title',
            failure: (error) => error,
          ),
          style: DeFonts.header18Sb,
        ),
      ),
    );
  }
}
