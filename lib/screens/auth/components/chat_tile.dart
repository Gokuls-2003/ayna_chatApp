import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

class ChatTile extends StatelessWidget {
  final MyUser myUser;
  final Function onTap;

  const ChatTile({super.key, required this.myUser, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap();
      },
      dense: false,
      title: Text(myUser.name),
    );
  }
}
