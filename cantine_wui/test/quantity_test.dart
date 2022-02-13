import 'package:cantine_wui/model/unit.dart';
import "package:flutter_test/flutter_test.dart";
import 'package:cantine_wui/model/quantity.dart';

void main() async {
  Quantity g250 = new Quantity(unit: Unit.gram, value: 250.0);
  test("Quantity: initialisation", () {
    expect(g250.unit, Unit.gram);
    expect(g250.value, 250.0);
  });
  test("Quantity: from JSON", () {
    var data = {'unit': 'g', 'value': 123.4};
    Quantity quantity = Quantity.fromJson(data);
    expect(quantity.unit, Unit.gram);
    expect(quantity.value, 123.4);
  });
}
