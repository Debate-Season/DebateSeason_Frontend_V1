import 'package:debateseason_frontend_v1/features/chat/view/chat_room_screen.dart';
import 'package:flutter/material.dart';

class ChatTopicDetailScreen extends StatelessWidget {
  final String topic;

  ChatTopicDetailScreen({required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Topic: $topic',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Here is some information about the topic...',
              style: TextStyle(fontSize: 18),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatRoomScreen(),
                  ),
                );
              },
              child: Text('Open BottomShet'),
            )
          ],
        ),
      ),
    );
  }
}
