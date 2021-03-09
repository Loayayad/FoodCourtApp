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
      
      body: ListView.builder(
        itemCount: mealsList.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              
              child:
                  Column(
                    children: [
                      Stack(children: [
                        Container(
                          height: 300,
                          width: 420,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                            image: DecorationImage(
                            image: NetworkImage(mealsList[index].image,), fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(7.0)
                            ),),
                          
                        Padding(
                          padding: const EdgeInsets.only(left: 262.0),
                          child: Text(' ${mealsList[index].discount} OFF ', style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            backgroundColor: Colors.deepOrange),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 265.0),
                          child: Text(mealsList[index].name, style: TextStyle(fontSize: 30, color: Colors.white,
                            backgroundColor: Colors.black38
                            ),),
                        ),
                        TextButton(
                          onPressed: 
                          (){Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MealDetails(
                                meal: mealsList[index],
                                counter: 1,
                              )));}, 
                          child: Padding(
                            padding: const EdgeInsets.only(left: 270.0, top:260),
                            child: Row(
                              children: [
                                Text('See Details', style: TextStyle(fontSize: 16,
                                color:Colors.deepOrangeAccent,
                                )),
                                Icon(Icons.arrow_right, color: Colors.deepOrangeAccent,),
                              ],
                            ),
                          ))
                        
                      ],),
                    ],
                  ),
                  
              ),
          );
        }),
    );
  }
}