import 'package:FoodCourtApp/models/meal/meal.dart';
import 'package:FoodCourtApp/screens/cart/cart.dart';
import 'package:FoodCourtApp/screens/offers/offers.dart';
import 'package:FoodCourtApp/services/cart/cartService.dart';

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
  CartService cService = new CartService();
  double total = 0 ;
  calcDiscount(int price, String discount)
  {
    setState(() {
    total = price - ((price * int.parse(discount.substring(0,2))) / 100);
    });
  }
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
        
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 260,
                  width: 400,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: NetworkImage(
                            widget.meal.image,
                          ),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(15.0)),
                ),
                //Image.network(widget.meal.image),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.meal.description,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 170.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          '${widget.meal.price} L.E',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange),
                        ),
                      ),
                      
                    ],
                  ),
                ),
                Text(
                      (() {
                        if(widget.meal.show){
                          calcDiscount(widget.meal.price, widget.meal.discount);
                          return '${widget.meal.discount} OFF price after:  $total L.E' ;}

                        return "";
                      })(),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey),
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
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    width: 150,
                    child: RaisedButton(
                      child: Text('Add to cart', style: TextStyle(color:Colors.white),),
                      color: Colors.deepOrange,
                      onPressed: (){
                        cService.addToCart(widget.meal, widget.counter);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
