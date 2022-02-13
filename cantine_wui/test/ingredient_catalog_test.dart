import "package:flutter_test/flutter_test.dart";
import 'package:cantine_wui/model/ingredient.dart';
import 'package:cantine_wui/model/ingredient_catalog.dart';
import 'package:cantine_wui/model/quantity.dart';
import 'package:cantine_wui/model/unit.dart';

void main() async {
  Ingredient butter = new Ingredient(
      name: "Beurre doux",
      refQuantity: new Quantity(unit: Unit.gram, value: 1000.0),
      refPrice: 11.16);
  Ingredient oliveOil = new Ingredient(
      name: "Huile d'olive",
      refQuantity: new Quantity(unit: Unit.liter, value: 1.0),
      refPrice: 6.0);
  IngredientCatalog catalog = new IngredientCatalog();
  catalog.add(butter);
  catalog.add(oliveOil);
  test("Ingredient catalog: Get existing", () {
    expect(catalog.getIngredient("Beurre doux"), butter);
  });
  test("Ingredient catalog: Ingredient not found", () {
    expect(() => catalog.getIngredient("Chocolat"),
        throwsA(isA<UnknownIngredient>()));
  });
  test("Ingredient catalog: from JSON", () {
    var data = [
      {
        'name': 'Beurre doux',
        'refQuantity': {'unit': 'g', 'value': 1000.0},
        'refPrice': 11.16
      },
      {
        'name': 'Huide d' 'olive',
        'refQuantity': {'unit': 'L', 'value': 1.0},
        'refPrice': 6.0
      }
    ];
    IngredientCatalog jsonCatalog = IngredientCatalog.fromJson(data);
    expect(jsonCatalog.getIngredient("Beurre doux").name, "Beurre doux");
  });
}
