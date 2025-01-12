import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:debateseason_frontend_v1/widgets/de_text.dart';

class DebateAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBack;
  final List<Widget>? actions;

  const DebateAppBar({
    super.key,
    required this.title,
    this.isBack = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: grey110,
      leading: isBack ? _backBtn() : null,
      title: _title(),
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

  Widget _title() {
    return Row(
      children: [
        Gaps.h12,
        Expanded(
          child: Column(
            children: [
              DeText('이슈이슈이슈이', style: cation12SB.copyWith(color: grey10)),
              DeText('토론방', style: cation12M.copyWith(color: grey50)),
            ],
          ),
        ),
        Gaps.h12,
        Padding(
          padding: Dimensions.all8,
          child: SvgPicture.asset(''),
        ),
        Gaps.h12,
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
