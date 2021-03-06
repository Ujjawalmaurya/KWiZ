import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:toast/toast.dart';

class SignUpPage extends StatefulWidget {
  static const String id = 'registration';
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController studentClassController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cPassController = TextEditingController();
  GlobalKey<FormState> _key = new GlobalKey();
  String isLoading = 'false';
  String email, pass, confPass, errorMsg;
  String branch = 'empty', branchYear = 'empty';
  User tempUser;

  //Error dialogbox
  errorDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              title: Text(
                'Error',
                style: TextStyle(color: Colors.red),
              ),
              content: Text(errorMsg),
              actions: [
                FlatButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.red, width: 2),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok"),
                )
              ]);
        });
  }

  ///Pass Not Match dialog
  errorPassDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              title: Text(
                'Error',
                style: TextStyle(color: Colors.red),
              ),
              content: Text('fill All fields correctly'),
              actions: [
                FlatButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.red, width: 2),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Retry"),
                )
              ]);
        });
  }

  clearFields() async {
    cPassController.clear();
    passController.clear();
    usernameController.clear();
  }

  Future register() async {
    setState(() {
      isLoading = 'true';
    });

    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: pass);
    User user = FirebaseAuth.instance.currentUser;
    setState(() {
      tempUser = user;
    });
    final storage = new FlutterSecureStorage();
    String parentEmail = await storage.read(key: 'email');
    String parentPass = await storage.read(key: 'pass');
    print(parentEmail);

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: parentEmail, password: parentPass);
  }

  writeUUIdWithClass(newUser) async {
    final dRefrence = FirebaseDatabase.instance.reference();
    print(tempUser.email);
    if (tempUser != null) {
      final dbReference = dRefrence.child("studentInfos").child(tempUser.uid);
      await dbReference.set({
        "branch": branch,
        "year": branchYear,
        "userEmail": tempUser.email,
        "userUid": tempUser.uid,
      }).catchError((e) {
        print(e.toString());
      }).whenComplete(() {
        clearFields();
      });
    } else {
      setState(() {
        isLoading = 'false';
      });
      Fluttertoast.showToast(
          msg: "Oops",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == 'true'
        ? Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            color: Color(0xff3C40C6),
            child: SpinKitWanderingCubes(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.red : Colors.green,
                  ),
                );
              },
            ),
          )
        : Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/addTest.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              child: SafeArea(
                child: Center(
                  child: Form(
                    key: _key,
                    child: Card(
                      margin: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.06),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.width * 0.02)),
                            // Container(
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(20.0),
                            //       image: DecorationImage(
                            //           image:
                            //               AssetImage('assets/reg-asset.jpg'))),
                            //   width: MediaQuery.of(context).size.width * 0.8,
                            //   height: MediaQuery.of(context).size.width * 0.6,
                            // ),
                            SizedBox(height: 10.0),
                            //! Username
                            ListTile(
                              leading: FaIcon(
                                FontAwesomeIcons.userAlt,
                                color: Colors.deepPurpleAccent,
                              ),
                              title: TextFormField(
                                controller: usernameController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (input) {
                                  if (input.isEmpty) {
                                    return 'Username is required';
                                  }
                                },
                                decoration:
                                    InputDecoration(labelText: "Username"),
                                onSaved: (input) {
                                  setState(() {
                                    email = input + '@student.kwiz';
                                  });
                                  print(this.email);
                                },
                              ),
                            ),
                            //! Password
                            ListTile(
                                leading: FaIcon(
                                  FontAwesomeIcons.userLock,
                                  color: Colors.deepPurpleAccent,
                                ),
                                title: TextFormField(
                                    controller: passController,
                                    obscureText: true,
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Password is required';
                                      } else if (input.length < 6) {
                                        return 'Password is too short';
                                      }
                                    },
                                    decoration:
                                        InputDecoration(labelText: "Password"),
                                    onSaved: (input) {
                                      setState(() {
                                        this.pass = input;
                                      });
                                      print(this.pass);
                                    })),
                            //! Confirm Password
                            ListTile(
                                leading: FaIcon(
                                  FontAwesomeIcons.userLock,
                                  color: Colors.deepPurpleAccent,
                                ),
                                title: TextFormField(
                                    controller: cPassController,
                                    obscureText: true,
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Confirmation Password is required';
                                      } else if (input.length < 6) {
                                        return ' Confirmed Password is too short';
                                      }
                                    },
                                    decoration: InputDecoration(
                                        labelText: "Confirm Password"),
                                    onSaved: (input) {
                                      setState(() {
                                        this.confPass = input;
                                      });
                                      print(this.confPass);
                                    })),
                            //! Selection of Branch
                            ListTile(
                              leading: FaIcon(
                                FontAwesomeIcons.sortNumericDown,
                                color: Colors.deepPurpleAccent,
                              ),
                              title: Text('Select Branch'),
                              trailing: DropdownButton<String>(
                                icon: Icon(Icons.arrow_drop_down),
                                value: (this.branch == 'empty')
                                    ? null
                                    : this.branch,
                                hint: Text('Branch'),
                                iconSize: 24,
                                elevation: 16,
                                style:
                                    TextStyle(color: Colors.deepPurpleAccent),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    branch = newValue;
                                  });
                                },
                                items: <String>[
                                  'CE',
                                  'CSE',
                                  'EC',
                                  'EE',
                                  'ME(P)',
                                  'ME(A)',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            //! Selection of Branch Year
                            ListTile(
                              leading: FaIcon(
                                FontAwesomeIcons.sortNumericDown,
                                color: Colors.deepPurpleAccent,
                              ),
                              title: Text('Select Year'),
                              trailing: DropdownButton<String>(
                                icon: Icon(Icons.arrow_drop_down),
                                value: (this.branchYear == 'empty')
                                    ? null
                                    : this.branchYear,
                                hint: Text('Year'),
                                iconSize: 24,
                                elevation: 16,
                                style:
                                    TextStyle(color: Colors.deepPurpleAccent),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    branchYear = newValue;
                                  });
                                },
                                items: <String>[
                                  '1',
                                  '2',
                                  '3',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height *
                                        0.018)),
                            Container(
                                height: 50.0,
                                width: 250.0,
                                //!===========Add New Student Button======///////////
                                child: RaisedButton(
                                    onPressed: () async {
                                      print(
                                          "email: ${email} and pass: ${pass}");
                                      if (_key.currentState.validate()) {
                                        _key.currentState.save();
                                        if (pass == confPass &&
                                            branch != 'empty' &&
                                            branchYear != 'empty') {
                                          try {
                                            await register();

                                            if (tempUser != null) {
                                              writeUUIdWithClass(tempUser);
                                              //Message after sucessfull user creation
                                              Fluttertoast.showToast(
                                                msg:
                                                    "${tempUser.email} + Added Sucesfully in database",
                                                gravity: ToastGravity.CENTER,
                                                backgroundColor: Colors.green,
                                                textColor: Colors.white,
                                              );
                                              clearFields();
                                              setState(() {
                                                isLoading = 'false';
                                              });
                                            }
                                          } catch (e) {
                                            setState(() {
                                              errorMsg = e.message;
                                              isLoading = 'false';
                                            });
                                            errorDialog();
                                          }
                                        } else {
                                          errorPassDialog();
                                        }
                                      }
                                    },
                                    color: Colors.lightBlueAccent,
                                    splashColor: Colors.deepPurpleAccent,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.plus,
                                          color: Colors.deepOrangeAccent,
                                        ),
                                        SizedBox(width: 8),
                                        Text("Add New Student ",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white)),
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0)))),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
