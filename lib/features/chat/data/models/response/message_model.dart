class MessageModel {
  final String sender;
  final String content;
  final String category;

  MessageModel(
      {required this.sender, required this.content, required this.category});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      sender: json['sender'],
      content: json['content'],
      category: json['category'],
    );
  }
}
