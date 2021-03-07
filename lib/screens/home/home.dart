import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // return Container(
    //           child:Center(
    //             child:Text('Home')
    //           )
    // );

    return Scaffold(

    body: Stack(

      children: [
        Container(
          height: height* 0.3,
          width: width,
          decoration:BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)
            )
          ),
          child: Column(
            children: [
              SizedBox(height:40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Icon(Icons.dehaze_rounded,color: Colors.white,size:32),
                    Icon(Icons.account_circle,color: Colors.white,size:32),
                  ],
                ),
              ),
              SizedBox(height:50),
              Text(
                'Food Court',
                style: TextStyle(
                  fontSize:30,
                  fontFamily: 'Nunito',
                  color: Colors.white,

                )

              )
            ]
          )
        ),
        Column(
          children: [
            SizedBox(height:height*0.32 ,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text('Recommended',
                  style:TextStyle(
                    fontFamily: 'Nunito',
                    fontSize:20,
                  )
                  ),
                  SizedBox(width:10),
                  Icon(Icons.stars)
                ],
              ),
            ),
            Container(
              height:height*0.4,
              color: Colors.deepOrange,

            )
          ],
        )
      ]
    )
  );
  }
}