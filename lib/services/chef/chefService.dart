import 'package:cloud_firestore/cloud_firestore.dart';
class ChefService{
  //Read Data 
 final CollectionReference chefs =Firestore.instance.collection('chefs');
 Stream<QuerySnapshot> getChefsList(){
   Stream<QuerySnapshot> snapshots = chefs.snapshots();
   return snapshots;
 }
 
  Stream<QuerySnapshot> getChefByID(cID){
    Stream<QuerySnapshot> chefsI = Firestore.instance.collection('chefs').where('id', isEqualTo: cID).snapshots();
    return chefsI;
  }

}