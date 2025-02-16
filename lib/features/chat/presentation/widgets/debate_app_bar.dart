import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DebateAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget titleWidget;
  final bool isBack;
  final List<Widget>? actions;

  const DebateAppBar({
    super.key,
    required this.titleWidget,
    this.isBack = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: DeColors.grey110,
      leading: isBack ? _backBtn() : null,
      title: titleWidget,
      actions: actions,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: isBack,
      titleSpacing: isBack ? 0 : 20,
    );
  }

  Widget _backBtn() {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Row(
        children: [
          Gaps.h12,
          Padding(
            padding: Dimensions.all8,
            child: SvgPicture.asset('assets/icons/ic_back_grey50.svg'),
          ),
          Gaps.h4,
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
