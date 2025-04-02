import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/features/home/presentation/widgets/home_tab_bar.dart';
import 'package:debateseason_frontend_v1/features/home/presentation/widgets/home_tab_view.dart';
import 'package:debateseason_frontend_v1/widgets/de_app_bar.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  final List<String> tabs = ['추천', '미디어'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
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
        SliverAppBar(
          pinned: true,
          floating: false,
          title: _appbar(),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(57),
            child: _headlineNews(),
          ),
          backgroundColor: DeColors.grey120,
        ),
        SliverPersistentHeader(
          pinned: false,
          delegate: _TabBarDelegate(Padding(
            padding: DeDimensions.horizontal20,
            child: HomeTabBar(
              tabController: _tabController,
              tabs: tabs.map((e) => Tab(text: e)).toList(),
            ),
          )),
        ),
      ],
      body: HomeTabView(
        tabController: _tabController,
        tabViews: [
          HomeRecommendPage(),
          HomeMediaPage(),
        ],
      ),
    );
  }

  Widget _appbar() {
    return DeAppBar(
      title: Padding(
        padding: DeDimensions.padding20x16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/icons/ic_logo.svg',
              width: 24,
              height: 24,
            ),
            DeGaps.h4,
            SvgPicture.asset(
              'assets/icons/ic_debateseason.svg',
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
      isBack: false,
    );
  }

  Widget _headlineNews() {
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
  }
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
