import 'package:flutter/material.dart';

import '../../../constants/core/theme/app_colors.dart';
import '../../../global.dart';
import '../../../resources/chat_msgs.dart';

class ChatPage extends StatelessWidget {
  final String chatName;
  const ChatPage({super.key, required this.chatName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: Text(chatName),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                showMenu(
                    context: context,
                    color: Global.darkMode!
                        ? const Color.fromARGB(255, 33, 33, 33)
                        : Colors.white,
                    position: const RelativeRect.fromLTRB(100, 100, 0, 0),
                    items: [
                      PopupMenuItem(
                          child: Text(
                        'data',
                        style: TextStyle(
                          color: Global.darkMode! ? Colors.white : Colors.black,
                        ),
                      ))
                    ]);
              },
              icon: const Icon(Icons.more_vert))
        ],
      ),
      body: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: messages.length,
            reverse: true,
            itemBuilder: (BuildContext context, int index) {
              return ChatMessage(
                  message: messages[index].message!,
                  isMe: messages[index].sender == 'Me' ? true : false);
            },
          ),
        ),
        const Divider(height: 1),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          child: const ChatInputField(),
        ),
      ],
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isMe;

  const ChatMessage({super.key, required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isMe ? Colors.blueAccent : Colors.grey[300],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(message),
      ),
    );
  }
}

class ChatInputField extends StatelessWidget {
  const ChatInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: TextField(
            decoration: InputDecoration.collapsed(
              hintText: 'Type a message...',
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {
            // Send the message
          },
        ),
      ],
    );
  }
}
