import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:flutter/material.dart';

class DeTabShort extends StatefulWidget {
  final List<String> tabs;
  final List<Widget> tabViews;

  const DeTabShort({
    super.key,
    required this.tabs,
    required this.tabViews,
  })  : assert(tabs.length == tabViews.length, "tabs와 tabViews의 길이가 같아야 함.");

  @override
  State<DeTabShort> createState() => _DeTabShortState();
}

class _DeTabShortState extends State<DeTabShort>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _tabBar(),
        Expanded(child: _tabBarView()),
      ],
    );
  }

  Widget _tabBar() {
    return TabBar(
      controller: _tabController,
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
      labelPadding: const EdgeInsets.only(right:16),
      unselectedLabelColor: DeColors.grey50,
      unselectedLabelStyle:
          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      enableFeedback: false,
      splashFactory: NoSplash.splashFactory,
      tabAlignment: TabAlignment.start,
      tabs: widget.tabs.map((tabTitle) => Tab(text: tabTitle)).toList(),
    );
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: _tabController,
      children: widget.tabViews,
    );
  }
}