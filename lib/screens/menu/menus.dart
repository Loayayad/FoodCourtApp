import 'dart:async';
import 'dart:ui';

import 'package:FoodCourtApp/screens/menu/mealDeatails.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../services/menu/menuService.dart';
import '../../models/meal/meal.dart';


class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin{
  TabController _tabController;
  StreamSubscription<QuerySnapshot> meals;
  List<Meal> mealsList;
  MenuService menuServ = new MenuService();

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length:6, vsync: this);
    mealsList = new List();
    meals?.cancel();
    meals = menuServ.getMealByCategoryID(1).listen((QuerySnapshot snapshot) {
    //meals = menuServ.getAllMeals().listen((QuerySnapshot snapshot){
      mealsList = snapshot.documents.map((documentSnapshot)
        => Meal(
          documentSnapshot.data['id'],
          documentSnapshot.data['name'],
          documentSnapshot.data['image'],
          documentSnapshot.data['discount'],
          documentSnapshot.data['description'],
          documentSnapshot.data['chef'],
          documentSnapshot.data['category'],
          documentSnapshot.data['price'],
          documentSnapshot.data['show'],
      )).toList();
    setState(() {});
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu'), backgroundColor: Colors.deepOrange,
      bottom:TabBar(
                controller: _tabController,
                isScrollable: true,
                unselectedLabelColor: Colors.white12,
                tabs: [
                Tab(child: Text('breakfast')),
                Tab(child: Text('beef')),
                Tab(child: Text('chicken')),
                Tab(child: Text('seafood')),
                Tab(child: Text('dessert')),
                Tab(child: Text('sides'))
              ]),
      ),
      body: ListView.builder(
        //itemCount: mealsList.length-2,
        itemCount: mealsList.length,
        itemBuilder: (context, index){
          return
              Card(    
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width:120,
                          height: 100,
                          child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image(
                            image: NetworkImage(mealsList[index].image),
                          ),
                          )
                        
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(mealsList[index].name, style: TextStyle(fontSize: 18)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(mealsList[index].price.toString(), style: TextStyle(color: Colors.deepOrange),),
                            ),
                            Text('L.E', style: TextStyle(color: Colors.orange)),
                          ],
                        ),
                        Row(
                          children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(
                              Icons.add_shopping_cart_outlined,
                              color: Colors.orange,
                              size: 30.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: GestureDetector(
                              child:Icon(
                              Icons.info_outline,
                              color: Colors.orange,
                              size: 30.0,
                            ),
                            onTap:(){Navigator.push(context,
                            MaterialPageRoute(builder: (context) => mealDetails(name: mealsList[index].name
                            ,description: mealsList[index].description
                            ,price: mealsList[index].price
                            ,imageLink: mealsList[index].image,
                            )
                            )
                            );}
                            )
                          )
                        ],)
                      ],
                    ),
                    
                  ],
                  
                ),        
              );
        })
    );
  }
}