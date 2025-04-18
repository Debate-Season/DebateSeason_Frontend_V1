enum ChatMessageType {
  date('DATE'),
  chat('CHAT');

  final String value;

  const ChatMessageType(this.value);

  static ChatMessageType fromJson(String json) {
    return ChatMessageType.values.firstWhere(
      (e) => e.value == json,
      orElse: () => throw ArgumentError('Unknown OpinionType: $json'),
    );
  }

  static String toJsonUpper(ChatMessageType chatmessage) {
    return chatmessage.value.toUpperCase();
  }
}
