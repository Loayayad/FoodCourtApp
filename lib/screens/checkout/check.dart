import 'package:FoodCourtApp/main.dart';
import 'package:FoodCourtApp/models/meal/meal.dart';
import 'package:FoodCourtApp/models/order/order.dart';
import 'package:FoodCourtApp/screens/auth/login.dart';
import 'package:FoodCourtApp/services/auth/auth.dart';
import 'package:FoodCourtApp/services/cart/cartService.dart';
import 'package:FoodCourtApp/services/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Check extends StatefulWidget {
  List<Meal> meals;
  List<int> counters;

  Check({this.meals, this.counters});
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
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

  @override
  void initState() {
    super.initState();
    calculateTotal();
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckOut'),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(
                  width: 16,
                ),
                Container(
                  height: 150,
                  width: 380,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: Colors.black,
                      border: Border.all(
                        color: Colors.orangeAccent,
                        width: 4,
                      )),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15.0),
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
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        // ListView.builder(
                        //     itemCount: widget.counters.length,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       return Padding(
                        //         padding: EdgeInsets.only(left: 25.0),
                        //         child: Row(
                        //           children: [
                        //             Text(
                        //               '${widget.meals[index].price}    x    ${widget.counters[index]}    =    ${widget.meals[index].price * widget.counters[index]} L.E',
                        //               style: TextStyle(fontSize: 18),
                        //             ),
                        //             SizedBox(
                        //               width: 15,
                        //             ),
                        //             Text(
                        //               '${widget.meals[index].name}',
                        //               style: TextStyle(fontSize: 18),
                        //             ),
                        //           ],
                        //         ),
                        //       );
                        //     })
                      ],
                    ),
                  ),
                ),
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
                'Discount: $discount L.E',
                style: TextStyle(fontSize: 22),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                'Total After Discount: $subTotal L.E',
                style: TextStyle(fontSize: 22),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                'Tax: $tax L.E',
                style: TextStyle(fontSize: 22),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                'Delivery Fee: $deliveryFee L.E',
                style: TextStyle(fontSize: 22),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: Container(
                width: 300,
                child: Divider(
                  thickness: 3,
                  color: Colors.deepOrange,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                'Total Price: $total L.E',
                style: TextStyle(fontSize: 22),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: Text(
                "Payment Method",
                style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
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
              title: const Text('Cash on Delivery'),
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
                    Future<void> _showMyDialog() async {
                      return showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Order Sent Successfully'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('Your Order is successfully made '),
                                  Text('Press Home To be back to home page'),
                                  Text('Press exit to logout')
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text(
                                  'Home',
                                  style: TextStyle(color: Colors.deepOrange),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MyApp()));
                                },
                              ),
                              TextButton(
                                child: Text(
                                  'Exit',
                                  style: TextStyle(color: Colors.deepOrange),
                                ),
                                onPressed: () {
                                  _authService.logout(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }

                    Future<void> _userNotlogged() async {
                      return showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Sorry login before order'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text(
                                      'Sorry you have to be logged in before do any order'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text(
                                  'Login',
                                  style: TextStyle(color: Colors.deepOrange),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Login()));
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }

                    //bool islogin = false;

                    _checkOutService.setData().then((value) async {
                      if (value != null) {
                        await _checkOutService
                            .makeOrder(widget.meals, widget.counters,
                                _payment.toString(), discount, subTotal, total)
                            .then((value) {
                          _showMyDialog();
                        });
                      } else {
                        _userNotlogged();
                      }
                    });
                    AlertDialog(
                      title: Text('Order Sent Successfully '),
                      actions: <Widget>[
                        TextButton(
                          child: Text("Home"),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MyApp()));
                          },
                        )
                      ],
                    );
                  }
                  // async {
                  //   await _checkOutService.orderMeal(Order(
                  //       widget.meals,
                  //       widget.counters,
                  //       _payment.toString(),
                  //       discount,
                  //       subTotal,
                  //       total));
                  // },
                  ,
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
          ],
        ),
      ),
    );
  }
}
