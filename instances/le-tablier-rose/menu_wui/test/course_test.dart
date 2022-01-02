import "package:flutter_test/flutter_test.dart";
import 'package:menu_wui/model/course.dart';

void main() async {
  Course pizza = new Course(name: "Pizza", thumbnail: "pizza.png", price: 9.5);
  test("Course: initialization", () {
    expect(pizza.name, "Pizza");
    expect(pizza.thumbnail, "pizza.png");
    expect(pizza.price, 9.5);
  });
}
