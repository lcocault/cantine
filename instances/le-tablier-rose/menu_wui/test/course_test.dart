import "package:flutter_test/flutter_test.dart";
import 'package:menu_wui/model/course.dart';

void main() async {
  Course pizza = new Course(name: "Pizza", thumbnail: "pizza.png", price: 9.5);
  test("Course: initialization", () {
    expect(pizza.name, "Pizza");
    expect(pizza.thumbnail, "pizza.png");
    expect(pizza.price, 9.5);
    expect(pizza.tags.length, 0);
  });
  test("Course: tags management", () {
    pizza.addTag("IGB");
    pizza.addTag("Zero");
    expect(pizza.tags.length, 2);
  });
  test("Course: from JSON", () {
    var data = {
      'name': 'Burger',
      'thumbnail': 'burger.png',
      'price': 10.5,
      'tags': ['IGB', 'Zero']
    };
    Course burger = Course.fromJson(data);
    expect(burger.name, "Burger");
    expect(burger.thumbnail, "burger.png");
    expect(burger.price, 10.5);
    expect(burger.tags.length, 2);
  });
}
