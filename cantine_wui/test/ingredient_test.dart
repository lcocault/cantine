import "package:flutter_test/flutter_test.dart";
import 'package:cantine_wui/model/ingredient.dart';
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
  test("Ingredient: solid", () {
    expect(butter.name, "Beurre doux");
    expect(butter.refQuantity.unit, Unit.gram);
    expect(butter.refQuantity.value, 1000.0);
    expect(butter.refPrice, 11.16);
  });
  test("Ingredient: liquid", () {
    expect(oliveOil.name, "Huile d'olive");
    expect(oliveOil.refQuantity.unit, Unit.liter);
    expect(oliveOil.refQuantity.value, 1.0);
    expect(oliveOil.refPrice, 6.0);
  });
  test("Ingredient: get a price", () {
    Quantity quantity = new Quantity(unit: Unit.gram, value: 50.0);
    expect(butter.getPrice(quantity), 0.56);
  });
  test("Ingredient: incompatible units", () {
    Quantity quantity = new Quantity(unit: Unit.gram, value: 50.0);
    expect(
        () => oliveOil.getPrice(quantity), throwsA(isA<IncompatibleUnits>()));
  });
  test("Ingredient: from JSON", () {
    var data = {
      'name': 'Beurre doux',
      'refQuantity': {'unit': 'g', 'value': 1000.0},
      'refPrice': 11.16
    };
    Ingredient butter = Ingredient.fromJson(data);
    expect(butter.name, "Beurre doux");
    expect(butter.refQuantity.unit, Unit.gram);
    expect(butter.refQuantity.value, 1000.0);
    expect(butter.refPrice, 11.16);
  });
}
