import 'package:ayna_chatapp/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:ayna_chatapp/screens/auth/welcome.dart';
import 'package:ayna_chatapp/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Firebase Auth",
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return const HomeScreen();
          } else {
            return const WelcomeScreen();
          }
        }));
  }
}
