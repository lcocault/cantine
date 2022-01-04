import "package:flutter_test/flutter_test.dart";
import 'package:menu_wui/model/memory_storage_strategy.dart';
import 'package:menu_wui/model/storage_strategy.dart';
import 'package:menu_wui/modelview/model_view.dart';

void main() async {
  test("ModelView: load", () {
    const data = {
      'courses': [
        {'name': 'Toto', 'thumbnail': 'toto.png', 'price': 2.5},
        {'name': 'Tata', 'thumbnail': 'tata.png', 'price': 0.25},
        {'name': 'Titi', 'thumbnail': 'titi.png', 'price': 3.14}
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
