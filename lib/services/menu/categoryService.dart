import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryService {
  //Read Data From FireStore
  final CollectionReference categories = Firestore.instance.collection('categories');
  
  Stream<QuerySnapshot> getAllCategories(){
    Stream<QuerySnapshot> snapshots = categories.snapshots();
    return snapshots;
  }

}