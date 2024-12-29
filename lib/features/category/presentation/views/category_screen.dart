import 'package:debateseason_frontend_v1/features/category/presentation/view_models/category_view_model.dart';
import 'package:debateseason_frontend_v1/widgets/de_app_bar.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:flutter/material.dart';
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

  DeAppBar _appBar() {
    return DeAppBar(title: '');
  }

  Widget _body() {
    return Column(
      children: [],
    );
  }
}
