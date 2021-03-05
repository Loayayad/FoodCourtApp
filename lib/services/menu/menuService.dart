//import '../../models/meal/meal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuService {
  //Read Data From FireStore
  // final CollectionReference meals = Firestore.instance.collection('meals').doc('en').collection('en');
  final CollectionReference meals = Firestore.instance.collection('meals');
  
  Stream<QuerySnapshot> getMealByCategoryID(catID){
    // Stream<QuerySnapshot> snapshots = meals.snapshots();
    Stream<QuerySnapshot> mealsL = Firestore.instance.collection('meals').where('category', isEqualTo: catID).snapshots();
    return mealsL;
  }
  Stream<QuerySnapshot> getAllMeals(){
    Stream<QuerySnapshot> snapshots = meals.snapshots();
    return snapshots;
  }

}