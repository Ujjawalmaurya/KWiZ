import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kwiz/student/stuHomePage.dart';

class StudentLoginPage extends StatefulWidget {
  static const String id = 'StuLoginPage';
  @override
  _StudentLoginPageState createState() => _StudentLoginPageState();
}

class _StudentLoginPageState extends State<StudentLoginPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  FirebaseAuth auth = FirebaseAuth.instance;

  String username, password, errorMsg;
  String isLoading = 'false';

  //SignIn with email Fxn
  Future<void> signIn() async {
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
        return Navigator.of(context).popAndPushNamed(StudentHomePage.id);
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
    return Scaffold(
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
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Log into Your Student Account",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 40.0),
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
                              username = input + "@student.kwiz";
                            },
                            decoration: InputDecoration(labelText: "Username"),
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
                          decoration: InputDecoration(labelText: "Password"),
                        )),
                        SizedBox(height: 25),
                        Container(
                            height: 50.0,
                            width: MediaQuery.of(context).size.width * 0.65,

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
                                        fontSize: 20.0, color: Colors.white)),
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
