import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBack;
  final List<Widget>? actions;

  const DeAppBar({
    super.key,
    required this.title,
    this.isBack = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: grey110,
      leading: GestureDetector(
        onTap: () => Get.back(),
        child: Row(
          children: [
            Gaps.h12,
            Padding(
              padding: Dimensions.all8,
              child: SvgPicture.asset('assets/icons/ic_back_grey50.svg'),
            ),
            Gaps.h8,
          ],
        ),
      ),
      title: Text(
        title,
        style: header,
      ),
      actions: [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
