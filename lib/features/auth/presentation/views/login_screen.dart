import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/widgets/debate_scaffold.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DebateScaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '대한민국은 지금,',
              style: body16M,
            ),
            Text(
              '토론철',
              style: TextStyle(
                color: grey10,
                fontSize: 48,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              color: white,
              width: 210,
              height: 210,
            ),
          ],
        ),
      ),
      bottomNavigationBar: _btmNavBar(),
    );
  }

  Widget _btmNavBar() {
    return _widgetLoginBtn();
  }

  // TODO 카카오,애플 권장디자인으로 변경
  Widget _widgetLoginBtn() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      padding: EdgeInsets.symmetric(vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: grey80,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '카카오로 로그인',
        style: body16M.copyWith(color: white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
