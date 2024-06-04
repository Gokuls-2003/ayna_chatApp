import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:user_repository/user_repository.dart'; // Your User model

class ChatPage extends StatefulWidget {
  final MyUser user;
  final WebSocketChannel channel;

  const ChatPage({Key? key, required this.user, required this.channel}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(), // Placeholder for displaying messages
          ),
          TextField(
            controller: textEditingController,
          ),
          ElevatedButton(
            onPressed: () {
              // Send message logic here
              widget.channel.sink.add(textEditingController.text);
              textEditingController.clear(); // Clear input field after sending
            },
            child: Text('Send'),
          ),
        ],
      ),
    );
  }
}
