import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_wui/model/course_command.dart';
import 'package:provider/provider.dart';

class CourseView extends StatelessWidget {
  final CourseCommand _courseCommand;

  const CourseView(this._courseCommand);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CourseCommand>.value(
        value: _courseCommand,
        child: Row(children: [
          renderThumbnail(),
          renderName(),
          renderTags(),
          renderPrice()
        ]));
  }

  Column renderTags() {
    List<Widget> tags = List.from({});
    _courseCommand.course.tags.forEach((tag) => tags.add(renderTag(tag)));
    return Column(children: tags);
  }

  computeTagColor(String tag) {
    Color result = Colors.black;
    switch (tag) {
      case "IGB":
        result = Colors.blue;
        break;
      case "Zero":
        result = Colors.green;
        break;
    }
    return result;
  }

  Container renderTag(String tag) {
    return Container(
        child: Text(tag, style: TextStyle(color: Colors.white)),
        width: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: computeTagColor(tag)));
  }

  Container renderName() {
    return Container(
      child: Text(_courseCommand.course.name,
          style: TextStyle(fontSize: 28, color: Colors.pink)),
      margin: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
    );
  }

  Image renderThumbnail() {
    return Image.network(
      _courseCommand.course.thumbnail,
      width: 50,
      height: 50,
    );
  }

  Container renderPrice() {
    return Container(
        child: Text(_courseCommand.course.price.toString() + "€",
            style: TextStyle(color: Colors.white)),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 20.0),
            color: Colors.black));
  }
}
