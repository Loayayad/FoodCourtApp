import 'package:flutter/material.dart';
class chefDetails extends StatefulWidget {
   String name;
   String imageLink;
   String description;

  chefDetails({this.name, this.imageLink , this.description});
  @override
  _chefDetailsState createState() => _chefDetailsState();
}

class _chefDetailsState extends State<chefDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children:<Widget> [
            Stack(
               children:<Widget>[
                 Container(
                   height:350.0,
                   width: double.infinity,

                 ),
                 Container(
                    height:200.0,
                   width: double.infinity,
                   color: Colors.deepOrange,

                 ),
                 Align(
                   alignment:Alignment.topLeft,
                   child: IconButton(
                     icon: Icon(Icons.arrow_back_ios),
                     onPressed: (){},
                     color: Colors.white,
                   ),
                 ),
                 Positioned(
                   top:125.0,
                   left:15.0,
                   right:15.0,
                   child:Material(
                     elevation: 3.0,
                     borderRadius:BorderRadius.circular(7.0) ,
                     child: Container(
                       height:200.0,
                       decoration:BoxDecoration(
                         borderRadius:BorderRadius.circular(7.0),
                         color: Colors.white,
                        ),
                     ),
                   ),
                 ),
                   Positioned(
                     top:75.0,
                     left:(MediaQuery.of(context).size.width/2-50.0),
                     child: Container(
                       height:100.0,
                       width:100.0,
                       decoration:BoxDecoration(
                         borderRadius: BorderRadius.circular(50.0),
                         image: DecorationImage(image:NetworkImage(widget.imageLink)
                          ),
                        ),
                     ),
                   ),
                   Positioned(
                     top:190.0,
                     left:(MediaQuery.of(context).size.width/2-80.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Text(widget.name, style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0),
                         ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.food_bank_outlined)
                      )
                       ],
                      
                     ),
                   ),
                     Positioned(
                     top:230.0,
                     right: 15.0,
                     left:(MediaQuery.of(context).size.width/2-180.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       
                       children: <Widget>[
                         Container(
                            height:200.0,
                           child: Text(widget.description, style: TextStyle(
                        fontSize: 17.0),
                           ),
                         ),
                      
              
                       ],
                     ),
                   ),
               ]
            ),
      ],)
      
    );
  }
}