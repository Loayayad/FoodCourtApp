import 'dart:async';


import 'package:FoodCourtApp/models/meal/meal.dart';
import 'package:FoodCourtApp/screens/chef/chefs.dart';
import 'package:FoodCourtApp/services/chef/chefService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'chefDeshies.dart';


class chefDetails extends StatefulWidget {
   String name;
   String imageLink;
   String description;
   int cId;

  chefDetails({this.name, this.imageLink , this.description ,this.cId});
  @override
  _chefDetailsState createState() => _chefDetailsState();
}
 

class _chefDetailsState extends State<chefDetails> {
  StreamSubscription<QuerySnapshot> chefs;
  List<Meal> mealsList;
  ChefService chefServ = new ChefService();

    @override
  void initState(){
    super.initState();

    mealsList = new List();
    chefs?.cancel();
    chefs = chefServ.getMealByChefID(widget.cId).listen((QuerySnapshot snapshot){
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
     setState(() {
       
     });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:ListView(
        children: [
      
            Stack(
               children:<Widget>[
                 Container(
                   height:350.0,
                   width: double.infinity,

                 ),
                 Container(
                    height:200.0,
                   width: double.infinity,
                   color: Colors.deepOrange,

                 ),
                 Align(
                   alignment:Alignment.topLeft,
                   child: IconButton(
                     icon: Icon(Icons.arrow_back_ios),
                     onPressed: (){
                      Navigator.pop(context);

                     },
                     color: Colors.white,
                   ),
                 ),
                 Positioned(
                   top:125.0,
                   left:15.0,
                   right:15.0,
                   child:Material(
                     elevation: 3.0,
                     borderRadius:BorderRadius.circular(7.0) ,
                     child: Container(
                       height:200.0,
                       decoration:BoxDecoration(
                         borderRadius:BorderRadius.circular(7.0),
                         color: Colors.white,
                        ),
                     ),
                   ),
                 ),
                   Positioned(
                     top:75.0,
                     left:(MediaQuery.of(context).size.width/2-50.0),
                     child: Container(
                       height:100.0,
                       width:100.0,
                       decoration:BoxDecoration(
                         borderRadius: BorderRadius.circular(50.0),
                         image: DecorationImage(image:NetworkImage(widget.imageLink)
                          ),
                        ),
                     ),
                   ),
                   Positioned(
                     top:190.0,
                     left:(MediaQuery.of(context).size.width/2-80.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Text(widget.name, style: TextStyle(
                        
                        fontSize: 26.0),
                         ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.food_bank_outlined)
                      )
                       ],
                      
                     ),
                   ),
                     Positioned(
                     top:230.0,
                     right: 15.0,
                     left:(MediaQuery.of(context).size.width/2-180.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       
                       children: <Widget>[
                         Container(
                            height:200.0,
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text(widget.description, style: TextStyle(
                        fontSize: 17.0),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
               
          
        
               ]
                 
            ),
              Positioned(
                     right: 15.0,
                     left:(MediaQuery.of(context).size.width/2-180.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       
                       children: <Widget>[
                         Container(
                           child: Padding(
                             padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                             child: Text('Meals', style: TextStyle(
                                 fontSize: 25.0),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                 Container(
                 child: ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                   itemCount: mealsList.length,
                   itemBuilder: ( context ,index){
                       return InkWell(
                         child:chefDeshies(
                            meal: mealsList[index],
                            name: '',
                           
                         )
                         
                       );
                      
                    
                     }
               )

          ),

      ],
      ),
       
    );
    
  }
 

}