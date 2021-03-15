import 'package:FoodCourtApp/models/meal/meal.dart';
import 'package:FoodCourtApp/models/order/order.dart';
import 'package:FoodCourtApp/services/auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum PaymentMethod { Credit, COA }

class CheckOutService {
  List<Meal> meals;
  List<int> counters;

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
  String userID;

  getMealsAmdCounters(meals, counters) {
    meals = meals;
    counters = counters;
    calculateTotal();
  }

  //Calculating raw subtotal then adding tax and delivery if there is or isn't a discount
  calculateTotal() {
    for (int i = 0; i < meals.length; i++) {
      //mealOrder[i] = {'Meal': widget.meals[i], 'quantity': widget.counters[i]};
      mealsTotal += (meals[i].price * counters[i]);

      if (meals[i].show == true) {
        discount =
            (meals[i].price * int.parse(meals[i].discount.substring(0, 2))) /
                100;
        subTotal += (meals[i].price * counters[i]) - discount;
      } else {
        subTotal += (meals[i].price * counters[i]);
      }
    }
    tax = 14 * subTotal / 100;
    total = tax + subTotal + deliveryFee;
  }

  //Read Data
  final CollectionReference orders = Firestore.instance.collection('ordersApp');
  Future orderMeal(Order order) async {
    await orders
        .document('app')
        .collection('meal')
        .document()
        .setData(order.toMap());
  }

  Future<bool> makeOrder(List<Meal> orderMeals, List<int> counters,
      String payment, double discount, double subtotal, double total) {
    //Meal meal;
    try {
      setData().then((value) {
        print(value);
        for (int i = 0; i < counters.length; i++) {
          print(orderMeals[i].name);
          print(orderMeals[i].price);
          print(counters[i]);

          order() async {
            await orders.document('app').collection('meal').add({
              'mealName': orderMeals[i].name,
              'mealCount': counters[i],
              'option': payment.substring(14),
              'userID': value,
              'mealPrice': orderMeals[i].price
              // 'discount': discount,
              // 'price': price,
              // 'total': total,
            });
          }

          order();
        }
        print(payment.substring(14));
        print(discount);
        print(subtotal);
        print(total);
        //userID = value;
        return Future<bool>.value(true);
      }).catchError((err) {
        return Future<bool>.value(false);
      });
      print(userID);
    } catch (e) {
      return Future<bool>.value(false);
    }
    return Future<bool>.value(false);
  }

  Future<String> setData() async {
    String uID;

    await _authService.loadData().then((value) {
      //print(value);
      uID = value;
    });
    return uID;
  }
}

// Stream<QuerySnapshot> getChefByID(cID) {
//   Stream<QuerySnapshot> chefsI = Firestore.instance
//       .collection('chefs')
//       .where('id', isEqualTo: cID)
//       .snapshots();
//   return chefsI;
// }

// Stream<QuerySnapshot> getMealByChefID(cID) {
//   Stream<QuerySnapshot> mealsL = Firestore.instance
//       .collection('meals')
//       .where('chef', isEqualTo: cID)
//       .snapshots();
//   return mealsL;
// }
