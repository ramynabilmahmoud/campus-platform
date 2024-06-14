import 'package:socket_io_client/socket_io_client.dart';

class SocketIoService {
  final String url;

  Socket socket = io(
      "wss://localhost:1661/",
      OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build());

  Future<void> connect() async {
    try {
      socket.connect();
      socket.on("send_message", (data) => print);
    } catch (error) {}
  }

  SocketIoService(this.url);

  void disconnect() {
    socket.disconnect();
  }

  // Stream<dynamic> onEvent(String eventName) {
  //   return socket.on(eventName);
  // }

  // void emit(String eventName, dynamic data) {
  //   socket.emit(eventName, data);
  // }

  // void sendMessage(String message) {
  //   socket.emit('send_message', message);
  // }

  // void listenForMessages(ChatCubit chatCubit) {
  //   socket.on('receive_message', (data) {
  //     chatCubit.receiveMessage(data as String);
  //   });
  // }

  // void disconnect() {
  //   socket.disconnect();
  // }
}
