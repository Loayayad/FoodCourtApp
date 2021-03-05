import 'package:flutter/material.dart';
//import 'package:flutte';

class FoodCourtHomePage extends StatefulWidget {
  //final name;
  //FoodCourtHomePage({this.name = 'user'});
  @override
  _FoodCourtHomePageState createState() => _FoodCourtHomePageState();
}

class _FoodCourtHomePageState extends State<FoodCourtHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            //widget.name,
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
              child: Text("login"),
              onPressed: () {
                setState(
                  () {
                    Navigator.pushNamed(context, 'login');
                  },
                );
              },
            ),
             RaisedButton(
              child: Text("Home"),
              onPressed: () {
                setState(
                  () {
                    Navigator.pushNamed(context, 'home');
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
             RaisedButton(
              child: Text("Show Chefs"),
              onPressed: () {
                setState(
                  () {
                    Navigator.pushNamed(context, 'chef');
                  },
                );
              },
            ),
          ],
        ),

      ),
    );
  }
}
