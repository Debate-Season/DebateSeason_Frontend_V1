import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/widgets/import_de.dart';
import 'package:flutter/material.dart';

class DebateTopicScreen extends StatefulWidget {
  const DebateTopicScreen({super.key});

  @override
  State<DebateTopicScreen> createState() => _DebateTopicScreenState();
}

class _DebateTopicScreenState extends State<DebateTopicScreen> {
  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      appBar: DeAppBar(
          title: Text(
        "토론주제",
        style: DeFonts.header,
      )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            DeGaps.v24,
            Text("생성일",
                style: DeFonts.body14M.copyWith(color: DeColors.grey50)),
            DeGaps.v4,
            Text("2024.11.7", style: DeFonts.body16M),
            DeGaps.v32,
            Expanded(child: ScollableListView()),
            SizedBox(height: 123),
            DeButtonLarge("선택하기", onPressed: () {}),
            // ListView with fading edges
          ],
        ),
      ),
    );
  }
}

class ScollableListView extends StatefulWidget {
  const ScollableListView({super.key});

  @override
  State<ScollableListView> createState() => _ScollableListViewState();
}

class _ScollableListViewState extends State<ScollableListView> {
  final List<String> items = List.generate(50, (index) => '아이템 ${index + 1}');
  late final PageController _pageController = PageController(
      viewportFraction: 0.2, initialPage: (items.length / 2).toInt());

  int _currentIndex = 0; // 현재 페이지 인덱스를 저장하는 변수

  @override
  void initState() {
    super.initState();
    // PageController에 리스너를 추가하여 페이지 변경을 추적
    _pageController.addListener(() {
      int page = _pageController.page?.round() ?? 0; // 현재 페이지의 인덱스
      if (_currentIndex != page) {
        setState(() {
          _currentIndex = page; // 페이지가 바뀌면 인덱스 갱신
        });
      }
    });

    setState(() {
      _currentIndex = (items.length / 2).toInt(); // 페이지가 바뀌면 인덱스 갱신
    });
  }

  @override
  void dispose() {
    _pageController.dispose(); // 리소스 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (context, index) {
        TextStyle style = DeFonts.body16M.copyWith(color: DeColors.grey70);
        if (index == _currentIndex - 1) {
          style = DeFonts.body16M.copyWith(color: DeColors.grey50);
        } else if (index == _currentIndex) {
          style = DeFonts.body16M;
        } else if (index == _currentIndex + 1) {
          style = DeFonts.body16M.copyWith(color: DeColors.grey50);
        }

        return Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          padding: EdgeInsets.all(16.0),
          child: Center(child: Text(items[index], style: style)),
        );
      },
    );
  }
}
