import 'package:FoodCourtApp/screens/menu/mealDeatails.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../services/menu/menuService.dart';
import '../../models/meal/meal.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   StreamSubscription<QuerySnapshot> meals;
  List<Meal> mealsList;
  MenuService menuServ = new MenuService();

  @override
  void initState(){
    super.initState();

    mealsList = new List();
    meals?.cancel();
    meals = menuServ.getAllMeals().listen((QuerySnapshot snapshot) {
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    return Scaffold(

    body: Stack(

      children: [
        Container(
          height: height* 0.17,
          width: width,
          decoration:BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)
            )
          ),
          child: Column(
            children: [
              SizedBox(height:20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Icon(Icons.dehaze_rounded,color: Colors.white,size:32),
                    // Icon(Icons.account_circle,color: Colors.white,size:32),
                  ],
                ),
              ),
              SizedBox(height:20),
              Text(
                ' Welcome to Food Court',
                style: TextStyle(
                  fontSize:30,
                  fontFamily: 'Nunito',
                  color: Colors.white,

                )

              )
            ]
          )
        ),
        Column(
          children: [
            SizedBox(height:height*0.20 ,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text('Recommended',
                  style:TextStyle(
                    fontFamily: 'Nunito',
                    fontSize:20,
                  )
                  ),
                  SizedBox(width:10),
                  Icon(Icons.stars)
                ],
              ),
            ),
            Container(
              height:height*0.4,
              // color: Colors.deepOrange,
               child: ListView.builder(
                  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return RecommendedCard(
                        meal: mealsList[index],
                        counter: 1,
               );
                    },
            ),
            ),
          ],
        )
      ]
    )
  );

  }
 }
 class RecommendedCard extends StatefulWidget {

  final Meal meal;
  final int counter;
   const RecommendedCard({Key key, this.meal, this.counter})
      : super(key: key);
    @override
    _RecommendedCardState createState() => _RecommendedCardState();
  }

  class _RecommendedCardState extends State<RecommendedCard> {
    @override
    Widget build(BuildContext context) {
      double height = MediaQuery.of(context).size.height;
     double width = MediaQuery.of(context).size.width;

      return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 8,
        child: Container(
          height: height * 0.2,
          width: width * 0.5,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.meal.name,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text('${widget.meal.price} L.E'),
                    SizedBox(
                      height: 15,
                    ),
                    Image.network( widget.meal.image,
                      fit: BoxFit.cover
                      ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                left: 70,
                right: 0,
                child: GestureDetector(
                  child: Text('View More', style: TextStyle(
                    color: Colors.deepOrange,

                  ),),
                  onTap: (){
                    Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MealDetails(
                                meal: widget.meal,
                                counter: widget.counter,
                              )
                              )
                              );
                  },
                )

              )
            ]
              )
        )
      )
      );
  }
}