import 'package:clone_messenger/screens/chats/chats_screen.dart';
import 'package:clone_messenger/screens/signinOrSignUp/signin_or_signup_screen.dart';
import 'package:clone_messenger/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    //actively listening to stream of return type CustomUser?
    final user = Provider.of<CustomUser?>(context);

    print(user);
    print('wrapper class is executing');

    return user == null ? SigninOrSignupScreen() : ChatsScreen();
    // return SigninOrSignupScreen();
  }
}
