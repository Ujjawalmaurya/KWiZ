import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/cupertino.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kwiz/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddTest extends StatefulWidget {
  @override
  _AddTestState createState() => _AddTestState();
}

class _AddTestState extends State<AddTest> {
  final firestoreInstance = FirebaseFirestore.instance;

  bool isUploading;
  String question;
  bool isBool = true;
  bool isBoolAnswer = false;
  var correctOption;
  String optionA, optionB, optionC, optionD;
  var currentDate = '7-Jan-2021';
  var branch = "CSE";

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
                                  print(correctOption);
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
                                  onChanged: (value) {
                                    setState(() {
                                      optionA = value;
                                    });
                                  },
                                  onSaved: (value) {
                                    setState(() {
                                      optionA = value;
                                    });
                                  },
                                  hintText: "Option A",
                                ),
                                OptionFields(
                                  onChanged: (value) {
                                    setState(() {
                                      optionB = value;
                                    });
                                  },
                                  onSaved: (value) {
                                    setState(() {
                                      optionB = value;
                                    });
                                  },
                                  hintText: "Option B",
                                ),
                                OptionFields(
                                  onChanged: (value) {
                                    setState(() {
                                      optionC = value;
                                    });
                                  },
                                  onSaved: (value) {
                                    setState(() {
                                      optionC = value;
                                    });
                                  },
                                  hintText: "Option C",
                                ),
                                OptionFields(
                                  onChanged: (value) {
                                    setState(() {
                                      optionD = value;
                                    });
                                  },
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
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 50.0,
                      child: RaisedButton(
                        shape: adminButtonShape,
                        onPressed: () async {
                          if (question.isEmpty) {
                            //** === Alert for empty question ====
                            //** =================================
                          } else {
                            if (isBool == false) {
                              if (correctOption != null &&
                                  optionA != null &&
                                  optionB != null &&
                                  optionC != null &&
                                  optionD != null) {
                                await firestoreInstance
                                    .collection(branch)
                                    .doc(currentDate)
                                    .set({
                                  "question": question,
                                  'isBool': isBool,
                                  'correctOption': correctOption,
                                  "options": {
                                    'optionA': optionA,
                                    "optionB": optionB,
                                    "optionC": optionC,
                                    "optionD": optionD,
                                  }
                                }).then((_) {
                                  print("success!");
                                });
                              }
                            } else {
                              await firestoreInstance
                                  .collection(branch)
                                  .doc(currentDate)
                                  .set({
                                "question": question,
                                'isBool': isBool,
                                'isBoolAnswer': isBoolAnswer,
                              }).then((_) {
                                print("success!");
                              });
                            }
                          }
                        },
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
    @required this.onChanged,
  });

  final String hintText;
  final Function(String) onSaved;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        onSaved: onSaved,
        onChanged: onChanged,
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
