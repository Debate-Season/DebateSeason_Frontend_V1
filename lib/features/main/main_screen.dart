import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/features/category/presentation/views/category_screen.dart';
import 'package:debateseason_frontend_v1/features/home/home_screen.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/views/profile_screen.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'main_view_model.dart';

class MainScreen extends GetView<MainViewModel> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _body() {
    return Obx(
      () {
        return IndexedStack(
          index: controller.selectedIndex,
          children: [
            HomeScreen(),
            CategoryScreen(),
            ProfileScreen(),
          ],
        );
      },
    );
  }

  Widget _bottomNavigationBar() {
    return Obx(() {
      return Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          onTap: controller.changeTabIndex,
          selectedItemColor: DeColors.brandColor,
          unselectedItemColor: DeColors.grey30,
          selectedLabelStyle: DeFonts.caption12M2.copyWith(
            color: DeColors.brandColor,
          ),
          unselectedLabelStyle: DeFonts.caption12M2.copyWith(
            color: DeColors.grey30,
          ),
          backgroundColor: DeColors.grey120,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          enableFeedback: false,
          useLegacyColorScheme: false,
          items: [
            BottomNavigationBarItem(
              icon: _buildNavBarIcon(
                'assets/icons/ic_home_grey30.svg',
                '홈',
                DeColors.grey30,
              ),
              activeIcon: _buildNavBarIcon(
                'assets/icons/ic_home_brand.svg',
                '홈',
                DeColors.brandColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildNavBarIcon(
                'assets/icons/ic_issuemap_grey30.svg',
                '이슈맵',
                DeColors.grey30,
              ),
              activeIcon: _buildNavBarIcon(
                'assets/icons/ic_issuemap_brand.svg',
                '이슈맵',
                DeColors.brandColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildNavBarIcon(
                'assets/icons/ic_profile_grey30.svg',
                '프로필',
                DeColors.grey30,
              ),
              activeIcon: _buildNavBarIcon(
                'assets/icons/ic_profile_brand.svg',
                '프로필',
                DeColors.brandColor,
              ),
              label: '',
            ),
          ],
        ),
      );
    });
  }

  Widget _buildNavBarIcon(String assetPath, String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(assetPath),
        DeGaps.v6,
        DeText(
          label,
          style: TextStyle(fontSize: 12, color: color),
        ),
      ],
    );
  }
}
