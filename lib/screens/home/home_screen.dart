import 'package:ayna_chatapp/bloc/signin_bloc/signin_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomeScreen extends StatefulWidget {
  final WebSocketChannel channel;
  const HomeScreen({super.key, required this.channel});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController editingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
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
      body: new Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
                child: TextFormField(
              decoration: InputDecoration(labelText: "Send any Message"),
              controller: editingController,
            )),
            StreamBuilder(
                stream: widget.channel.stream,
                builder: (context, snapshot) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(snapshot.hasData ? '${snapshot.data}' : " "),
                  );
                })
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _sendMyMessage,
        child: new Icon(Icons.send),
      ),
    );
  }

  void _sendMyMessage() {
    if (editingController.text.isNotEmpty) {
      widget.channel.sink.add(editingController.text);
    }
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}

// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//  const HomeScreen({super.key});

//  @override
//  State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//  @override
//  Widget build(BuildContext context) {
//   return Scaffold(
//    body: Column(
//     children: [Text("Hi,")],
//    ),
//   );
//  }
// }