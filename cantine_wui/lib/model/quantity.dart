import 'package:cantine_wui/model/unit.dart';

class Quantity {
  // Attributes
  final Unit unit;
  final double value;
  // Constructors
  Quantity({required this.unit, required this.value}) {}

  static Quantity fromJson(Map<String, dynamic> data) {
    final unit = unitFromJson(data["unit"]);
    final value = data["value"];
    final result = Quantity(unit: unit, value: value);
    return result;
  }
}
