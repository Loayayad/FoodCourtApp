import 'package:flutter/material.dart';

class FoodCourtHomePage extends StatefulWidget {
  final name;
  FoodCourtHomePage({this.name});
  @override
  _FoodCourtHomePageState createState() => _FoodCourtHomePageState();
}

class _FoodCourtHomePageState extends State<FoodCourtHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          RaisedButton(
            child: Text("signup"),
            onPressed: () {
              setState(
                () {
                  Navigator.pushNamed(context, 'register');
                },
              );
            },
          ),
          RaisedButton(
            child: Text("Menu"),
            onPressed: () {
              setState(
                () {
                  Navigator.pushNamed(context, 'menu');
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
