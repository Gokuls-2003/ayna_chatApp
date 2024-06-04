import 'package:ayna_chatapp/bloc/signin_bloc/signin_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomeScreen extends StatefulWidget {
  final WebSocketChannel channel;
  const HomeScreen({Key? key, required this.channel}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController editingController = TextEditingController();
  List<String> messages = [];

  void _sendMyMessage() {
    if (editingController.text.isNotEmpty) {
      widget.channel.sink.add(editingController.text);
      editingController.clear();
    }
  }

  @override
  void initState() {
    super.initState();
    widget.channel.stream.listen((message) {
      setState(() {
        messages.add(message); // Update state with received message
      });
    });
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome, you are in!'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<SigninBlocBloc>().add(const SignOutRequired());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                decoration:
                    const InputDecoration(labelText: "Send any message"),
                controller: editingController,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return Text(
                    message,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ); 
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMyMessage,
        child: const Icon(Icons.send),
      ),
    );
  }
}
