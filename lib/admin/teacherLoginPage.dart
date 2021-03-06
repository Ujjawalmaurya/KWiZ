import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kwiz/admin/adminHomePage.dart';
import 'package:kwiz/constants.dart';

class TeachersLoginPage extends StatefulWidget {
  static const String id = 'teachersLoginPage';
  @override
  _TeachersLoginPageState createState() => _TeachersLoginPageState();
}

class _TeachersLoginPageState extends State<TeachersLoginPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  FirebaseAuth auth = FirebaseAuth.instance;

  String username, password, errorMsg;
  String isLoading = 'false';

  //SignIn with email Fxn
  Future<void> signIn() async {
    // Firebase.initializeApp();
    setState(() {
      isLoading = 'true';
    });
    try {
      UserCredential userCredential = await auth
          .signInWithEmailAndPassword(
              email: this.username, password: this.password)
          .whenComplete(() {
        setState(() {
          isLoading = 'false';
        });
      });

      final User user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // writeDeviceInfo();
        return Navigator.of(context).popAndPushNamed(TeachersHomePage.id);
      }
    } catch (e) {
      setState(() {
        errorMsg = e.message;
        isLoading = 'false';
      });
      errorDialog();
    }
  }

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
                // clearFields();
                Navigator.of(context).pop();
              },
              child: Text("Ok"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == 'true'
        ? Container(
            color: Color(0xff4834DF),
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: Center(child: SpinKitChasingDots(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.red : Colors.yellow,
                  ),
                );
              },
            )),
          )
        : Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/bg.png",
                  ),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              // color: Colors.white,
              child: SafeArea(
                child: Center(
                  child: Form(
                    key: _key,
                    child: Card(
                      elevation: 25.0,
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.03,
                        right: MediaQuery.of(context).size.width * 0.03,
                        // top: MediaQuery.of(context).size.height * 0.08,
                        // bottom: MediaQuery.of(context).size.height * 0.16
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 5.0, bottom: 15.0, left: 15, right: 15),
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    // fit: BoxFit.contain,
                                    image: AssetImage('assets/adLogin.png'),
                                  )),
                                  height:
                                      MediaQuery.of(context).size.width * 0.6,
                                  width:
                                      MediaQuery.of(context).size.width * 0.65),
                              Divider(
                                color: Colors.deepPurpleAccent,
                                height: 20.0,
                              ),
                              Text(
                                "Log into Your Admin Account",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 40.0,
                                    color: Colors.pinkAccent,
                                    fontFamily: jost,
                                    fontWeight: FontWeight.w900),
                              ),

                              //! Username ====================
                              ListTile(
                                title: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (input) {
                                    if (input.isEmpty) {
                                      return 'Username is required';
                                    }
                                  },
                                  onChanged: (input) {
                                    username = input + "@admin.kwiz";
                                  },
                                  decoration:
                                      InputDecoration(labelText: "Username"),
                                ),
                              ),

                              //! Password ===================
                              ListTile(
                                  title: TextFormField(
                                obscureText: true,
                                validator: (input) {
                                  if (input.isEmpty) {
                                    return 'Password is required';
                                  } else if (input.length < 6) {
                                    return 'Password is too short';
                                  }
                                },
                                onChanged: (input) {
                                  password = input;
                                },
                                decoration:
                                    InputDecoration(labelText: "Password"),
                              )),
                              // SizedBox(height: 25),
                              Container(
                                  margin:
                                      EdgeInsets.only(top: 20.0, bottom: 35.0),
                                  height: 50.0,
                                  width:
                                      MediaQuery.of(context).size.width * 0.65,

                                  //!================Get-IN Button============///
                                  child: RaisedButton(
                                      onPressed: () {
                                        if (_key.currentState.validate()) {
                                          _key.currentState.save();
                                          signIn();
                                        }
                                      },
                                      color: Colors.redAccent,
                                      splashColor: Colors.deepPurpleAccent,
                                      child: Text("Admin Login",
                                          style: TextStyle(
                                              fontSize: 25.0,
                                              color: Colors.white,
                                              fontFamily: jost)),
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
            ),
          );
  }
}
