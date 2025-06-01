import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/features/home/presentation/views/home_screen_content.dart';
import 'package:debateseason_frontend_v1/widgets/de_app_bar.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      appBar: _appbar(),
      body: HomeScreenContent(),
    );
  }

  DeAppBar _appbar() {
    return DeAppBar(
      title: Row(
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
      isBack: false,
    );
  }
}
