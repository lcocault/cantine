import 'package:flutter/material.dart';
import 'package:menu_wui/view/menu_screen.dart';
import '../view/intro_screen.dart';
import '../view/menu_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(child: ListView(children: buildMenuItems(context)));
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuItemNames = ["Carte", "Récupérer vos commandes"];
    List<Widget> menuItems = [];
    menuItems.add(DrawerHeader(
        decoration: BoxDecoration(color: Colors.pink),
        child: Text("Le tablier rose",
            style: TextStyle(color: Colors.white, fontSize: 28))));
    menuItemNames.forEach((String name) {
      Widget screen = Container();
      menuItems.add(ListTile(
          title: Text(name, style: TextStyle(fontSize: 18)),
          onTap: () {
            switch (name) {
              case 'Home':
                screen = IntroScreen();
                break;
              case 'Carte':
                screen = MenuScreen();
                break;
              default:
            }
            Navigator.of(context).pop();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => screen));
          }));
    });
    return menuItems;
  }
}
