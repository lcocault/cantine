import 'package:cantine_wui/model/ingredient.dart';

class UnknownIngredient implements Exception {
  // Attributes
  final String name;
  // Constructors
  UnknownIngredient({required this.name}) {}
  // Display
  String errMsg() => 'The ingredient ' + name + ' is unknown';
}

class IngredientCatalog {
  // Attributes
  late Map<String, Ingredient> ingredients;
  // Constructors
  IngredientCatalog() {
    ingredients = {};
  }

  void add(Ingredient ingredient) {
    ingredients.putIfAbsent(ingredient.name, () => ingredient);
  }

  getIngredient(String ingredientName) {
    if (!ingredients.containsKey(ingredientName)) {
      throw new UnknownIngredient(name: ingredientName);
    }
    return ingredients[ingredientName];
  }

  // Factories
  factory IngredientCatalog.fromJson(List<Map<String, dynamic>> data) {
    final result = IngredientCatalog();
    data.forEach((element) {
      result.add(Ingredient.fromJson(element));
    });
    return result;
  }
}
