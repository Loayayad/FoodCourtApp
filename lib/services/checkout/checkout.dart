import 'package:FoodCourtApp/models/order/order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckOutService {
  //Read Data
  final CollectionReference orders = Firestore.instance.collection('ordersApp');
  Future orderMeal(Order order) async {
    await orders.document('app').collection('meal').add(order.toMap());
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
}
