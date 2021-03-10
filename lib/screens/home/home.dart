import 'package:FoodCourtApp/models/meal/category.dart';
import 'package:FoodCourtApp/screens/menu/categories.dart';
import 'package:FoodCourtApp/screens/menu/mealDeatails.dart';
import 'package:FoodCourtApp/screens/offers/offers.dart';
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
    


    return Scaffold(

    body: SingleChildScrollView(
      child: Stack(

      children: [
        Container(
          height: 120,
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
            SizedBox(height:150 ,),
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
              height:260,
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text('Offers',
                  style:TextStyle(
                    fontFamily: 'Nunito',
                    fontSize:20,
                  )
                  ),
                  SizedBox(width:10),
                  Icon(Icons.local_offer_sharp)
                ],
              ),
            ),
            Container(
              height:300,
              // color: Colors.deepOrange,
               child: ListView.builder(
                  shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Stack(
                          children: [
                          Image.network('https://firebasestorage.googleapis.com/v0/b/foodcourt-2f1f1.appspot.com/o/meals%2Famerican%20meals%2Fpestosteak.PNG?alt=media&token=51181551-0cc6-4ab7-a8c3-934fa4f8b487'),
                          Padding(
                            padding: const EdgeInsets.only(left: 274.0),
                            child: Text(' 19% OFF ',
                                style: TextStyle(fontSize: 24,
                                color: Colors.white,
                                backgroundColor: Colors.deepOrange
                            ), ),
                          ),
                          GestureDetector(
                            child:Padding(
                              padding: const EdgeInsets.only(top: 235.0),
                              child: Text('View More Offers',
                                style: TextStyle(fontSize: 25,
                                color: Colors.white,
                                backgroundColor: Colors.black45
                          ), ),
                            ),
                          
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Offers()) );
                          },
                          )
                        ],),
                      );
                    },
            ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Center(
                    child: Text('We offer you delicious meals prepared by professionals with reasonable prices',
                    textAlign: TextAlign.center,
                    style:TextStyle(
                      fontFamily: 'Nunito',
                      fontSize:19,
                      color: Colors.black
                    )
                    ),
                  ),
                  SizedBox(width:10)
                ],
              ),
            ),
            Container(
              height:360,
              // color: Colors.deepOrange,
               child: ListView.builder(
                  shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                    return  Column(
                      children: [
                        Container(
                          width:380,
                          height: 300,
                          child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image(
                            image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/foodcourt-2f1f1.appspot.com/o/meals%2ForientalMeals%2Fseafood%2FshrimpPasta.PNG?alt=media&token=a1d7a974-703c-44ef-9c9b-d019540e6d41'),
                            
                          ),)),
                        
                        Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: RaisedButton(
                            child: Text('See Full Menu',
                            style: TextStyle(fontSize: 20,
                            color: Colors.white,
                        ), ),
                        
                        color: Colors.deepOrange,
                        onPressed: (){
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Categories()) );
                        },
                        )),
                        
                      ],
                    ); } ),
            ),
            
          ],
        ),
        
      ]
    ),
    
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

