class MessageModel {
  final String sender;
  final String content;
  //final DateTime timestamp;
  final String category;

  MessageModel(
      {required this.sender, required this.category, required this.content});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      sender: json['sender'],
      category: json['category'],
      content: json['content'],
      //timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'category': category,
      'content': content,
      //'timestamp': timestamp.toIso8601String(),
    };
  }
}
