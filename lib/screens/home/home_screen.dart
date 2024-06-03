import 'package:ayna_chatapp/bloc/chat_bloc/chat_bloc.dart';
import 'package:ayna_chatapp/bloc/chat_bloc/chat_event.dart';
import 'package:ayna_chatapp/bloc/chat_bloc/chat_state.dart';
import 'package:ayna_chatapp/bloc/signin_bloc/signin_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome, you are In !'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<SigninBlocBloc>().add(const SignOutRequired());
              },
              icon: Icon(Icons.login))
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.messages[index]),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Send a message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final message = _controller.text;
                    if (message.isNotEmpty) {
                      BlocProvider.of<ChatBloc>(context).add(SendMessage(message));
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
