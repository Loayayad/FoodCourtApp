import 'package:FoodCourtApp/screens/auth/login.dart';
import 'package:FoodCourtApp/services/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  //Controllers to hold the value
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  //final imageController = TextEditingController();

  Future<bool> registerUser(
      //String email, String password, String name, String url) async {
      String email,
      String password,
      String name) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      UserUpdateInfo info = UserUpdateInfo();
      info.displayName = name;
      //info.photoUrl = url;

      user.updateProfile(info);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  registerButton(context) async {
    final email = emailController.text.toString().trim();
    final password = passwordController.text.toString().trim();
    final name = nameController.text.toString().trim();
    //final url = imageController.text.toString().trim();

    //bool result = await registerUser(email, password, name, url);
    bool result = await registerUser(email, password, name);

    print(result);

    if (result) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Login()));
    } else {
      print("Error");
    }
  }

  Future<FirebaseUser> login(String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  loginButton(context) async {
    final email = emailController.text.toString().trim();
    final password = passwordController.text.toString().trim();

    FirebaseUser user = await login(email, password);

    if (user != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => FoodCourtHomePage(
              //name: user.displayName,
              //imageUrl: user.photoUrl,
              ),
        ),
      );
    } else {
      print("Error");
    }
  }
}
