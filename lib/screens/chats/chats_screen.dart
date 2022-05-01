import 'package:flutter/material.dart';
import '../signinOrSignUp/signin_or_signup_screen.dart';
import 'components/body.dart';
import 'package:clone_messenger/services/auth.dart';
class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int _selectedIndex = 1;
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
            print("Logging Out");
            final snackbar =
            SnackBar(content: Text('Logging Out'));
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
            dynamic result = await _auth
                .signOut();
            if (result == null) {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SigninOrSignupScreen(),
                      )
                  );
            }
        },
        // backgroundColor: kPrimaryColor,
        child: Icon(
          Icons.logout,
          // Icons.person_add_alt_1,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
        BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage("assets/images/user.png"),
          ),
          label: "Profile",
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      // backgroundColor: kContentColorLightTheme,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Text(
        "Chats",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
