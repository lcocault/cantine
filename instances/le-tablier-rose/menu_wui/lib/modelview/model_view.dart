import 'package:flutter/cupertino.dart';
import 'package:menu_wui/model/course.dart';
import 'package:menu_wui/model/storage_strategy.dart';

class ModelView extends ChangeNotifier {
  final StorageStrategy _storage;
  late Future<void> _isLoaded;
  List<Course> courses = [];

  ModelView(this._storage) {
    _isLoaded = loadAll();
  }

  Future<void> loadAll() async => importFromMap(await _storage.read());
  Future<void> get isLoaded => _isLoaded;

  importFromMap(Map<String, dynamic> map) {
    // Exact the data from the JSON payload
    List<Map<String, dynamic>> jsonCourses = map["courses"];
    jsonCourses.forEach((course) {
      courses.add(Course.fromJson(course));
    });
  }
}

late ModelView model;
