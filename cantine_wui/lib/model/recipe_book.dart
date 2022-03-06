import 'package:cantine_wui/model/recipe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookLoadingFailure implements Exception {
  // Attributes
  final String message;
  // Constructors
  BookLoadingFailure({required this.message}) {}
  // Display
  String errMsg() => 'Cannot load the recipe book (code=' + message + ')';
}

class UnknownRecipe implements Exception {
  // Attributes
  final String name;
  // Constructors
  UnknownRecipe({required this.name}) {}
  // Display
  String errMsg() => 'The recipe ' + name + ' is unknown';
}

class RecipeBook {
  // Attributes
  late Map<String, Recipe> recipes;
  // Constructors
  RecipeBook() {
    recipes = {};
  }

  void add(Recipe recipe) {
    recipes.putIfAbsent(recipe.name, () => recipe);
  }

  getRecipe(String recipeName) {
    if (!recipes.containsKey(recipeName)) {
      throw new UnknownRecipe(name: recipeName);
    }
    return recipes[recipeName];
  }

  load(Uri uri) async {
    try {
      final http.Response response = await http.get(uri);
      final List parsedRecipes =
          jsonDecode(response.body.toString()) as List<dynamic>;
      recipes.clear();
      parsedRecipes.forEach((element) {
        add(Recipe.fromJson(element));
      });
    } on Exception catch (err) {
      throw new BookLoadingFailure(message: err.toString());
    }
  }

  // Factories
  factory RecipeBook.fromJson(List<Map<String, Object>> data) {
    final result = RecipeBook();
    data.forEach((element) {
      result.add(Recipe.fromJson(element));
    });
    return result;
  }
}
