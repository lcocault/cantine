import 'package:flutter/material.dart';
import 'package:menu_wui/model/course_command.dart';
import 'package:menu_wui/modelview/model_view.dart';
import 'package:menu_wui/shared/menu_drawer.dart';
import 'package:menu_wui/view/course_view.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: model.isLoaded,
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.done
              ? _scaffold()
              : Container(
                  color: Colors.white,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
    );
  }

  Widget _scaffold() {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar:
              AppBar(title: Text("Les délices proposés par le tablier rose")),
          body: ChangeNotifierProvider<ModelView>.value(
              value: model,
              builder: (context, snapshot) => ListView.builder(
                  itemCount: model.courses.length,
                  itemBuilder: (context, index) =>
                      CourseView(CourseCommand(course: model.courses[index])))),
          drawer: MenuDrawer(),
        ));
  }
}
