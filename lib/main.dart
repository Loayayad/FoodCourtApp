//import 'package:FoodCourtApp/components/firedata.dart';
import 'package:FoodCourtApp/screens/auth/login.dart';
import 'package:FoodCourtApp/screens/auth/signup.dart';
import 'package:FoodCourtApp/screens/chef/chefs.dart';
import 'package:FoodCourtApp/screens/offers/offers.dart';
import 'package:FoodCourtApp/screens/cart/cart.dart';
import 'package:FoodCourtApp/screens/menu/categories.dart';
import 'package:FoodCourtApp/screens/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  List<Widget> list = [
    Home(),
    Categories(),
    Offers(),
    ShowChef(),
    Cart(),
    Login(),
    Registration(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 90.0),
          child: Text('FoodCourt'),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: list[index],
      drawer: AppDrawer(onClick: (ctx, i) {
        setState(() {
          index = i;
          Navigator.pop(ctx);
        });
      }),
    ));
  }
}

class AppDrawer extends StatelessWidget {
  final Function onClick;
  AppDrawer({this.onClick});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Drawer(
            child: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () => onClick(context, 0),
                ),
                ListTile(
                  leading: Icon(Icons.lunch_dining),
                  title: Text('Menu'),
                  onTap: () => onClick(context, 1),
                ),
                ListTile(
                  leading: Icon(Icons.local_offer_sharp),
                  title: Text('Offers'),
                  onTap: () => onClick(context, 2),
                ),
                ListTile(
                  leading: Icon(Icons.local_dining),
                  title: Text('Chefs'),
                  onTap: () => onClick(context, 3),
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Cart'),
                  onTap: () => onClick(context, 4),
                ),
                ListTile(
                  leading: Icon(Icons.person_rounded),
                  title: Text('Login'),
                  onTap: () => onClick(context, 5),
                ),
                ListTile(
                  leading: Icon(Icons.person_add_alt_1_rounded),
                  title: Text('Register'),
                  onTap: () => onClick(context, 6),
                ),
              ]),
        )));
  }
}

// class MyApp extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.light().copyWith(
//         primaryColor: Colors.deepOrange,
//         scaffoldBackgroundColor: Color(0xFFEDEDED),
//       ),
//       home: FoodCourtHomePage(),
//       routes: {
//         'register': (context) => Registration(),
//         'login': (context) => Login(),
//         'menu': (context) => Categories(),

//         'home': (context) => Home(),

//         'chef':(context) => ShowChef(),

//       },
//     );
//   }
// }
