import 'dart:async';
import 'package:FoodCourtApp/screens/chef/chefDetails.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/chef/chef.dart';
import '../../services/chef/chefService.dart';


class ShowChef extends StatefulWidget {
  @override
  _ChefState createState() => _ChefState();
}

class _ChefState extends State<ShowChef> {
  StreamSubscription<QuerySnapshot> chefs;
  List<Chef> chefsList;
  ChefService chefServ = new ChefService();

    @override
  void initState(){
    super.initState();

    chefsList = new List();
    chefs?.cancel();
    chefs = chefServ.getChefsList().listen((QuerySnapshot snapshot){
      chefsList = snapshot.documents.map((documentSnapshot)
        => Chef(
          documentSnapshot.data['id'],
          documentSnapshot.data['name'],
          documentSnapshot.data['image'],
          documentSnapshot.data['description']
      )).toList();
    setState(() {});
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Our Chefs'), backgroundColor: Colors.deepOrange,),
      body:ListView.builder(
        itemCount: chefsList.length-2,
        itemBuilder: (BuildContext context , int index)=> Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal:10.0,vertical:5.0),
          child: Card(
            elevation:5.0,
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0)
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal:10.0,vertical:10.0),
                child: Row(
                  children: <Widget>[
                    
                    Container(
                      width:99.0,
                      height:99.0,
                      child:CircleAvatar(
                        backgroundImage:NetworkImage(chefsList[index].image)

                      ),
                    ),
                    // SizedBox(width:5.0),
                    Row(
                      children: [
                        Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(chefsList[index].name, style: TextStyle(color: Colors.deepOrange ,fontWeight: FontWeight.bold,fontSize: 18.0,)),
                        ),
                        TextButton(
                             onPressed: () {
                           Navigator.push(context,
                            MaterialPageRoute(builder: (context) => chefDetails(
                              name: chefsList[index].name
                            ,description: chefsList[index].description
                            ,imageLink: chefsList[index].image,
                            )
                            )
                            );
                            },
                               child: Text("Know them more" , style: TextStyle(color: Colors.black )),
                             )
                        
                      ],
                    ),        
                      ],
                    ),
                  ],
                ),
              ),

          ),

        )
        
        ) ,
    );
  }
}