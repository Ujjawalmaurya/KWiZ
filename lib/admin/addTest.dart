import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kwiz/constants.dart';

class AddTest extends StatefulWidget {
  @override
  _AddTestState createState() => _AddTestState();
}

class _AddTestState extends State<AddTest> {
  bool isSwitched = true;
  bool isTrue = false;

  var ansOption;

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
                  leading: SizedBox(),
                  trailing: SizedBox(),
                  title: Text(
                    "Add questions for test",
                    style:
                        TextStyle(fontSize: 29.0, fontWeight: FontWeight.w700),
                  ),
                ),
                // !================= Question Tile===========
                // !====================================================
                ListTile(
                  leading: DecoratedLeadingIcon(
                    icon: Icons.ac_unit,
                  ),
                  title: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Put your question here...',
                      focusColor: Colors.blueGrey,
                      hoverColor: Colors.deepPurpleAccent,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.pinkAccent,
                          width: 2.0,
                        ),
                      ),
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(),
                ListTile(
                  leading: SizedBox(),
                  title: Text(
                    "Switch Right(Bordered) Button to get True-False/Option Answer Type",
                    style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.pink),
                  ),
                ),
                // !================= Answer Tile ========================
                // !===========================================================
                ListTile(
                  leading: DecoratedLeadingIcon(
                      icon: Icons.question_answer_outlined),
                  // title:
                  trailing: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border:
                            Border.all(color: Colors.redAccent, width: 1.5)),
                    child: CupertinoSwitch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                        });
                      },
                      activeColor: Colors.redAccent,
                    ),
                  ),
                  title: isSwitched == true
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("False"),
                            CupertinoSwitch(
                                value: isTrue,
                                onChanged: (value) {
                                  setState(() {
                                    isTrue = value;
                                    print(isTrue);
                                  });
                                }),
                            Text("True")
                          ],
                        )
                      : DropdownButton<String>(
                          icon: Icon(Icons.arrow_drop_down),
                          value: (this.ansOption == 'empty')
                              ? null
                              : this.ansOption,
                          hint: Text('Options..'),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.pinkAccent),
                          underline: Container(
                            height: 2,
                            color: Colors.pinkAccent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              ansOption = newValue;
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
                Divider(),
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
