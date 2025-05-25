import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:flutter/material.dart';

class HomeTabBar extends StatelessWidget {
  final TabController tabController;
  final List<Tab> tabs;

  const HomeTabBar({
    required this.tabController,
    required this.tabs,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: tabs,
      isScrollable: true,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        border: Border(
          bottom: BorderSide(color: DeColors.grey10, width: 2),
        ),
      ),
      dividerColor: DeColors.grey100,
      dividerHeight: 1,
      labelColor: DeColors.grey10,
      labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      labelPadding: const EdgeInsets.only(right: 16),
      unselectedLabelColor: DeColors.grey50,
      unselectedLabelStyle:
          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      enableFeedback: false,
      splashFactory: NoSplash.splashFactory,
      tabAlignment: TabAlignment.start,
    );
  }
}
