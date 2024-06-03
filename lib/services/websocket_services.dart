
import 'dart:async';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  final WebSocketChannel _channel;
  final StreamController<String> _messageController = StreamController<String>();

  WebSocketService(String url) : _channel = WebSocketChannel.connect(Uri.parse(url)) {
    _channel.stream.listen((message) {
      _messageController.add(message);
    });
  }

  Stream<String> get messages => _messageController.stream;

  void sendMessage(String message) {
    _channel.sink.add(message);
  }

  void dispose() {
    _channel.sink.close();
    _messageController.close();
  }
}
