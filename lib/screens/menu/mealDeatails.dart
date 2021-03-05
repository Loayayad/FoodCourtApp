import 'package:flutter/material.dart';

class mealDetails extends StatefulWidget {
  String name;
  String description;
  int price;
  String imageLink;
  mealDetails({this.name, this.description, this.price, this.imageLink});
  @override
  _mealDetailsState createState() => _mealDetailsState();
}

class _mealDetailsState extends State<mealDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name), 
      backgroundColor: Colors.deepOrange,),
      body: Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(widget.imageLink),
            Text(widget.description, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign:TextAlign.center),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150.0),
              child: Row(
                
                children: [
                  Text(widget.price.toString()
                  ,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                  color: Colors.deepOrange) ,),
                  Text('L.E',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                  color: Colors.deepOrange)),
                ],
              ),
            ),
          ],
        ),
      ),)
    );
  }
}