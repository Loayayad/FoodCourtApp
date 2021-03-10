import 'package:FoodCourtApp/models/meal/meal.dart';
import 'package:FoodCourtApp/screens/cart/cart.dart';
import 'package:FoodCourtApp/screens/offers/offers.dart';

import 'package:flutter/material.dart';

class MealDetails extends StatefulWidget {
  Meal meal;
  int counter;
  MealDetails({this.meal, this.counter});
  // MealDetails({this.name, this.description, this.price, this.imageLink});
  @override
  _MealDetailsState createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  void add() {
    setState(() {
      widget.counter++;
    });
  }

  void minus() {
    if (widget.counter != 0) {
      setState(() {
        widget.counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.meal.name),
          backgroundColor: Colors.deepOrange,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                RaisedButton(
                  child: Text('Show Offers'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Offers()));
                  },
                ),
                Image.network(widget.meal.image),
                Text(widget.meal.description,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 170.0),
                  child: Row(
                    children: [
                      Text(
                        widget.meal.price.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange),
                      ),
                      Text('L.E',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 125),
                  child: Row(
                    children: [
                      new FloatingActionButton(
                        onPressed: () {
                          minus();
                        },
                        heroTag: "Subtract",
                        child: new Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        backgroundColor: Colors.white,
                      ),
                      new Text(widget.counter.toString(),
                          style: new TextStyle(
                              fontSize: 60.0, color: Colors.black)),
                      new FloatingActionButton(
                        onPressed: () {
                          add();
                        },
                        heroTag: "Add",
                        child: new Icon(
                          Icons.arrow_drop_up,
                          color: Colors.black,
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
