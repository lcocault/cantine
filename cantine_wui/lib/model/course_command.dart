import 'package:flutter/cupertino.dart';
import 'package:cantine_wui/model/course.dart';

class CourseCommand extends ChangeNotifier {
  // Attributes
  final Course course;
  int quantity;
  // Constructors
  CourseCommand({required this.course, this.quantity = 0});
  // Methods
  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity > 0) {
      quantity--;
    }
  }
}
