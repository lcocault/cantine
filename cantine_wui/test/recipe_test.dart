import 'package:cantine_wui/model/ingredient.dart';
import 'package:cantine_wui/model/ingredient_catalog.dart';
import 'package:cantine_wui/model/quantity.dart';
import 'package:cantine_wui/model/recipe.dart';
import 'package:cantine_wui/model/unit.dart';
import "package:flutter_test/flutter_test.dart";

void main() async {
  // Ingredients catalog
  Ingredient t55Floor = new Ingredient(
      name: "Farine T55",
      refQuantity: new Quantity(unit: Unit.gram, value: 1000.0),
      refPrice: 1.55);
  Ingredient bakingPower = new Ingredient(
      name: "Levure chimique",
      refQuantity: new Quantity(unit: Unit.gram, value: 100.0),
      refPrice: 1.36);
  IngredientCatalog catalog = new IngredientCatalog();
  catalog.add(t55Floor);
  catalog.add(bakingPower);

  // Recipe
  Recipe bread =
      new Recipe(name: "Pain", preparationTime: 30.0, cookingTime: 40.0);
  bread.addIngredient(
      "Farine T55", new Quantity(unit: Unit.gram, value: 500.0));
  bread.addIngredient(
      "Levure chimique", new Quantity(unit: Unit.gram, value: 10.0));

  test("Recipe: initialization", () {
    expect(bread.name, "Pain");
    expect(bread.preparationTime, 30.0);
    expect(bread.cookingTime, 40.0);
    expect(bread.getQuantity("Farine T55").value, 500.0);
    expect(bread.getQuantity("Levure chimique").value, 10.0);
  });

  test("Recipe: cost computation", () {
    expect(bread.computeCost(catalog), 0.92);
  });

  test("Recipe: from JSON", () {
    var data = {'name': 'Pain'};
    Recipe bread = Recipe.fromJson(data);
    expect(bread.name, "Pain");
  });
}
