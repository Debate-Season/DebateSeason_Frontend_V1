import 'package:debateseason_frontend_v1/view/chat_room_screen.dart';
import 'package:debateseason_frontend_v1/view_model/chat_room_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatRoomViewModel()),
      ],
      child: MaterialApp(
        title: '토론철',
        theme: ThemeData(
          primaryColor: Colors.purpleAccent,
        ),
        home: ChatRoomScreen(),
      ),
    );
  }
}
