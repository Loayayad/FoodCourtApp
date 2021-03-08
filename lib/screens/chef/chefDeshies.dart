import 'package:FoodCourtApp/models/meal/meal.dart';
import 'package:FoodCourtApp/screens/menu/mealDeatails.dart';
import 'package:flutter/material.dart';
class chefDeshies extends StatefulWidget {
  String name;
 
   Meal meal;
   
 
  
   chefDeshies({this.meal,this.name});
  @override
  _chefDeshiesState createState() => _chefDeshiesState();
}

class _chefDeshiesState extends State<chefDeshies> {
   
  @override
  Widget build(BuildContext context) {

     return Card(
       
  elevation: 4,
  child: Container(
    padding: EdgeInsets.all(20),
    child: Row(
      children: <Widget>[
        
                   Container(
                         height: 150.0,
                         width: 120.0,
                         decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                          image: DecorationImage(
                          image: NetworkImage(widget.meal.image), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(7.0)
                          ),
                          ),
                    SizedBox(
                       width: 5.0,
                        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // MergeSemantics(
                Row(
                  children: <Widget>[
                    Flexible(
                      
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0,left:8.0),
                        child: Text(
                        widget.meal.name,
                          overflow: TextOverflow.ellipsis,
                          // softWrap: true,
                          style: TextStyle(
                              fontSize: 20,
                              // fontWeight: FontWeight.w600,
                              color: Colors.deepOrange),
                        ),
                      ),
                    )
                  ],
                ),
              // ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Text(
                 widget.meal.description,
                  maxLines: 5,
                  style: TextStyle(
                      fontSize: 17,
                     
                      color: Colors.black87),
                ),
              ),
                          TextButton(
                             onPressed: () {
                           Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>MealDetails (
                               meal: widget.meal,
                               counter: 1,
                            
                            )
                            )
                            );
                            },
                               child: Padding(
                                 padding: const EdgeInsets.only(left:8.0),
                                 child: Text("Show in Menu" , style: TextStyle(color: Colors.deepOrange )),
                               ),
                             )
                 
            ],
          ),
        )
      ],
    ),
  ),
);

  }
}