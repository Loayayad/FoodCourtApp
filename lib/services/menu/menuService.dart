//import '../../models/meal/meal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuService {
  //Read Data From FireStore
  // final CollectionReference meals = Firestore.instance.collection('meals').doc('en').collection('en');
  final CollectionReference meals = Firestore.instance.collection('meals');
  Stream<QuerySnapshot> getMealsList(){
    Stream<QuerySnapshot> snapshots = meals.snapshots();
    return snapshots;
  }
}