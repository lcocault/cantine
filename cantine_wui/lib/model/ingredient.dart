import 'package:cantine_wui/model/quantity.dart';
import 'package:cantine_wui/model/unit.dart';

class IncompatibleUnits implements Exception {
  // Attributes
  final Unit unit1;
  final Unit unit2;
  // Constructors
  IncompatibleUnits({required this.unit1, required this.unit2}) {}
  // Display
  String errMsg() =>
      'The units ' +
      unit1.toString() +
      ' and ' +
      unit2.toString() +
      ' are incompatible';
}

class Ingredient {
  // Attributes
  final String name;
  final Quantity refQuantity;
  final double refPrice;
  late List<String> tags;
  // Constructors
  Ingredient(
      {required this.name,
      required this.refQuantity,
      required this.refPrice}) {}

  // Factories
  factory Ingredient.fromJson(Map<String, dynamic> data) {
    final name = data["name"];
    final refQuantity = Quantity.fromJson(data["refQuantity"]);
    final refPrice = data["refPrice"];
    final result =
        Ingredient(name: name, refQuantity: refQuantity, refPrice: refPrice);
    return result;
  }

  double getPrice(Quantity quantity) {
    if (quantity.unit != refQuantity.unit) {
      throw new IncompatibleUnits(
          unit1: quantity.unit, unit2: refQuantity.unit);
    }
    return (100.0 * (quantity.value * refPrice) / refQuantity.value)
            .ceilToDouble() /
        100.0;
  }
}
