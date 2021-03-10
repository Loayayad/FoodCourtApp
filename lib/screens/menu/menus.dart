import 'dart:async';
import 'dart:ui';

import 'package:FoodCourtApp/screens/cart/cart.dart';
import 'package:FoodCourtApp/screens/menu/mealDeatails.dart';
import 'package:FoodCourtApp/services/cart/cartService.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../services/menu/menuService.dart';
import '../../models/meal/meal.dart';


class Menu extends StatefulWidget {
  int id;
  String name;
  Menu({this.id, this.name});
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin{
  
  StreamSubscription<QuerySnapshot> meals;
  List<Meal> mealsList;
  MenuService menuServ = new MenuService();
  CartService cService = new CartService();
  @override
  void initState(){
    super.initState();
    
    mealsList = new List();
    meals?.cancel();
    meals = menuServ.getMealByCategoryID(widget.id).listen((QuerySnapshot snapshot) {
    
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
    var counters = new List<int>.generate(mealsList.length, (i) => 1);
    return Scaffold(
      appBar: AppBar(title: Text('${widget.name} Menu'), backgroundColor: Colors.deepOrange,
      actions:<Widget>[
        IconButton(
          icon: Icon(Icons.shopping_cart,
          color:Colors.white,
          ),
          onPressed: (){
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => Cart()));
          },
        )
      ],
      ),
      body: ListView.builder(
        
        itemCount: mealsList.length,
        itemBuilder: (context, index){
          return
              Card(    
                child: Row(
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 100,
                              width: 120,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        mealsList[index].image,
                                      ),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(15.0)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0, top:40),
                              child: Text(
                                (() {
                                  if(mealsList[index].show){
                                    return '  ${mealsList[index].discount} OFF  ';}

                                  return "";
                                })(),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white, backgroundColor: Colors.deepOrange),
                              ),
                            ),
                          ],
                        ),
                        
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Text(mealsList[index].name, style: TextStyle(fontSize: 18)),
                            ),
                            ],
                          ),
                          Row(
                              children: [
                                Text('${mealsList[index].price} L.E', 
                                style: TextStyle(color: Colors.orange, fontSize: 20),),
                             
                              IconButton(
                                  icon: Icon(Icons.add_shopping_cart_outlined,
                                  color:Colors.orange,
                                  ),
                                  onPressed: (){
                                    Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => MealDetails(
                                      meal: mealsList[index],
                                      counter: counters[index],
                                    )
                                    )
                                    );
                                     }
                                ),
                             
                              
                            ],),
                          
                        ],
                      ),
                    ),
                    
                  ],
                  
                ),        
              );
        })
    );
  }
}