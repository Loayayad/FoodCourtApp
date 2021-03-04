import 'package:cloud_firestore/cloud_firestore.dart';
class ChefService{
  //Read Data 
 final CollectionReference chefs =Firestore.instance.collection('chefs');
 Stream<QuerySnapshot> getChefsList(){
   Stream<QuerySnapshot> snapshots = chefs.snapshots();
   return snapshots;
 }

}