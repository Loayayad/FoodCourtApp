import 'package:FoodCourtApp/models/meal/meal.dart';
import 'package:FoodCourtApp/services/cart/cartService.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  List<Meal> meals ;
  List<int> counters;
  CheckOut({this.meals, this.counters});
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  //Calculating Total
  double total = 0;
  double subTotal = 0;
  double tax = 0;
  double deliveryFee = 20;
  double discount = 0;
  //Calculating raw subtotal then adding tax and delivery if there is or isn't a discount
  calculateTotal(){
    for(int i=0; i<widget.meals.length; i++)
    {
      setState(() {
        if(widget.meals[i].show == true)
        {
          
          discount = (widget.meals[i].price * int.parse(widget.meals[i].discount.substring(0,2))) / 100;
          subTotal += ( widget.meals[i].price * widget.counters[i] ) - discount;  
        }
        else{
          subTotal += ( widget.meals[i].price * widget.counters[i] );
        }
      });
    }
    setState(() {
      tax = 14 * subTotal / 100 ;
      total = tax + subTotal + deliveryFee ;
    });
  }
  @override
  void initState() {
    super.initState();
    calculateTotal();
    print(purchasedItems[0].discount.substring(0,2));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CheckOut'), backgroundColor: Colors.deepOrange,),

      //Displaying only the total price, do as you wish here.
      body: Text('Total Price: ${total.toString()}', style: TextStyle(fontSize: 50),),
    );
  }
}