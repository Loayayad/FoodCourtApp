import 'dart:async';

import 'package:FoodCourtApp/models/meal/meal.dart';
import 'package:FoodCourtApp/screens/menu/mealDeatails.dart';
import 'package:FoodCourtApp/services/menu/menuService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Offers extends StatefulWidget {
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {

  StreamSubscription<QuerySnapshot> meals;
  List<Meal> mealsList;
  MenuService menuServ = new MenuService();
  @override
  void initState(){
    super.initState();
    
    mealsList = new List();
    meals?.cancel();
    meals = menuServ.getOffers().listen((QuerySnapshot snapshot) {
    
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
      appBar: AppBar(title: Text('Offers')),
      body: ListView.builder(
        itemCount: mealsList.length,
        itemBuilder: (context, index){
          return Card(
            child:
                Column(
                  children: [
                    Stack(children: [
                      Image.network(mealsList[index].image,),
                      Text('Discount: ${mealsList[index].discount}', style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        backgroundColor: Colors.white60),),
                      Padding(
                        padding: const EdgeInsets.only(top: 250.0),
                        child: Text(mealsList[index].name, style: TextStyle(fontSize: 30, color: Colors.white,
                        backgroundColor: Colors.black38
                        ),),
                      ),
                      
                    ],),
                    RaisedButton(
                      child: Text('See Details'),
                      onPressed: (){
                        Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MealDetails(
                                meal: mealsList[index],
                                counter: 1,
                              )
                              )
                              );
                      },
                    )
                  ],
                ),
                
            );
        }),
    );
  }
}