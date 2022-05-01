import 'package:clone_messenger/models/Chat.dart';
import 'package:clone_messenger/screens/chats/chats_screen.dart';
import 'package:flutter/material.dart';
import 'chat_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatsScreen(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
