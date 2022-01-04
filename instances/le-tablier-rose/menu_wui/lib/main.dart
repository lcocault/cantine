import 'package:flutter/material.dart';
import 'package:menu_wui/model/memory_storage_strategy.dart';
import 'package:menu_wui/modelview/model_view.dart';
import 'package:menu_wui/view/intro_screen.dart';

void main() {
  const data = {
    'courses': [
      {
        'name': 'Canelé',
        'thumbnail': 'icons/canele-ico.png',
        'price': 2.5,
        'tags': ['IGB', 'Zero']
      },
      {
        'name': 'Cookie',
        'thumbnail': 'icons/cookie-ico.png',
        'price': 1.75,
        'tags': ['IGB', 'Ethic']
      },
    ]
  };
  model = ModelView(MemoryStorageStrategy(data));
  runApp(MenuApp());
}

class MenuApp extends StatelessWidget {
  const MenuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.pink), home: IntroScreen());
  }
}
