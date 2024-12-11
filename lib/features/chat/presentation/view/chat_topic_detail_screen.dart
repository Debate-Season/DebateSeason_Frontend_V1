import 'package:flutter/material.dart';

import 'chat_room_screen.dart';

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
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return ChatRoomScreen(); // BottomSheet 내에 ChatRoomScreen 표시
                  },
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
