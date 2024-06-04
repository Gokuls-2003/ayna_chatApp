import 'package:ayna_chatapp/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:ayna_chatapp/bloc/signin_bloc/signin_bloc_bloc.dart';
import 'package:ayna_chatapp/screens/auth/welcome.dart';
import 'package:ayna_chatapp/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Agna ChatAPP",
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
              background: Colors.white,
              onBackground: Colors.black,
              primary: Color.fromRGBO(206, 147, 216, 1),
              onPrimary: Colors.black,
              secondary: Color.fromRGBO(244, 143, 177, 1),
              onSecondary: Colors.white,
              tertiary: Color.fromRGBO(255, 204, 128, 1),
              error: Colors.red,
              outline: Color(0xFF424242)),
        ),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return BlocProvider(
              create: (context) => SigninBlocBloc(
                  userRepository:
                      context.read<AuthenticationBloc>().userRepository),
              child: HomeScreen(
                  channel: WebSocketChannel.connect(
                      Uri.parse('wss://echo.websocket.org'))),
            );
          } else {
            return const WelcomeScreen();
          }
        }));
  }
}
 //webSocketChannel.connect('wss://echo.websocket.org')