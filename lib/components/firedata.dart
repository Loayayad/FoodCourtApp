import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetData extends StatefulWidget {
  @override
  _GetDataState createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("fire data"),
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection("meals")
            .document("ar")
            .collection("ar")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text("loading....");
          return Column(
            children: [
              Text(snapshot.data.documents[1]['name']),
              Text(snapshot.data.documents[1]['description']),
            ],
          );
        },
      ),
    );
  }
}
