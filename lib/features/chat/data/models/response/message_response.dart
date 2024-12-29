class MessageResponse {
  final String sender;
  final String content;
  final String category;

  MessageResponse(
      {required this.sender, required this.content, required this.category});

  factory MessageResponse.fromJson(Map<String, dynamic> json) {
    return MessageResponse(
      sender: json['sender'],
      content: json['content'],
      category: json['category'],
    );
  }
}
