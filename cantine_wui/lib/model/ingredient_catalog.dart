import 'dart:io';

import 'package:cantine_wui/model/ingredient.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CatalogLoadingFailure implements Exception {
  // Attributes
  final String message;
  // Constructors
  CatalogLoadingFailure({required this.message}) {}
  // Display
  String errMsg() => 'Cannot load the catalog (code=' + message + ')';
}

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

  load(Uri uri) async {
    try {
      final http.Response response = await http.get(uri);
      final List parsedIngredients =
          jsonDecode(response.body.toString()) as List<dynamic>;
      ingredients.clear();
      parsedIngredients.forEach((element) {
        add(Ingredient.fromJson(element));
      });
    } on Exception catch (err) {
      throw new CatalogLoadingFailure(message: err.toString());
    }
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
