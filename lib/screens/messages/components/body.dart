import 'package:clone_messenger/constants.dart';
import 'package:clone_messenger/models/ChatMessage.dart';
import 'package:flutter/material.dart';

import 'chat_input_field.dart';
import 'message.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
              child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) =>
              Message(message: demeChatMessages[index]),
            ),
            )
          ),
        ChatInputField(),
      ],
    );
  }
}
