import 'package:FoodCourtApp/models/meal/meal.dart';
import 'package:flutter/material.dart';

List<Meal> purchasedItems = [];
class CartService {
  

  void addToCart(Meal selectedMeal){
    purchasedItems.contains(selectedMeal)
    ? print("Meal is already in cart")
    : purchasedItems.add(selectedMeal);
    
  }

  void removeFromCart(Meal selectedMeal){
    purchasedItems.remove(selectedMeal);
  }

  List<Meal> getMeals(){
    return purchasedItems;
  }
}