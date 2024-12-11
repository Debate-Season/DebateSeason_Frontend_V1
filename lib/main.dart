import 'package:debateseason_frontend_v1/data/repositories/auth_repository.dart';
import 'package:debateseason_frontend_v1/features/auth/view/login_screen.dart';
import 'package:debateseason_frontend_v1/features/auth/view_model/auth_view_model.dart';
import 'package:debateseason_frontend_v1/features/chat/view/chat_room_screen.dart';
import 'package:debateseason_frontend_v1/features/chat/view/chat_topic_detail_screen.dart';
import 'package:debateseason_frontend_v1/features/chat/view/home_screen.dart';
import 'package:debateseason_frontend_v1/features/chat/view_model/chat_room_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ChatRoomViewModel>(
          create: (_) => ChatRoomViewModel(),
        ),
        ChangeNotifierProvider<AuthViewModel>(
          create: (_) => AuthViewModel(AuthRepository()),
        ),
      ],
      child: MaterialApp(
        title: '토론철',
        theme: ThemeData(
          primaryColor: Colors.purpleAccent,
        ),
        home: LoginScreen(),
        initialRoute: '/',
        routes: {
          //  '/': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
          '/chat-topic': (context) => ChatTopicDetailScreen(topic: 'Topic111'),
          '/chat': (context) => ChatRoomScreen(),
        },
      ),
    );
  }
}
