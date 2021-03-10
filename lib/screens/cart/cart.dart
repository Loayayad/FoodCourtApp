import 'package:FoodCourtApp/models/meal/meal.dart';
import 'package:FoodCourtApp/screens/checkout/checkout.dart';
import 'package:FoodCourtApp/services/cart/cartService.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  
  List<Meal> purchasedList;
  List<int> counters;
  CartService cartServ = new CartService();

///////////////////////////////The Functions to count in the array////////////////////////////////
// void add(i) {
//     setState(() {
//       counters[i]++;
//     });
//   }

//   void minus(i) {
//     if (counters[i] != 0) {
//       setState(() {
//         counters[i]--;
//       });
//     }
//   }

   @override
  void initState(){
    super.initState();
    //Getting selected meals and their quantity from the service.
    purchasedList = cartServ.getMeals();
    counters = cartServ.getCounters();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart'),
        backgroundColor: Colors.deepOrange,
        actions:<Widget>[
        IconButton(
          icon: Icon(Icons.check,
          color:Colors.white,
          size: 30,
          ),
          //sending the meals and their counts to the checkout component to complete the calculations
          onPressed: (){
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => CheckOut(meals: purchasedList, counters: counters)));
          },
        )
      ],
      ),
      
      body: ListView.builder(
        itemCount: purchasedList.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Stack(
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
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top:40),
                    child: Text(
                      (() {
                        if(purchasedList[index].show){
                          return '  ${purchasedList[index].discount} OFF  ';}

                        return "";
                      })(),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, backgroundColor: Colors.black45),
                    ),
                  ),
                  ],
                ),
                
                  
              Column(
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text('${purchasedList[index].name} x ${counters[index]}', style: TextStyle(fontSize: 18),),
                  ),
                
                Padding(
                  padding: const EdgeInsets.only(left: 20, top:10),
                  child: Row(
                    children: [
                    Padding(
                      padding: const EdgeInsets.only(right:8.0),
                      child: Text('${purchasedList[index].price.toString()}L.E', 
                      style:TextStyle(color:Colors.deepOrange,
                      fontSize: 16,
                      )),
                    ),

/////////////////////////////////////////////HERE THE CODE FOR COUNTER IN THE ARRAY//////////////////////////////////
                    // Container(
                    //   width:30,
                    //   height:30,
                    //   child: new FloatingActionButton(
                    //     onPressed: () {
                    //       minus(index);
                    //     },
                    //     heroTag: "Subtract",
                    //     child: new Icon(
                    //       Icons.arrow_drop_down,
                    //       color: Colors.black,
                    //       size: 18,
                    //     ),
                    //     backgroundColor: Colors.white,
                    //   ),
                    // ),
                    // new Text(counters[index].toString(),
                    //     style: new TextStyle(
                    //         fontSize: 30.0, color: Colors.black)),
                    // Container(
                    //   width:30,
                    //   height:30,
                    //   child: new FloatingActionButton(
                        
                    //     onPressed: () {
                    //       add(index);
                    //     },
                    //     heroTag: "Add",
                    //     child: new Icon(
                    //       Icons.arrow_drop_up,
                    //       color: Colors.black,
                    //       size: 18,
                    //     ),
                    //     backgroundColor: Colors.white,
                    //   ),
                    // ),

                    ],
                  ),
                ),
                ],
              ),
              
              ],
            ),
          );
        }),
        
    );
  }
}