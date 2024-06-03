import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final WebSocketChannel channel;

  ChatBloc(this.channel) : super(const ChatState([])) {
    channel.stream.listen((message) {
      add(ReceiveMessage(message));
    });
  }

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is SendMessage) {
      channel.sink.add(event.message);
    } else if (event is ReceiveMessage) {
      final updatedMessages = List<String>.from(state.messages)..add(event.message);
      yield ChatState(updatedMessages);
    }
  }

  @override
  Future<void> close() {
    channel.sink.close();
    return super.close();
  }
}
