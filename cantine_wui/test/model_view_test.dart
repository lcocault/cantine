import "package:flutter_test/flutter_test.dart";
import 'package:cantine_wui/model/memory_storage_strategy.dart';
import 'package:cantine_wui/model/storage_strategy.dart';
import 'package:cantine_wui/modelview/model_view.dart';

void main() async {
  test("ModelView: load", () {
    const data = {
      'courses': [
        {'name': 'Toto', 'thumbnail': 'toto.png', 'price': 2.5, 'tags': []},
        {'name': 'Tata', 'thumbnail': 'tata.png', 'price': 0.25, 'tags': []},
        {'name': 'Titi', 'thumbnail': 'titi.png', 'price': 3.14, 'tags': []}
      ]
    };
    StorageStrategy storage = new MemoryStorageStrategy(data);
    ModelView modelView = new ModelView(storage);
    modelView.isLoaded.then((value) {
      expect(modelView.courses.length, 3);
      expect(modelView.courses.first.name, "Toto");
      expect(modelView.courses.first.thumbnail, "toto.png");
      expect(modelView.courses.first.price, 2.5);
    });
  });
}
