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
  void initState() {
    super.initState();

    categoriesList = new List();
    categories?.cancel();
    categories = catServ.getAllCategories().listen((QuerySnapshot snapshot) {
      categoriesList = snapshot.documents
          .map((documentSnapshot) => Category(documentSnapshot.data['id'],
              documentSnapshot.data['name'], documentSnapshot.data['image']))
          .toList();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('categories', style: TextStyle(color:Colors.deepOrange),),
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          centerTitle: true,
        ),
          backgroundColor: Colors.white,
          //shadowColor: Colors.white,
          //centerTitle: true,
        
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 132.0),
              //   child: Text('Categories',
              //       style: TextStyle(
              //           fontSize: 30,
              //           color: Colors.deepOrange,
              //           fontFamily: 'Nunito')),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Row(children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 23.0),
                      child: Stack(
                        children: [
                          Container(
                            height: 160,
                            width: 170,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                    image:
                                        NetworkImage(categoriesList[0].image),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 100.0),
                            child: TextButton(
                              child: Text(
                                '   ${categoriesList[0].name}     ',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    backgroundColor: Colors.black54),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Menu(
                                            id: categoriesList[0].id,
                                            name: categoriesList[0].name)));
                              },
                            ),
                          ),
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.only(left: 23.0),
                      child: Stack(
                        children: [
                          Container(
                            height: 160,
                            width: 170,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                    image:
                                        NetworkImage(categoriesList[1].image),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 100.0),
                            child: TextButton(
                              child: Text(
                                '        ${categoriesList[1].name}        ',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    backgroundColor: Colors.black54),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Menu(
                                            id: categoriesList[1].id,
                                            name: categoriesList[1].name)));
                              },
                            ),
                          ),
                        ],
                      )),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Row(children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 23.0),
                      child: Stack(
                        children: [
                          Container(
                            height: 160,
                            width: 170,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                    image:
                                        NetworkImage(categoriesList[2].image),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 100.0),
                            child: TextButton(
                              child: Text(
                                '     ${categoriesList[2].name}     ',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    backgroundColor: Colors.black54),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Menu(
                                            id: categoriesList[2].id,
                                            name: categoriesList[2].name)));
                              },
                            ),
                          ),
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.only(left: 23.0),
                      child: Stack(
                        children: [
                          Container(
                            height: 160,
                            width: 170,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                    image:
                                        NetworkImage(categoriesList[3].image),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 100.0),
                            child: TextButton(
                              child: Text(
                                '     ${categoriesList[3].name}     ',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    backgroundColor: Colors.black54),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Menu(
                                            id: categoriesList[3].id,
                                            name: categoriesList[3].name)));
                              },
                            ),
                          ),
                        ],
                      )),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Row(children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 23.0),
                      child: Stack(
                        children: [
                          Container(
                            height: 160,
                            width: 170,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                    image:
                                        NetworkImage(categoriesList[4].image),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 100.0),
                            child: TextButton(
                              child: Text(
                                '     ${categoriesList[4].name}     ',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    backgroundColor: Colors.black54),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Menu(
                                            id: categoriesList[4].id,
                                            name: categoriesList[4].name)));
                              },
                            ),
                          ),
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.only(left: 23.0),
                      child: Stack(
                        children: [
                          Container(
                            height: 160,
                            width: 170,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                    image:
                                        NetworkImage(categoriesList[5].image),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 100.0),
                            child: TextButton(
                              child: Text(
                                '       ${categoriesList[5].name}       ',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    backgroundColor: Colors.black54),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Menu(
                                            id: categoriesList[5].id,
                                            name: categoriesList[5].name)));
                              },
                            ),
                          ),
                        ],
                      )),
                ]),
              )
            ],
          ),
        )

        // ListView.builder(
        //   itemCount: 6,
        //   itemBuilder: (context, index){
        //   return GestureDetector(
        //     child: Padding(
        //       padding: const EdgeInsets.all(10.0),
        //       child: Card(
        //         child: Column(
        //           children: [
        //             Image.network(categoriesList[index].image),
        //             Text(categoriesList[index].name, style: TextStyle(fontSize: 26, color:Colors.deepOrange),
        //             )],
        //         ),
        //         ),
        //     ),
        //       onTap:(){
        //         Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => Menu(id: categoriesList[index].id, name: categoriesList[index].name))
        //         );}
        //     );
        // })
        );
  }
}
