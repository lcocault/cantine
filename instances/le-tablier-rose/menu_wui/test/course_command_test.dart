import "package:flutter_test/flutter_test.dart";
import 'package:menu_wui/model/course.dart';
import 'package:menu_wui/model/course_command.dart';

void main() async {
  Course pizza = new Course(name: "Pizza", thumbnail: "pizza.png", price: 9.5);
  CourseCommand pizzaCmd = new CourseCommand(course: pizza);
  test("Course command: initialization", () {
    expect(pizzaCmd.course.name, "Pizza");
    expect(pizzaCmd.quantity, 0);
  });
}
