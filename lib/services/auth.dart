// import 'package:firebase_auth/firebase_auth.dart';
//
// class AuthService {
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   //create a user obj based on FirebaseUser
//
//
//   //sign in anonymously
//   Future signInAnon() async {
//     try{
//       AuthResult result = await _auth.signInAnonymously();
//       FirebaseUser user = result.user;
//       return user;
//     }
//     catch(e){
//       print(e.toString());
//       return null;
//     }
//
//   }
//   //sign in with email and password
//
//   //register with email and password
//   Future registerWithEmailAndPassword(String email,String password) async{
//     try{
//       AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
//       FirebaseUser user = result.user;
//       return user;
//     }
//     catch(e){
//       print(e.toString());
//       return null;
//     }
//
//   }
//   //sign out
// }

import 'package:clone_messenger/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //creating instance of Firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //creat user obj based on firebase user obj
  CustomUser? _userFromFirebaseUser(User user) {
    return user != null
        ? CustomUser(uid: user.uid, emailId: user.email.toString())
        : null;
  }

  //auth change user stream
  Stream<CustomUser?> get userStream {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!));
    //.map((User user) => _userFromFirebaseUser(user));
  }

  //sign in anon
  Future? signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      return _userFromFirebaseUser(userCredential.user!);
      //print(userCredential);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sing in with email and password
  Future? signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      //print(result.toString());
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      //print(result.user);
      User? user = result.user;

      //creating a new doc in users collection with uid
      // await DatabaseService(user!.uid)
      //     .updateUsersData('username', '0', user.email.toString());
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}