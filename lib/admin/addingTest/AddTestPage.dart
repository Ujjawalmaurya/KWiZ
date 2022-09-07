import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kwiz/admin/addingTest/addTestController.dart';
import 'package:kwiz/constants.dart';
import 'package:decorated_icon/decorated_icon.dart';

class AddTest extends GetWidget<AddTestController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: controller.addOrGet.value == true ? Text("Fetch Questions") : Text("Add Questions"),
        backgroundColor: Colors.pinkAccent,
        actions: [
          Row(
            children: [
              Text('Add Test'),
              CupertinoSwitch(
                activeColor: Colors.blue,
                trackColor: Colors.greenAccent,
                value: controller.addOrGet.value,
                onChanged: (value) {
                  // setState(() {
                  controller.addOrGet.value = value;
                  // });
                },
              ),
              Text('Get Details')
            ],
          )
        ],
      ),
      body: SafeArea(
        child: controller.addOrGet == true
            ? Container(
                //! List-Builder Container State
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/testbg.png'),
                )),
                child: Card(
                    margin: EdgeInsets.all(4.0),
                    color: Color(0x00FFFFF),
                    child: Container(
                      height: Get.height * 1,
                      width: Get.width * 1,
                      // ),
                      child: ListView.builder(
                        //! Actual listView Builder
                        itemCount: controller.datakey.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.video_call),
                                title: Text(controller.snapShotdata[index]['title'],
                                    style: TextStyle(fontSize: 17.0)),
                                // onTap: () {
                                //   Navigator.push(context, MaterialPageRoute(
                                //     builder: (context) {
                                //       return Videos(
                                //           link: snapShotdata[index]['link']);
                                // },
                                // ), );
                                // }
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
                    topLeft: Radius.circular(10.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(children: [
                    // !================= Question Tile====================
                    // !===================================================
                    ListTile(
                        title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //! ======= Branch =========
                        // DropdownButton<String>(
                        //   icon: Icon(Icons.arrow_drop_down),
                        //   value: (this.controller.branch.value == 'empty')
                        //       ? null
                        //       : this.controller.branch.value,
                        //   hint: Text('Branch'),
                        //   iconSize: 24,
                        //   elevation: 16,
                        //   style: TextStyle(color: Colors.pinkAccent),
                        //   underline: Container(height: 2, color: Colors.pinkAccent),
                        //   onChanged: (String newValue) {
                        //     // setState(() {
                        //     controller.branch.value = newValue;
                        //     // });
                        //     print("Branch : ${controller.branch.value}");
                        //   },
                        //   items: <String>[
                        //     'Civil',
                        //     'CS',
                        //     'ECE',
                        //     'EE',
                        //     'ME(A)',
                        //     'ME(P)',
                        //   ].map<DropdownMenuItem<String>>((String value) {
                        //     return DropdownMenuItem<String>(value: value, child: Text(value));
                        //   }).toList(),
                        // ),

                        // //! ======== Year ========
                        // DropdownButton<String>(
                        //     icon: Icon(Icons.arrow_drop_down),
                        //     value: (this.controller.branchYear.value == 'empty')
                        //         ? null
                        //         : this.controller.branchYear.value,
                        //     hint: Text('Year'),
                        //     iconSize: 24,
                        //     elevation: 16,
                        //     style: TextStyle(color: Colors.pinkAccent),
                        //     underline: Container(
                        //       height: 2,
                        //       color: Colors.pinkAccent,
                        //     ),
                        //     onChanged: (String nValue) {
                        //       // setState(() {
                        //       controller.branchYear.value = nValue;
                        //       // });
                        //       print("Branch Year: $controller.branchYear.value");
                        //     },
                        //     items: <String>[
                        //       '1st Year',
                        //       '2nd Year',
                        //       '3rd Year',
                        //     ].map<DropdownMenuItem<String>>((String value) {
                        //       return DropdownMenuItem<String>(value: value, child: Text(value));
                        //     }).toList()),

                        // //! ========= Subject ==============
                        // SizedBox(
                        //     width: 120.0,
                        //     child: DropdownButton<String>(
                        //       icon: Icon(Icons.arrow_drop_down),
                        //       value: (this.controller.sub.value == 'empty')
                        //           ? null
                        //           : this.controller.sub.value,
                        //       hint: Text('Subject'),
                        //       iconSize: 24,
                        //       elevation: 16,
                        //       style: TextStyle(color: Colors.pinkAccent),
                        //       underline: Container(
                        //         height: 2,
                        //         color: Colors.pinkAccent,
                        //       ),
                        //       onChanged: (String subValue) {
                        //         // setState(() {
                        //         controller.sub.value = subValue;
                        //         // });
                        //         print("Branch Sub: $controller.sub.value");
                        //       },
                        //       items: (controller.branch.value == 'CS' &&
                        //               controller.branchYear.value == '1st Year')
                        //           ? <String>[
                        //               'CS 1.1 ',
                        //               'CSE 1.2',
                        //               'cs 1.3',
                        //             ].map<DropdownMenuItem<String>>((String value) {
                        //               return DropdownMenuItem<String>(
                        //                   value: value, child: Text(value));
                        //             }).toList()
                        //           : (controller.branch.value == 'CS' &&
                        //                   controller.branchYear.value == "2nd Year")
                        //               ? <String>[
                        //                   'CS 2.1',
                        //                   'CSE 2.2',
                        //                   'cs 2.3',
                        //                 ].map<DropdownMenuItem<String>>((String value) {
                        //                   return DropdownMenuItem<String>(
                        //                       value: value, child: Text(value));
                        //                 }).toList()
                        //               : <String>[
                        //                   'dummy ',
                        //                   'dummy2',
                        //                   'dummy3',
                        //                 ].map<DropdownMenuItem<String>>((String value) {
                        //                   return DropdownMenuItem<String>(
                        //                       value: value, child: Text(value));
                        //                 }).toList(),
                        //     )),
                      ],
                    )),

                    //! ============ Question Number ==============
                    ListTile(
                      title: SizedBox(
                          width: 120.0,
                          child: TextFormField(
                              onChanged: (value) {
                                // setState(() {
                                controller.questionNum.value = value;
                                // });
                                print("Question Number $controller.questionNum.value");
                              },
                              decoration: InputDecoration(
                                  hintText: 'Question Number',
                                  focusColor: Colors.blueGrey,
                                  hoverColor: Colors.deepPurpleAccent,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(color: Colors.greenAccent, width: 5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide:
                                          BorderSide(color: Colors.pinkAccent, width: 2.0))),
                              textAlign: TextAlign.center)),
                    ),

                    ListTile(
                      // leading: DecoratedLeadingIcon(icon: Icons.ac_unit),
                      //! =============== Question Tile =================

                      title: TextFormField(
                          onChanged: (value) {
                            // setState(() {
                            controller.question.value = value;
                            // });
                          },
                          decoration: InputDecoration(
                            hintText: 'Put your question here...',
                            focusColor: Colors.blueGrey,
                            hoverColor: Colors.deepPurpleAccent,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(color: Colors.tealAccent, width: 6)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0)),
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
                      leading: DecoratedLeadingIcon(icon: Icons.question_answer_outlined),
                      // title:
                      trailing: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(color: Colors.redAccent, width: 1.5)),
                        child: CupertinoSwitch(
                            value: controller.isBool.value,
                            onChanged: (value) {
                              // setState(() {
                              controller.isBool.value = value;
                              print("isBool = $controller.isBool.value");
                              // });
                            },
                            activeColor: Colors.redAccent),
                      ),
                      title: controller.isBool.value == true
                          ? Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                              Text("False"),
                              CupertinoSwitch(
                                  value: controller.isBoolAnswer.value,
                                  onChanged: (value) {
                                    // setState(() {
                                    controller.isBoolAnswer.value = value;
                                    print(controller.isBoolAnswer.value);
                                    // });
                                  }),
                              Text("True")
                            ])
                          : Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                  DropdownButton<String>(
                                    icon: Icon(Icons.arrow_drop_down),
                                    value: (this.controller.correctOption.value == '')
                                        ? null
                                        : this.controller.correctOption.value,
                                    hint: Text('Options'),
                                    iconSize: 24,
                                    elevation: 16,
                                    style: TextStyle(color: Colors.pinkAccent),
                                    underline: Container(height: 2, color: Colors.pinkAccent),
                                    onChanged: (String newValue) {
                                      // setState(() {
                                      controller.correctOption.value = newValue;
                                      // });
                                      print("Correct Option : $controller.correctOption.value");
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
                                ]),
                    ),
                    Container(
                        child: (controller.isBool.value == false)
                            ? Column(
                                children: [
                                  //! Option A
                                  OptionFields(
                                      onChanged: (value) {
                                        // setState(() {
                                        controller.optionA.value = value;
                                        // });
                                        print(controller.optionA.value);
                                      },
                                      onSaved: (value) {
                                        // setState(() {
                                        controller.optionA.value = value;
                                        // });
                                      },
                                      hintText: "Option A"),
                                  //! Option B
                                  OptionFields(
                                      onChanged: (value) {
                                        // setState(() {
                                        controller.optionB.value = value;
                                        // });
                                        print(controller.optionB.value);
                                      },
                                      onSaved: (value) {
                                        // setState(() {
                                        controller.optionB.value = value;
                                        // });
                                      },
                                      hintText: "Option B"),
                                  //! Option C
                                  OptionFields(
                                      onChanged: (value) {
                                        // setState(() {
                                        controller.optionC.value = value;
                                        // });
                                        print(controller.optionC.value);
                                      },
                                      onSaved: (value) {
                                        // setState(() {
                                        controller.optionC.value = value;
                                        // });
                                      },
                                      hintText: "Option C"),
                                  //! Option D
                                  OptionFields(
                                      onChanged: (value) {
                                        // setState(() {
                                        controller.optionD.value = value;
                                        // });
                                        print(controller.optionD.value);
                                      },
                                      onSaved: (value) {
                                        // setState(() {
                                        controller.optionD.value = value;
                                        // });
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
                                if (controller.question.value.isNotEmpty) {
                                  //** ==== Alert for empty question ====
                                  //** ==================================
                                  if (controller.branch.value != null &&
                                      controller.branchYear.value != null &&
                                      controller.sub.value != null &&
                                      controller.isBool.value == false) {
                                    if (controller.correctOption.value != null &&
                                        controller.optionA.value != null &&
                                        controller.optionB.value != null &&
                                        controller.optionC.value != null &&
                                        controller.optionD.value != null) {
                                      await controller.firestoreInstance
                                          .collection(controller.branch.value +
                                              "-" +
                                              controller.branchYear.value)
                                          .doc(DateFormat.yMMMMd().format(controller.now))
                                          .collection(controller.sub.value)
                                          .doc(controller.questionNum.value)
                                          .set({
                                        "question": controller.question.value,
                                        'isBool': controller.isBool.value,
                                        'correctOption': controller.correctOption.value,
                                        "options": {
                                          'optionA': controller.optionA.value,
                                          "optionB": controller.optionB.value,
                                          "optionC": controller.optionC.value,
                                          "optionD": controller.optionD.value,
                                        }
                                      }).then((_) {
                                        print("success!");
                                      });
                                    }
                                  } else {
                                    await controller.firestoreInstance
                                        .collection(controller.branch.value +
                                            "-" +
                                            controller.branchYear.value)
                                        .doc(DateFormat.yMMMMd().format(controller.now))
                                        .collection(controller.sub.value)
                                        .doc(controller.questionNum.value)
                                        .set({
                                      "question": controller.question.value,
                                      'isBool': controller.isBool.value,
                                      'isBoolAnswer': controller.isBoolAnswer.value,
                                    }).then((_) {
                                      print("success!");
                                    });
                                  }
                                } else {
                                  print('Please put question');
                                }
                                print(DateFormat.yMMMMd().format(controller.now));
                                print(controller.branchYear.value);
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
