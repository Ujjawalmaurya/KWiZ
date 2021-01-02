import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:kwiz/constants.dart';

class AddTest extends StatefulWidget {
  @override
  _AddTestState createState() => _AddTestState();
}

class _AddTestState extends State<AddTest> {
  // final List<DropdownMenuItem<dynamic>> list = [];

  var questionOption;

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
                  title: DropdownButton<String>(
                    icon: Icon(Icons.arrow_drop_down),
                    value: (this.questionOption == 'empty')
                        ? null
                        : this.questionOption,
                    hint: Text('Select class'),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.pinkAccent),
                    underline: Container(
                      height: 2,
                      color: Colors.pinkAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        // questionOption = newValue;
                      });
                    },
                    items: <String>[
                      'A',
                      'B',
                      'C',
                      'D',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                ListTile(
                    leading: DecoratedLeadingIcon(icon: Icons.access_alarm)),
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
