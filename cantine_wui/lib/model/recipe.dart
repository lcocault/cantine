import 'package:cantine_wui/model/quantity.dart';

class Recipe {
  // Attributes
  final String name;
  final double preparationTime;
  final double cookingTime;
  late Map<String, Quantity> ingredients;
  // Constructors
  Recipe(
      {required this.name,
      required this.preparationTime,
      required this.cookingTime}) {
    ingredients = {};
  }

  void addIngredient(String ingredient, Quantity quantity) {
    ingredients.putIfAbsent(ingredient, () => quantity);
  }

  getQuantity(String t55floor) {
    return ingredients[t55floor];
  }

  static Recipe fromJson(Map<String, String> data) {
    return new Recipe(name: "Pain", preparationTime: 0.0, cookingTime: 0.0);
  }
}
