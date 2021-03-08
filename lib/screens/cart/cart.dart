import 'package:FoodCourtApp/models/meal/meal.dart';
import 'package:FoodCourtApp/services/cart/cartService.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  
  List<Meal> purchasedList;
  CartService cartServ = new CartService();
   @override
  void initState(){
    super.initState();
    purchasedList = cartServ.getMeals();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart'),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.builder(
        itemCount: purchasedList.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  width: 120,
                  height: 100,
                  decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(purchasedList[index].image),
                    fit: BoxFit.fill
                  ),), ),
                  
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(purchasedList[index].name, style: TextStyle(fontSize: 25),),
                  ),
                  Text('${purchasedList[index].price.toString()}L.E', style:TextStyle(color:Colors.deepOrange)),
                ],
              ),
              
              ],
            ),
          );
        }),
        
    );
  }
}