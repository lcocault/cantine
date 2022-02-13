import 'package:cantine_wui/model/ingredient.dart';
import 'package:cantine_wui/model/ingredient_catalog.dart';
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

  getQuantity(String ingredientName) {
    return ingredients[ingredientName];
  }

  computeCost(IngredientCatalog catalog) {
    double cost = 0.0;
    ingredients.forEach((ingredientName, ingredientQuantity) {
      Ingredient ingredient = catalog.getIngredient(ingredientName);
      cost = cost + ingredient.getPrice(ingredientQuantity);
    });
    return cost;
  }

  static Recipe fromJson(Map<String, String> data) {
    return new Recipe(name: "Pain", preparationTime: 0.0, cookingTime: 0.0);
  }
}
