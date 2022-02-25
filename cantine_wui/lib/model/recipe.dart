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

  static Recipe fromJson(Map<String, Object> data) {
    final recipeName = data["name"] as String;
    final recipePrepTime = data["preparationTime"] as double;
    final recipeCookTime = data["cookingTime"] as double;
    final recipeIngredients = data["ingredients"] as List;
    Recipe result = new Recipe(
        name: recipeName,
        preparationTime: recipePrepTime,
        cookingTime: recipeCookTime);
    recipeIngredients.forEach((ingredient) {
      final ingredientName = ingredient["name"] as String;
      final ingredientQuantity = Quantity.fromJson(ingredient["quantity"]);
      result.addIngredient(ingredientName, ingredientQuantity);
    });
    return result;
  }
}
