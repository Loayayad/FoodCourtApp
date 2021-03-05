import 'package:FoodCourtApp/screens/auth/login.dart';
import 'package:FoodCourtApp/screens/auth/signup.dart';
import 'package:FoodCourtApp/screens/menu/menus.dart';
import 'package:FoodCourtApp/services/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.deepOrange,
        scaffoldBackgroundColor: Color(0xFFEDEDED),
      ),
      home: FoodCourtHomePage(),
      routes: {
        'register': (context) => Registration(),
        'login': (context) => Login(),
        'menu': (context) => Menu(),
      },
    );
  }
}
