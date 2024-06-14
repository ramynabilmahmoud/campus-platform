import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:main_platform/core/services/socketio.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  SocketIoService socketIo = SocketIoService("wss://localhost:1661/");

  ChatCubit() : super(ChatState()) {
    socketIo.connect();
    fetchMessages();
  }

  void fetchMessages() {}

  void sendMessage(String message) {
    final messages = [...state.messages];
    messages.add(Message(message: message, isMe: true));
    emit(ChatState()..messages = messages);
  }

  void receiveMessage(String message) {
    final messages = [...state.messages];
    messages.add(Message(message: message, isMe: false));
    emit(ChatState()..messages = messages);
  }
}
