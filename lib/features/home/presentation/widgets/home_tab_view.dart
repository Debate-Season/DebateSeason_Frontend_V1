import 'package:flutter/material.dart';

class HomeTabView extends StatelessWidget {
  final TabController tabController;
  final List<Widget> tabViews;

  const HomeTabView({
    super.key,
    required this.tabController,
    required this.tabViews,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: tabViews,
    );
  }
}
