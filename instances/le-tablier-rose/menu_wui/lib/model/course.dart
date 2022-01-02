class Course {
  // Attributes
  final String name;
  final String thumbnail;
  final double price;
  // Constructors
  Course({required this.name, required this.thumbnail, required this.price});
  // Factories
  factory Course.fromJson(Map<String, dynamic> data) {
    final name = data["name"];
    final thumbnail = data["thumbnail"];
    final price = data["price"];
    return Course(name: name, thumbnail: thumbnail, price: price);
  }
}
