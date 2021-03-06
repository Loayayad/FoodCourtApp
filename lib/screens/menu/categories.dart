import 'dart:async';

import 'package:FoodCourtApp/models/meal/category.dart';
import 'package:FoodCourtApp/screens/menu/menus.dart';
import 'package:FoodCourtApp/services/menu/categoryService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Categories extends StatefulWidget {


  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

StreamSubscription<QuerySnapshot> categories;
  List<Category> categoriesList;
  CategoryService catServ = new CategoryService();

  @override
  void initState(){
    super.initState();
    
    categoriesList = new List();
    categories?.cancel();
    categories = catServ.getAllCategories().listen((QuerySnapshot snapshot) {
    //meals = menuServ.getAllMeals().listen((QuerySnapshot snapshot){
      categoriesList = snapshot.documents.map((documentSnapshot)
        => Category(
          documentSnapshot.data['id'],
          documentSnapshot.data['name'],
          documentSnapshot.data['image']
      )).toList();
    setState(() {});
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Desired Category'), backgroundColor: Colors.deepOrange,),
      body: ListView.builder(
        itemCount: categoriesList.length-2,
        itemBuilder: (context, index){
        return GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  Container(
                    width: 300,
                    height: 200,
                    child: Image.network(categoriesList[index].image)),
                  Text(categoriesList[index].name, style: TextStyle(fontSize: 26),
                  )],
              ),
              ),
          ),
            onTap:(){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => Menu(id: categoriesList[index].id)
                )
              );}
          );
      }
      ) 
    );
  }
}