import 'package:cantine_wui/model/quantity.dart';

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
}
