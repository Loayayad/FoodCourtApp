import 'package:FoodCourtApp/models/meal/meal.dart';
import 'package:FoodCourtApp/models/order/order.dart';
import 'package:FoodCourtApp/services/auth/auth.dart';
import 'package:FoodCourtApp/services/cart/cartService.dart';
import 'package:FoodCourtApp/services/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PaymentMethod { Credit, COA }

// ignore: must_be_immutable
class CheckOut extends StatefulWidget {
  List<Meal> meals;
  List<int> counters;

  CheckOut({this.meals, this.counters});
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final CheckOutService _checkOutService = CheckOutService();
  final AuthService _authService = AuthService();

  PaymentMethod _payment = PaymentMethod.Credit;
  //List<Map<String, dynamic>> mealOrder;
  //Calculating Total
  double mealsTotal = 0;
  double total = 0;
  double subTotal = 0;
  double tax = 0;
  double deliveryFee = 20;
  double discount = 0;

  //Calculating raw subtotal then adding tax and delivery if there is or isn't a discount
  calculateTotal() {
    for (int i = 0; i < widget.meals.length; i++) {
      //mealOrder[i] = {'Meal': widget.meals[i], 'quantity': widget.counters[i]};
      mealsTotal += (widget.meals[i].price * widget.counters[i]);
      setState(() {
        if (widget.meals[i].show == true) {
          discount = (widget.meals[i].price *
                  int.parse(widget.meals[i].discount.substring(0, 2))) /
              100;
          subTotal += (widget.meals[i].price * widget.counters[i]) - discount;
        } else {
          subTotal += (widget.meals[i].price * widget.counters[i]);
        }
      });
    }
    setState(() {
      tax = 14 * subTotal / 100;
      total = tax + subTotal + deliveryFee;
    });
  }

  @override
  void initState() {
    super.initState();
    calculateTotal();

    // for (var i = 0; i < widget.meals.length; i++) {
    //   mealOrder[i] = {'Meal': widget.meals[i], 'quantity': widget.counters[i]};
    // }
    print(purchasedItems[0].discount.substring(0, 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CheckOut'),
          backgroundColor: Colors.deepOrange,
        ),

        //Displaying only the total price, do as you wish here.
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 16,
              ),
              Center(
                child: Text(
                  "CheckOut Form",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 36,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text(
                      'Price',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text(
                      'Quantity',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text(
                      'Total',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 45.0),
                    child: Text(
                      'Meal',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),

              for (var i = 0; i < widget.meals.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 25.0),
                        child: Row(
                          children: [
                            Text(
                              '${widget.meals[i].price}    x    ${widget.counters[i]}    =    ${widget.meals[i].price * widget.counters[i]} L.E',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              '${widget.meals[i].name}',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ))
                  ],
                ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Text(
                  'Meals Total: $mealsTotal L.E',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Text(
                  'Discount: $discount',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Text(
                  'Total After Discount: $subTotal',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Text(
                  'Tax: $tax',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Text(
                  'Delivery Fee: $deliveryFee',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Text(
                  'Total Price: $total',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ListTile(
                title: const Text('Credit'),
                leading: Radio<PaymentMethod>(
                  value: PaymentMethod.Credit,
                  groupValue: _payment,
                  onChanged: (PaymentMethod value) {
                    setState(() {
                      _payment = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Cash On Arrival'),
                leading: Radio<PaymentMethod>(
                  value: PaymentMethod.COA,
                  groupValue: _payment,
                  onChanged: (PaymentMethod value) {
                    setState(() {
                      _payment = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: Container(
                  width: 120,
                  child: FlatButton(
                    child: Text("Order Now"),
                    textColor: Colors.white,
                    padding: EdgeInsets.all(16),
                    onPressed: () async {
                      await _checkOutService.orderMeal(Order(
                          widget.meals,
                          widget.counters,
                          _payment.toString(),
                          discount,
                          subTotal,
                          total));
                    },
                    color: Colors.deepOrange,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 16,
              ),

              // ListView(
              //   itemCount: widget.meals.length,
              //   itemBuilder: (context, index) {
              //     return Container(
              //       child: Text('${widget.meals[index].name}'),
              //     );
              //   },
              // ),
            ],
          ),
        ));
  }
}
