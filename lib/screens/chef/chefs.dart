import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../services/chef/chefService.dart';
import '../../models/chef/chef.dart';

class Chef extends StatefulWidget {
  @override
  _ChefState createState() => _ChefState();
}

class _ChefState extends State<Chef> {
  StreamSubscription<QuerySnapshot> chefs;
  List<Chef> chefsList;
  ChefService chefServ = new ChefService();
  @override
  void initState() {
    super.initState();

    chefsList = new List();
    chefs?.cancel();
    chefs = chefServ.getChefsList().listen((QuerySnapshot snapshot) {
      chefsList = snapshot.documents.map((documentSnapshot)
        => Chef(
          documentSnapshot.data['id'],
          documentSnapshot.data['name'],
          documentSnapshot.data['image'],
          documentSnapshot.data['description'],
       )).toList();
       setState(() {});
    });
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}