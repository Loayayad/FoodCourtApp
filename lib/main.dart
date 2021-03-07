import 'package:FoodCourtApp/screens/auth/login.dart';
import 'package:FoodCourtApp/screens/auth/signup.dart';
import 'package:FoodCourtApp/screens/chef/chefs.dart';
import 'package:FoodCourtApp/screens/menu/categories.dart';
import 'package:FoodCourtApp/screens/home/home.dart';
import 'package:FoodCourtApp/services/home/home.dart';
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
List<Widget> list=[
  Home(),
  Categories(),
  ShowChef(),
  Login(),
  Registration(),



];

  @override


  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(

          // title:Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text('FoodCourt'),
          // ),
          backgroundColor: Colors.transparent,

        ),
        body:list[index],
        drawer:AppDrawer(onClick:(ctx,i){
          setState(() {
          index= i;
          Navigator.pop(ctx);
                    });
        }),

      )
    );
  }
}

 class AppDrawer extends StatelessWidget {
   final Function onClick;
   AppDrawer({this.onClick});
   @override
   Widget build(BuildContext context) {
     return SizedBox(
       width:MediaQuery.of(context).size.width*0.75,
       child: Drawer(
         child:Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children:<Widget>[
             ListTile(
                leading:Icon(Icons.home),
                title: Text('Home'),
                onTap:()=> onClick(context,0),
             ),
              ListTile(
                leading:Icon(Icons.lunch_dining),
                title: Text('Menu'),
                onTap:()=> onClick(context,1),
             ),
              ListTile(
                leading:Icon(Icons.local_dining ),
                title: Text('Chefs'),
                onTap:()=> onClick(context,2),
             ),
              ListTile(
                leading:Icon(Icons.person_rounded),
                title: Text('Login'),
                onTap:()=> onClick(context,3),
             ),
              ListTile(
                leading:Icon(Icons.person_add_alt_1_rounded),
                title: Text('Register'),
                onTap:()=> onClick(context,4),
             ),
           ]
         )
       )
     );
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
