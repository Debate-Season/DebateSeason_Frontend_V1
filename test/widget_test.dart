import 'package:debateseason_frontend_v1/view/chat_room_screen.dart';
import 'package:debateseason_frontend_v1/view_model/chat_room_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('채팅 메시지 전송 테스트', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ChatRoomViewModel()),
        ],
        child: MaterialApp(home: ChatRoomScreen()),
      ),
    );

    // 메시지 입력
    await tester.enterText(find.byType(TextField), 'Hello, World!');
    await tester.tap(find.byIcon(Icons.send));
    await tester.pump();

    // 메시지가 화면에 표시되는지 확인
    expect(find.text('Hello, World!'), findsOneWidget);
  });
}
