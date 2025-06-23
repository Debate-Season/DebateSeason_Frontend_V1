import 'package:debateseason_frontend_v1/features/home/presentation/views/home_screen_content.dart';
import 'package:debateseason_frontend_v1/utils/amplitude_util.dart';
import 'package:debateseason_frontend_v1/widgets/de_app_bar.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    AmplitudeUtil.trackEvent(eventName: 'Home');
  }

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      appBar: _appbar(),
      body: HomeScreenContent(),
    );
  }

  DeAppBar _appbar() {
    return DeAppBar(
      isBack: false,
      title: Image.asset(
        'assets/images/img_debate_logo.png',
        width: 84,
        height: 24,
      ),
    );
  }
}
