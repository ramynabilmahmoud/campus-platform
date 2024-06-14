import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_platform/app/presentation/bloc/chat/chat_cubit.dart';

@RoutePage()
class ChatChannelScreen extends StatefulWidget {
  const ChatChannelScreen({super.key});

  @override
  State<ChatChannelScreen> createState() => _ChatChannelScreenState();
}

class _ChatChannelScreenState extends State<ChatChannelScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Chat"),
        ),
        body: Stack(children: [
          BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              return SingleChildScrollView(
                  child: Column(
                      children: List.generate(state.messages.length, (index) {
                final message = state.messages[index];
                return BubbleSpecialThree(
                    isSender: message.isMe,
                    text: message.message,
                    color: message.isMe
                        ? theme.colorScheme.primary
                        : theme.colorScheme.surface);
              })));
            },
          ),
          Builder(builder: (context) {
            return MessageBar(
              onSend: (message) {
                print(message);
                context.read<ChatCubit>().sendMessage(message);
              },
              actions: [
                InkWell(
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 24,
                  ),
                  onTap: () {},
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: InkWell(
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.green,
                      size: 24,
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            );
          }),
        ]),
      ),
    );
  }
}
