import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:flutter/material.dart';

class HomeTabBar extends StatelessWidget {
  final TabController tabController;
  final List<String > tabs;

  const HomeTabBar({
    required this.tabController,
    required this.tabs,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // return TabBar(
    //   controller: tabController,
    //   tabs: tabs,
    //   isScrollable: true,
    //   indicator: BoxDecoration(
    //     borderRadius: BorderRadius.circular(0),
    //     border: Border(
    //       bottom: BorderSide(color: DeColors.grey10, width: 2),
    //     ),
    //   ),
    //   dividerColor: DeColors.grey100,
    //   dividerHeight: 1,
    //   labelColor: DeColors.grey10,
    //   labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //   labelPadding: const EdgeInsets.only(right: 16),
    //   unselectedLabelColor: DeColors.grey50,
    //   unselectedLabelStyle:
    //       TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //   enableFeedback: false,
    //   splashFactory: NoSplash.splashFactory,
    //   tabAlignment: TabAlignment.start,
    // );
    return AnimatedBuilder(
      animation: tabController,
      builder: (context, _) {
        return TabBar(
          controller: tabController,
          isScrollable: false,
          labelPadding: EdgeInsets.zero,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: const BoxDecoration(),
          dividerColor: DeColors.grey110,
          dividerHeight: 1,
          labelColor: DeColors.grey110,
          labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          unselectedLabelColor: DeColors.grey50,
          unselectedLabelStyle:
          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          enableFeedback: false,
          splashFactory: NoSplash.splashFactory,
          tabAlignment: TabAlignment.fill,
          tabs: tabs.asMap().entries.map((entry) {
            final i = entry.key;
            final txt = entry.value;
            final selected = tabController.index == i;

            return Container(
              height: 40,
              decoration: BoxDecoration(
                color: selected
                    ? DeColors.grey10
                    : DeColors.grey110,
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.center,
              child: Text(
                txt,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight:
                  selected ? FontWeight.w600 : FontWeight.w500,
                  color: selected
                      ? DeColors.grey110
                      : DeColors.grey50,
                ),
              ),
            );
          }).toList(),
        );
      }
    );
  }
}
