import "package:flutter_test/flutter_test.dart";
import 'package:menu_wui/model/memory_storage_strategy.dart';
import 'package:menu_wui/model/storage_strategy.dart';
import 'package:menu_wui/modelview/model_view.dart';

void main() async {
  test("ModelView: load", () {
    const data = {
      'courses': [
        {'name': 'Toto'},
        {'name': 'Tata'},
        {'name': 'Titi'}
      ]
    };
    StorageStrategy storage = new MemoryStorageStrategy(data);
    ModelView modelView = new ModelView(storage);
    modelView.isLoaded.then((value) => expect(modelView.courses.length, 3));
  });
}
