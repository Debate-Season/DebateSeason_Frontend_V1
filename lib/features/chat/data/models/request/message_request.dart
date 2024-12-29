class MessageRequest {
  final String sender;
  final String content;

  MessageRequest({
    required this.sender,
    required this.content,
  });

  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'content': content,
    };
  }
}