import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/features/home/presentation/widgets/home_tab_bar.dart';
import 'package:debateseason_frontend_v1/features/home/presentation/widgets/home_tab_view.dart';
import 'package:debateseason_frontend_v1/utils/amplitude_util.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:flutter/material.dart';

import 'home_media_page.dart';
import 'home_recommend_page.dart';

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> tabs = ['미디어', '이슈 · 토론'];

  @override
  void initState() {
    super.initState();
    AmplitudeUtil.trackEvent(eventName: 'Home');
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;

      final eventNames = ['홈탭미디어', '홈탭이슈·토론'];
      AmplitudeUtil.trackEvent(eventName: eventNames[_tabController.index])
          .then((_) {
        log.d(eventNames[_tabController.index]);
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        // SliverAppBar(
        //   pinned: true,
        //   floating: false,
        //   titleSpacing: 0,
        //   title: _headlineNews(),
        //   backgroundColor: DeColors.grey120,
        //   surfaceTintColor: Colors.transparent,
        // ),
        SliverPersistentHeader(
          pinned: false,
          delegate: _TabBarDelegate(Padding(
            padding: DeDimensions.horizontal20,
            child: HomeTabBar(
              tabController: _tabController,
              tabs: tabs,
            ),
          )),
        ),
      ],
      body: HomeTabView(
        tabController: _tabController,
        tabViews: [
          HomeMediaPage(),
          HomeRecommendPage(),
        ],
      ),
    );
  }

/* Widget _headlineNews() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: DeDimensions.padding10x8,
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
      ),
    );
  }*/
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _TabBarDelegate(this.child);

  @override
  double get minExtent => kToolbarHeight;

  @override
  double get maxExtent => kToolbarHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant _TabBarDelegate oldDelegate) => false;
}
