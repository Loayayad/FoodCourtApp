import 'package:FoodCourtApp/models/meal/meal.dart';


List<Meal> purchasedItems = [];
List<int> counters = [];
int total = 0;
class CartService {
  

  void addToCart(Meal selectedMeal, int counter){
    
    purchasedItems.add(selectedMeal);
    counters.add(counter);
    print(purchasedItems);
    print(counters);
    
  }

  void removeFromCart(int index){
    purchasedItems.removeAt(index);
    counters.removeAt(index);
  }

  List<Meal> getMeals(){
    return purchasedItems;
  }

  List<int> getCounters(){
    return counters;
  }
  calculateTotal(){
    for(int i=0; i<purchasedItems.length; i++)
    {
      total += (purchasedItems[i].price*counters[i]) ; 
    }
  }

  int getTotal(){
    return total ;
  }
}