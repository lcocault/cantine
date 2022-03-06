import 'package:cantine_wui/model/recipe.dart';
import 'package:cantine_wui/model/recipe_book.dart';
import "package:flutter_test/flutter_test.dart";
import 'package:cantine_wui/model/quantity.dart';
import 'package:cantine_wui/model/unit.dart';

void main() async {
  // Recipes
  Recipe bread =
      new Recipe(name: "Pain", preparationTime: 30.0, cookingTime: 40.0);
  bread.addIngredient(
      "Farine T55", new Quantity(unit: Unit.gram, value: 500.0));
  bread.addIngredient(
      "Levure chimique", new Quantity(unit: Unit.gram, value: 10.0));
  Recipe crepe =
      new Recipe(name: "Crêpe", preparationTime: 10.0, cookingTime: 15.0);
  crepe.addIngredient(
      "Farine T55", new Quantity(unit: Unit.gram, value: 250.0));
  crepe.addIngredient("Lait", new Quantity(unit: Unit.liter, value: 0.5));
  RecipeBook book = new RecipeBook();
  book.add(bread);
  book.add(crepe);

  test("Recipe book: Get existing", () {
    expect(book.getRecipe("Pain"), bread);
  });
  test("Recipe book: Recipe not found", () {
    expect(() => book.getRecipe("Galette"), throwsA(isA<UnknownRecipe>()));
  });
  test("Recipe book: from JSON", () {
    var data = [
      {
        'name': 'Pain',
        'preparationTime': 30.0,
        'cookingTime': 40.0,
        'ingredients': [
          {
            'name': 'Farine T55',
            'quantity': {'unit': 'g', 'value': 500.0},
          },
          {
            'name': 'Levure chimique',
            'quantity': {'unit': 'g', 'value': 10.0},
          }
        ]
      },
      {
        'name': 'Crêpe',
        'preparationTime': 10.0,
        'cookingTime': 15.0,
        'ingredients': [
          {
            'name': 'Farine T55',
            'quantity': {'unit': 'g', 'value': 250.0},
          },
          {
            'name': 'Lait',
            'quantity': {'unit': 'L', 'value': 0.5},
          }
        ]
      }
    ];
    RecipeBook jsonBook = RecipeBook.fromJson(data);
    expect(jsonBook.getRecipe("Pain").name, "Pain");
  });

  test("Ingredient catalog: load from remote JSON", () async {
    RecipeBook jsonBook = RecipeBook();
    await jsonBook.load(Uri.parse(
        "https://raw.githubusercontent.com/lcocault/cantine/develop/cantine_wui/test_data/recipe_book_test.json"));
    expect(jsonBook.getRecipe("Pain").name, "Pain");
  });

  test("Ingredient catalog: load from remote JSON failure", () {
    RecipeBook jsonBook = RecipeBook();
    expect(
        () async => await jsonBook.load(Uri.parse(
            "https://raw.githubusercontent.com/lcocault/cantine/develop/cantine_wui/test_data/unknown.json")),
        throwsA(isA<BookLoadingFailure>()));
  });
}
