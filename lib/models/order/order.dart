import 'package:FoodCourtApp/models/meal/meal.dart';
import 'package:FoodCourtApp/services/cart/cartService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Order {
  //String name;
  String paymentMethod;
  String userID;
  double discount;
  double price;
  double total;
  String mealName;
  int quantity;
  double mealPrice;

//Order(this.name,this.discount,this.price, this.total);}
  Order(this.mealName, this.quantity, this.mealPrice, this.paymentMethod,
      this.discount, this.price, this.total);

  // Order(this.mealOrder, this.paymentMethod, this.discount, this.price,
  //     this.total);

  //Order(this.mealOrder, this.discount, this.price, this.total);
  //Order(this.discount, this.price, this.total);
  Map<String, dynamic> toMap() {
    return {
      'mealName': mealName,
      'mealCount': counters,
      'option': paymentMethod,
      'userID': userID,
      'discount': discount,
      'price': price,
      'total': total,
    };
  }

  Future<String> loadData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("userID");
  }

  setData() {
    loadData().then((value) {
      print(value);
      userID = value;
    });
  }
}
