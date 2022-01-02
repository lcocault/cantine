import 'package:flutter/material.dart';
import 'package:menu_wui/model/memory_storage_strategy.dart';
import 'package:menu_wui/modelview/model_view.dart';
import 'package:menu_wui/view/intro_screen.dart';

void main() {
  const data = {
    'courses': [
      {
        'name': 'Canelé',
        'thumbnail': 'https://image.flaticon.com/icons/png/512/164/164659.png',
        'price': 2.5
      },
      {
        'name': 'Cookie',
        'thumbnail': 'https://image.flaticon.com/icons/png/512/164/164659.png',
        'price': 1.75
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
