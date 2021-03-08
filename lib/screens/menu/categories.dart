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
      appBar: AppBar(
      title: Center(child: Text('Categories', style: TextStyle(color: Colors.deepOrange))),
      backgroundColor: Colors.white,
      ),
      body: 
      //Column(
      //   children: [
      //     Center(child: Text('Categories', style: TextStyle(color: Colors.deepOrange, fontSize: 25))),
      //     Row(children: [
      //       Row(children: [
      //         Column(
      //           children: [
      //             Image.network(categoriesList[0].image, width: 150, height:150),
      //             Text(categoriesList[0].name, style: TextStyle(fontSize: 26, color:Colors.deepOrange),
      //             )],
      //         ),
              
      //         Column(
      //           children: [
      //             Image.network(categoriesList[1].image, width: 150, height:150),
      //             Text(categoriesList[1].name, style: TextStyle(fontSize: 26, color:Colors.deepOrange),
      //             )],
      //         ),
      //         ],)
      //     ],),
      //     Row(
      //       children: [
      //       Row(children: [
      //         Column(
      //           children: [
      //             Image.network(categoriesList[2].image, width: 150, height:150),
      //             Text(categoriesList[2].name, style: TextStyle(fontSize: 26, color:Colors.deepOrange),
      //             )],
      //         ),
              
      //         Column(
      //           children: [
      //             Image.network(categoriesList[3].image, width: 150, height:150),
      //             Text(categoriesList[3].name, style: TextStyle(fontSize: 26, color:Colors.deepOrange),
      //             )],
      //         ),
      //         ],)
      //     ],
      //     ),
      //     Row(
      //       children: [
      //       Row(children: [
      //         Column(
      //           children: [
      //             Image.network(categoriesList[4].image, width: 150, height:150),
      //             Text(categoriesList[4].name, style: TextStyle(fontSize: 26, color:Colors.deepOrange),
      //             )],
      //         ),
              
      //        Column(
      //           children: [
      //             Image.network(categoriesList[5].image, width: 150, height:150),
      //             Text(categoriesList[5].name, style: TextStyle(fontSize: 26, color:Colors.deepOrange),
      //             )],
      //         ),
      //         ],)
      //     ],
      //     )
      //   ],
      // )
      ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index){
        return GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Column(
                children: [
                  Image.network(categoriesList[index].image),
                  Text(categoriesList[index].name, style: TextStyle(fontSize: 26, color:Colors.deepOrange),
                  )],
              ),
              ),
          ),
            onTap:(){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => Menu(id: categoriesList[index].id, name: categoriesList[index].name))
              );}
          );
      }) 
    );
  }
}