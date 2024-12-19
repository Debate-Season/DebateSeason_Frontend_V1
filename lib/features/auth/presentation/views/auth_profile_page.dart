import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:debateseason_frontend_v1/widgets/de_app_bar.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class AuthProfilePage extends GetView<AuthViewModel> {
  const AuthProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  DeAppBar _appBar() {
    return DeAppBar(title: '프로필 입력하기.');
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _widgetProfileColor(),
          _widgetNickName(),
          _widgetCommunity(),
          _widgetGender(),
          _widgetAge(),
        ],
      ),
    );
  }

  Widget _widgetProfileColor() {
    return Column(
      children: [
        DeText(
          '프로필 사진',
          style: body14Sb,
        ),
      ],
    );
  }

  Widget _widgetNickName() {
    return Column(
      children: [],
    );
  }

  Widget _widgetCommunity() {
    return Column(
      children: [],
    );
  }

  Widget _widgetGender() {
    return Column(
      children: [],
    );
  }

  Widget _widgetAge() {
    return Column(
      children: [],
    );
  }
}
