import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final bool isBack;
  final List<Widget>? actions;
  final bool? isCenter;
  final Color? backgroundColor;
  final PreferredSize? bottom;

  const DeAppBar({
    super.key,
    required this.title,
    this.isBack = true,
    this.actions,
    this.isCenter,
    this.backgroundColor,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? DeColors.grey110,
      leading: isBack ? _backBtn() : null,
      title: title,
      actions: [
        if (actions != null) ...actions!,
        Gaps.h20,
      ],
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: isBack,
      titleSpacing: isBack ? 0 : 20,
      centerTitle: isCenter,
      bottom: bottom,
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
            child: SvgPicture.asset(DeIcons.ic_back_grey50),
          ),
          Gaps.h4,
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
