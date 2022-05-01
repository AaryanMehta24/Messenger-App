//    import 'package:chat/components/primary_button.dart';
   import 'package:clone_messenger/services/auth.dart';
   import 'package:clone_messenger/screens/chats/chats_screen.dart';
   import 'package:clone_messenger/screens/signinOrSignUp/signup_form.dart';
   import 'package:clone_messenger/constants.dart';
   import 'package:flutter/material.dart';
//
// class SigninOrSignupScreen extends StatefulWidget {
//   @override
//   State<SigninOrSignupScreen> createState() => _SigninOrSignupScreenState();
// }
//
// class _SigninOrSignupScreenState extends State<SigninOrSignupScreen> {
//   @override
//   final AuthService _auth = AuthService();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding*0.5),
//           child: Column(
//             children: [
//               SizedBox(height: kDefaultPadding * 0.1),
//               Image.asset(
//                 "assets/images/messenger_logo_1.png",
//                 height: 110,
//               ),
//               SizedBox(height: kDefaultPadding*0.5),
//               TextFormField(
//                 decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.perm_contact_calendar_outlined),
//                   border: OutlineInputBorder(),
//                   labelText : 'Email',
//                 ),
//               ),
//               SizedBox(height: kDefaultPadding*0.5),
//               TextFormField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.password),
//                   border: OutlineInputBorder(),
//                   labelText : 'Password',
//                 ),
//               ),
//               SizedBox(height: kDefaultPadding*0.5),
//               SizedBox(
//                 width: double.infinity,
//                 child: MaterialButton(
//                     padding: EdgeInsets.all(kDefaultPadding*0.75),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(40)),
//                     ),
//                     onPressed : () {
//                       // if (_formKey.currentState!.validate()) {
//                       // final snackbar =
//                       // SnackBar(content: Text('Submitted the form'));
//                       // ScaffoldMessenger.of(context).showSnackBar(snackbar);
//                       // dynamic result = await _auth
//                       //     .registerWithEmailAndPassword(email, password);
//                       // if (result == null) {}
//
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ChatsScreen(),
//                           )
//                       );
//                     },
//                     color : kPrimaryColor,
//                     child: Text(
//                       "Sign In",
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         color: Colors.white,
//                       ),
//                     )),
//               ),
//               SizedBox(height: kDefaultPadding*0.5),
//               SizedBox(
//                 width: double.infinity,
//                 child: MaterialButton(
//                     padding: EdgeInsets.all(kDefaultPadding*0.75),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(40)),
//                     ),
//                     onPressed : () {
//                       Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => SignUp(),
//                               )
//                       );
//                     },
//                     color : kSecondaryColor,
//                     child: Text(
//                       "Sign Up",
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         color: Colors.white,
//                       ),
//                     )),
//               ),
//               Spacer(flex:1),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class SigninOrSignupScreen extends StatefulWidget {
  @override
  State<SigninOrSignupScreen> createState() => _SigninOrSignupScreenState();
}

class _SigninOrSignupScreenState extends State<SigninOrSignupScreen> {
  final _formKey = GlobalKey<FormState>();
  //final _auth = FirebaseAuth.instance;
  final AuthService _auth = AuthService();
  var _loginEmail;
  var _loginPasssword;
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Image.asset('assets/images/messenger_logo_1.png',
                          height: 180),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _formKey,
                      child: Column(children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.perm_contact_calendar_outlined),
                            border: OutlineInputBorder(),
                            labelText : 'Email',
                          ),
                          onChanged: (value) {
                            setState(() => _loginEmail = value);
                            //_loginEmail = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              border: OutlineInputBorder(),
                              labelText : 'Password',
                            ),
                          onChanged: (value) {
                            setState(() => _loginPasssword = value);
                            //_loginPasssword = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                                width: double.infinity,
                                child: MaterialButton(
                                    padding: EdgeInsets.all(kDefaultPadding*0.75),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(40)),
                                    ),
                                    onPressed: () async {
                                        print(_loginEmail);
                                        print(_loginPasssword);
                                        if (_formKey.currentState!.validate()) {
                                          dynamic result = await _auth.signInWithEmailAndPassword(_loginEmail,_loginPasssword);
                                          if (result == null) {
                                            setState(() =>
                                            error = 'Invalid Credentials');
                                          } else {
                                            _formKey.currentState?.save();

                                            // Navigation
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => ChatsScreen()),
                                            );
                                          }
                                        }
                                      },
                                    color : kPrimaryColor,
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                    )),
                              ),
                      ]),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(height: kDefaultPadding*0.5),
                    SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                          padding: EdgeInsets.all(kDefaultPadding*0.75),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          onPressed : () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUp(),
                                    )
                            );
                          },
                          color : kSecondaryColor,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          )),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(kDefaultPadding*0.75),
                        child: Text(
                          error,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
