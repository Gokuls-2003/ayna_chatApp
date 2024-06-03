import 'package:equatable/equatable.dart';

class ChatState extends Equatable {
  final List<String> messages;

  const ChatState(this.messages);

  @override
  List<Object> get props => [messages];
}
