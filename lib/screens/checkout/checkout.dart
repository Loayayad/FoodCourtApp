import 'package:FoodCourtApp/models/meal/meal.dart';
import 'package:FoodCourtApp/services/cart/cartService.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  List<Meal> meals ;
  CheckOut({this.meals});
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  double total = 0;
  double subTotal = 0;
  double tax = 0.14;
  double deliveryFee = 20;
  calculateTotal(){
    for(int i=0; i<widget.meals.length; i++)
    {
      setState(() {
        subTotal += widget.meals[i].price ; 
      });
    }
    setState(() {
      total = (subTotal * tax) + subTotal + deliveryFee ;
    });
  }
  @override
  void initState() {
    super.initState();
    calculateTotal();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CheckOut')),
      body: Text('Total Price: ${total.toString()}', style: TextStyle(fontSize: 50),),
    );
  }
}