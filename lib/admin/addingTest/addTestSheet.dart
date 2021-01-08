import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/cupertino.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kwiz/constants.dart';

class AddTest extends StatefulWidget {
  @override
  _AddTestState createState() => _AddTestState();
}

class _AddTestState extends State<AddTest> {
  // final dRefrence = FirebaseDatabase.instance.reference();
  bool isUploading;
  String question;
  bool isBool = true;
  bool isBoolAnswer = false;
  var correctOption;
  String optionA, optionB, optionC, optionD;
  var currentDate = '7-Jan-2021';
  var branch = "CSE";

  // uploadVideoLink() async {
  //   if (question.isNotEmpty) {
  //     setState(() {
  //       isUploading = true;
  //     });
  //     final dbReference = dRefrence.child(currentDate).child(branch);
  //     await dbReference.push().set({
  //       "question": question,
  //       "answer": isBoolAnswer,
  //     }).catchError((e) {
  //       print(e.toString());
  //     });
  // .whenComplete(() => clearFields());
  //   } else {
  // Fluttertoast.showToast(
  //     msg: "Please fill all fields Correctly",
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.BOTTOM,
  //     timeInSecForIosWeb: 1,
  //     backgroundColor: Colors.red,
  //     textColor: Colors.white,
  //     fontSize: 16.0);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Color(0xFF000000),
            child: Container(
              padding: EdgeInsets.only(top: 3, bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0))),
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                    child: ListTile(
                      // leading: null,
                      // trailing: null,
                      title: Text(
                        "Add questions for test",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: manjari,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  // !================= Question Tile====================
                  // !====================================================
                  ListTile(
                    // leading: DecoratedLeadingIcon(icon: Icons.ac_unit),
                    title: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          question = value;
                        });
                      },
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
                          borderRadius: BorderRadius.circular(10.0),
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
                      "Switch Right Button (Bordered) to get True-False/Option Answer Type",
                      style: TextStyle(
                          fontFamily: jost,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w200,
                          color: Colors.pink),
                    ),
                  ),
                  // !================= Answer Tile ===========================
                  // !=========================================================
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
                        value: isBool,
                        onChanged: (value) {
                          setState(() {
                            isBool = value;
                            print(isBool);
                          });
                        },
                        activeColor: Colors.redAccent,
                      ),
                    ),
                    title: isBool == true
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("False"),
                              CupertinoSwitch(
                                  value: isBoolAnswer,
                                  onChanged: (value) {
                                    setState(() {
                                      isBoolAnswer = value;
                                      print(isBoolAnswer);
                                    });
                                  }),
                              Text("True")
                            ],
                          )
                        : Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DropdownButton<String>(
                                icon: Icon(Icons.arrow_drop_down),
                                value: (this.correctOption == 'empty')
                                    ? null
                                    : this.correctOption,
                                hint: Text('Options'),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(color: Colors.pinkAccent),
                                underline: Container(
                                  height: 2,
                                  color: Colors.pinkAccent,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    correctOption = newValue;
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
                              Text("is correct option"),
                            ],
                          ),
                  ),
                  Container(
                      child: (isBool == false)
                          ? Column(
                              children: [
                                OptionFields(
                                  onSaved: (value) {
                                    setState(() {
                                      optionA = value;
                                    });
                                  },
                                  hintText: "Option A",
                                ),
                                OptionFields(
                                  onSaved: (value) {
                                    setState(() {
                                      optionB = value;
                                    });
                                  },
                                  hintText: "Option B",
                                ),
                                OptionFields(
                                  onSaved: (value) {
                                    setState(() {
                                      optionC = value;
                                    });
                                  },
                                  hintText: "Option C",
                                ),
                                OptionFields(
                                  onSaved: (value) {
                                    setState(() {
                                      optionD = value;
                                    });
                                  },
                                  hintText: "Option D",
                                ),
                              ],
                            )
                          : null),
                  Divider(),
                  Container(
                    height: 50.0,
                    // margin: EdgeInsets.only(left: 80.0, right: 80.0),
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
              ),
            )));
  }
}

class OptionFields extends StatelessWidget {
  OptionFields({
    @required this.hintText,
    @required this.onSaved,
  });

  final String hintText;
  final Function(String) onSaved;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        onSaved: onSaved,
        decoration: InputDecoration(
          hintText: hintText,
          focusColor: Colors.blueGrey,
          hoverColor: Colors.deepPurpleAccent,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Colors.pinkAccent,
              width: 1.5,
            ),
          ),
        ),
        textAlign: TextAlign.center,
      ),
    );
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
