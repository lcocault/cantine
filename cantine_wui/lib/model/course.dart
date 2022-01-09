class Course {
  // Attributes
  final String name;
  final String thumbnail;
  final double price;
  late List<String> tags;
  // Constructors
  Course({required this.name, required this.thumbnail, required this.price}) {
    this.tags = List.from({});
  }
  // Factories
  factory Course.fromJson(Map<String, dynamic> data) {
    final name = data["name"];
    final thumbnail = data["thumbnail"];
    final price = data["price"];
    final List tags = data["tags"];
    final result = Course(name: name, thumbnail: thumbnail, price: price);
    tags.forEach((tag) {
      result.addTag(tag);
    });
    return result;
  }

  void addTag(String tag) {
    tags.add(tag);
  }
}
