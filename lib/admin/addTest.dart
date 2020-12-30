import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:kwiz/constants.dart';

class AddTest extends StatefulWidget {
  @override
  _AddTestState createState() => _AddTestState();
}

class _AddTestState extends State<AddTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Color(0xFF276254),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0))),
              child: ListView(children: [
                ListTile(
                  leading: DecoratedLeadingIcon(
                    icon: Icons.alarm_add,
                  ),
                  title: TextFormField(
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
                ListTile(
                  leading: DecoratedLeadingIcon(
                      icon: Icons.question_answer_outlined),
                  // title: ,
                ),
                ListTile(
                  leading: DecoratedLeadingIcon(icon: Icons.access_alarm),
                ),
                Container(
                  height: 50.0,
                  margin: EdgeInsets.only(left: 80.0, right: 80.0),
                  child: RaisedButton(
                    shape: adminButtonShape,
                    onPressed: () {},
                    color: Colors.pinkAccent,
                    child: Text(
                      "Add",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ]),
            )));
  }
}

class DecoratedLeadingIcon extends StatelessWidget {
  DecoratedLeadingIcon({
    @required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return DecoratedIcon(icon, color: Colors.pink, size: 35.0, shadows: [
      BoxShadow(
        blurRadius: 15.0,
        color: Colors.pink,
      ),
      BoxShadow(
        blurRadius: 25.0,
        color: Colors.white,
      ),
    ]);
  }
}
