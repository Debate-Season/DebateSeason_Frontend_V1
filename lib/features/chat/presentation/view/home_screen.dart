import 'package:flutter/material.dart';

import 'chat_topic_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<String> chatTopics = [
    'Chat Topic 1',
    'Chat Topic 2',
    'Chat Topic 3',
    'Chat Topic 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('토론철 메인화면')),
      body: ListView.builder(
          itemCount: chatTopics.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(chatTopics[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ChatTopicDetailScreen(topic: chatTopics[index]),
                  ),
                );
              },
            );
          }),
    );
  }
}
