import 'package:debateseason_frontend_v1/features/home/presentation/view_models/home_view_model.dart';
import 'package:debateseason_frontend_v1/features/home/presentation/views/home_screen_content.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeViewModel> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      body: HomeScreenContent(),
    );
  }
}
