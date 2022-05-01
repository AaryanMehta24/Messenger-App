import 'package:clone_messenger/screens/signinOrSignUp/signin_or_signup_screen.dart';
import 'package:clone_messenger/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:clone_messenger/constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var username;
    var email;
    var password;
    var confirm_password;
    var error;
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),

            child: Form(
              // autovalidateMode: true,
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: kDefaultPadding * 1.5),
                  Image.asset(
                    "assets/images/messenger_logo_1.png",
                     height: 180,
                  ),
                  // Spacer(),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.perm_contact_calendar_outlined),
                    border: OutlineInputBorder(),
                    labelText : 'Username',

                  ),
                    onSaved: (value){
                      username = value;
                    },
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter username";
                      } else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: kDefaultPadding * 1.5),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                      labelText : 'Email',

                    ),
                    onChanged: (value){
                      email = value;
                    },
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter email";
                      } else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: kDefaultPadding * 1.5),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(),
                      labelText : 'Password',
                    ),
                    onChanged: (value){
                      password = value;
                    },
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter password";
                      } else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: kDefaultPadding * 1.5),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(),
                      labelText : 'Confirm Password',
                    ),
                    onSaved: (value){
                      confirm_password = value;
                    },
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter password";
                      }
                      if(value!=password){
                        return "Invalid Password";
                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: kDefaultPadding * 1.5),
                  SizedBox(
                    width: double.infinity,
                      child: MaterialButton(
                          padding: EdgeInsets.all(kDefaultPadding*0.75),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          onPressed : () async {
                              print(email);
                              print(password);
                              if (_formKey.currentState!.validate()) {
                                final snackbar =
                                SnackBar(content: Text('Submitted the form'));
                                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                dynamic result = await _auth
                                    .registerWithEmailAndPassword(email, password);
                                if (result == null) {}
                                else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SigninOrSignupScreen(),
                                      )
                                  );
                                }

                              }else{
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Colors.redAccent ,
                                         content: Text("Problem Submitting the form :("),
                                  ));
                                }

                          },
                          color : Colors.green,
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )),
                      ),

                  ]
              ),
            ),
          )
        )
    );
  }
}
