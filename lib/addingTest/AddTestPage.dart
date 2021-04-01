import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kwiz/constants.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddTestPage extends StatefulWidget {
  static const String id = 'addTestPage';
  @override
  _AddTestPageState createState() => _AddTestPageState();
}

class _AddTestPageState extends State<AddTestPage> {
  final firestoreInstance = FirebaseFirestore.instance;

  var now = DateTime.now();
  Map datakey = new Map();
  Map snapShotdata = new Map();

  ///
  bool addOrGet = false;
  String question, questionNum;
  bool isBool = true;
  bool isBoolAnswer = false;
  var correctOption;
  String optionA, optionB, optionC, optionD;
  String branch, branchYear;
  String date = 'February 7, 2021';
  String sub = 'empty';
  String isLoading;

  getData() async {
    if (branch != null && branchYear != null && sub != 'empty') {
      setState(() {
        isLoading = 'true';
        snapShotdata.clear();
        datakey.clear();
      });
      final db = FirebaseDatabase.instance
          .reference()
          .child(branch + "-" + branchYear)
          .child(date)
          .child(sub);
      db.once().then((DataSnapshot snapshot) {
        Map<dynamic, dynamic> values = snapshot.value;

        if (values == null) {
          setState(() {
            isLoading = 'false';
          });
          Fluttertoast.showToast(
              msg: 'No videos uploaded in this section',
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              toastLength: Toast.LENGTH_LONG);
          // clearEnteredData();
        } else {
          for (var i = 0; i < values.keys.length; i++) {
            setState(() {
              datakey[i] = values.keys.toList()[i].toString();
              snapShotdata[i] = values.values.toList()[i];
            });
          }
        }
      })
          // .whenComplete(() => clearEnteredData())
          ;
    } else {
      Fluttertoast.showToast(
        msg: 'Please select all fields',
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            addOrGet == true ? Text("Fetch Questions") : Text("Add Questions"),
        backgroundColor: Colors.pinkAccent,
        actions: [
          Row(
            children: [
              Text('Add Test'),
              CupertinoSwitch(
                activeColor: Colors.blue,
                trackColor: Colors.greenAccent,
                value: addOrGet,
                onChanged: (value) {
                  setState(() {
                    addOrGet = value;
                  });
                },
              ),
              Text('Get Details')
            ],
          )
        ],
      ),
      body: SafeArea(
        child: addOrGet == true
            ? Container(
                //!===== Get details State ======
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/testbg.png'),
                )),
                child: Card(
                    margin: EdgeInsets.all(4.0),
                    color: Color(0x00FFFFF),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 1,
                      width: MediaQuery.of(context).size.width * 1,
                      // ),
                      child: ListView.builder(
                        //! Actual listView Builder
                        itemCount: datakey.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.video_call),
                                title: Text(snapShotdata[index]['title'],
                                    style: TextStyle(fontSize: 17.0)),
                                // onTap: () {
                                //   Navigator.push(context, MaterialPageRoute(
                                //     builder: (context) {
                                //       return Videos(
                                //           link: snapShotdata[index]['link']);
                                // },), );}
                              ),
                              Divider(color: Colors.pinkAccent)
                            ],
                          );
                        },
                      ),
                    )),
              )
            : Container(
                //! Add Test State
                padding: EdgeInsets.only(top: 3, bottom: 10),
                decoration: BoxDecoration(
                    // image: DecorationImage(
                    //     fit: BoxFit.fill, image: AssetImage('assets/addTest.png')),
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0))),
                child: SingleChildScrollView(
                  child: Column(children: [
                    // !================= Question Tile====================
                    // !===================================================
                    ListTile(
                        title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //! ======= Branch =========
                        DropdownButton<String>(
                          icon: Icon(Icons.arrow_drop_down),
                          value: (this.branch == 'empty') ? null : this.branch,
                          hint: Text('Branch'),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.pinkAccent),
                          underline:
                              Container(height: 2, color: Colors.pinkAccent),
                          onChanged: (String newValue) {
                            setState(() {
                              branch = newValue;
                            });
                            print("Branch : ${branch}");
                          },
                          items: <String>[
                            'Civil',
                            'CS',
                            'ECE',
                            'EE',
                            'ME(A)',
                            'ME(P)',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                value: value, child: Text(value));
                          }).toList(),
                        ),

                        //! ======== Year ========
                        DropdownButton<String>(
                            icon: Icon(Icons.arrow_drop_down),
                            value: (this.branchYear == 'empty')
                                ? null
                                : this.branchYear,
                            hint: Text('Year'),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.pinkAccent),
                            underline: Container(
                              height: 2,
                              color: Colors.pinkAccent,
                            ),
                            onChanged: (String nValue) {
                              setState(() {
                                branchYear = nValue;
                              });
                              print("Branch Year: $branchYear");
                            },
                            items: <String>[
                              '1st Year',
                              '2nd Year',
                              '3rd Year',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value, child: Text(value));
                            }).toList()),

                        //! ========= Subject ==============
                        SizedBox(
                            width: 120.0,
                            child: DropdownButton<String>(
                              icon: Icon(Icons.arrow_drop_down),
                              value: (this.sub == 'empty') ? null : this.sub,
                              hint: Text('Subject'),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(color: Colors.pinkAccent),
                              underline: Container(
                                height: 2,
                                color: Colors.pinkAccent,
                              ),
                              onChanged: (String subValue) {
                                setState(() {
                                  sub = subValue;
                                });
                                print("Branch Sub: $sub");
                              },
                              items: (branch == 'CS' &&
                                      branchYear == '1st Year')
                                  ? <String>[
                                      'CS 1.1 ',
                                      'CSE 1.2',
                                      'cs 1.3',
                                    ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                      return DropdownMenuItem<String>(
                                          value: value, child: Text(value));
                                    }).toList()
                                  : (branch == 'CS' && branchYear == "2nd Year")
                                      ? <String>[
                                          'CS 2.1',
                                          'CSE 2.2',
                                          'cs 2.3',
                                        ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                          return DropdownMenuItem<String>(
                                              value: value, child: Text(value));
                                        }).toList()
                                      : <String>[
                                          'dummy ',
                                          'dummy2',
                                          'dummy3',
                                        ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                          return DropdownMenuItem<String>(
                                              value: value, child: Text(value));
                                        }).toList(),
                            )),
                      ],
                    )),

                    //! ============ Question Number ==============
                    ListTile(
                      title: SizedBox(
                          width: 120.0,
                          child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  questionNum = value;
                                });
                                print("Question Number $questionNum");
                              },
                              decoration: InputDecoration(
                                  hintText: 'Question Number',
                                  focusColor: Colors.blueGrey,
                                  hoverColor: Colors.deepPurpleAccent,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                          color: Colors.greenAccent, width: 5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide: BorderSide(
                                          color: Colors.pinkAccent,
                                          width: 2.0))),
                              textAlign: TextAlign.center)),
                    ),

                    ListTile(
                      // leading: DecoratedLeadingIcon(icon: Icons.ac_unit),
                      //! =============== Question Tile =================

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
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                    color: Colors.tealAccent, width: 6)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.pinkAccent, width: 2.0)),
                          ),
                          maxLines: 4,
                          textAlign: TextAlign.center),
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
                                color: Colors.pink))),
                    // !================= Answer Tile ===========================
                    // !=========================================================
                    ListTile(
                      leading: DecoratedLeadingIcon(
                          icon: Icons.question_answer_outlined),
                      // title:
                      trailing: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                                color: Colors.redAccent, width: 1.5)),
                        child: CupertinoSwitch(
                            value: isBool,
                            onChanged: (value) {
                              setState(() {
                                isBool = value;
                                print("isBool = $isBool");
                              });
                            },
                            activeColor: Colors.redAccent),
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
                                ])
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
                                        height: 2, color: Colors.pinkAccent),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        correctOption = newValue;
                                      });
                                      print("Correct Option : $correctOption");
                                    },
                                    items: <String>[
                                      'A',
                                      'B',
                                      'C',
                                      'D',
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                  Text("is correct option"),
                                ]),
                    ),
                    Container(
                        child: (isBool == false)
                            ? Column(
                                children: [
                                  //! Option A
                                  OptionFields(
                                      onChanged: (value) {
                                        setState(() {
                                          optionA = value;
                                        });
                                        print(optionA);
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          optionA = value;
                                        });
                                      },
                                      hintText: "Option A"),
                                  //! Option B
                                  OptionFields(
                                      onChanged: (value) {
                                        setState(() {
                                          optionB = value;
                                        });
                                        print(optionB);
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          optionB = value;
                                        });
                                      },
                                      hintText: "Option B"),
                                  //! Option C
                                  OptionFields(
                                      onChanged: (value) {
                                        setState(() {
                                          optionC = value;
                                        });
                                        print(optionC);
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          optionC = value;
                                        });
                                      },
                                      hintText: "Option C"),
                                  //! Option D
                                  OptionFields(
                                      onChanged: (value) {
                                        setState(() {
                                          optionD = value;
                                        });
                                        print(optionD);
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          optionD = value;
                                        });
                                      },
                                      hintText: "Option D"),
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
                                if (question.isNotEmpty) {
                                  //** ==== Alert for empty question ====
                                  //** ==================================
                                  if (branch != null &&
                                      branchYear != null &&
                                      sub != null &&
                                      isBool == false) {
                                    if (correctOption != null &&
                                        optionA != null &&
                                        optionB != null &&
                                        optionC != null &&
                                        optionD != null) {
                                      await firestoreInstance
                                          .collection(branch + "-" + branchYear)
                                          .doc(DateFormat.yMMMMd().format(now))
                                          .collection(sub)
                                          .doc(questionNum)
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
                                        .collection(branch + "-" + branchYear)
                                        .doc(DateFormat.yMMMMd().format(now))
                                        .collection(sub)
                                        .doc(questionNum)
                                        .set({
                                      "question": question,
                                      'isBool': isBool,
                                      'isBoolAnswer': isBoolAnswer,
                                    }).then((_) {
                                      print("success!");
                                    });
                                  }
                                } else {
                                  print('Please put question');
                                }
                                print(DateFormat.yMMMMd().format(now));
                                print(branchYear);
                              },
                              color: Colors.pinkAccent,
                              child: Text("Add",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w700))),
                        ))
                  ]),
                )),
      ),
    );
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
