part of 'chat_cubit.dart';

class ChatState extends Equatable {
  List<Message> messages = [
    const Message(message: "FFF", isMe: true),
    const Message(message: "FFFR", isMe: false)
  ];

  ChatState();

  @override
  List<Object?> get props => [messages];
}

class Message {
  final String message;
  final bool isMe;

  const Message({required this.message, required this.isMe});
}
