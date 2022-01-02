import 'package:flutter/material.dart';
import 'package:menu_wui/shared/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Le Tablier Rose')),
        drawer: MenuDrawer(),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('background.jpg'), fit: BoxFit.cover)),
            child: Center(
                child: Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white70),
                    child: Text(
                        'Le Tablier Rose vous propose des délices à emporter.',
                        style: TextStyle(fontSize: 22, shadows: [
                          Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 2.0,
                              color: Colors.grey)
                        ]))))));
  }
}
