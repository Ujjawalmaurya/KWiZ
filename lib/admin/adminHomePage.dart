import 'package:flutter/material.dart';
import 'package:kwiz/admin/addingTest/AddTestPage.dart';
import 'package:kwiz/admin/addingTest/addTestSheet.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:kwiz/admin/getStuDetails.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class TeachersHomePage extends StatefulWidget {
  static const String id = 'adminHomePage';
  @override
  _TeachersHomePageState createState() => _TeachersHomePageState();
}

class _TeachersHomePageState extends State<TeachersHomePage> {
  signoutConfmBox(context) {
    Alert(
        style: AlertStyle(
            isCloseButton: false,
            alertBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        context: context,
        title: "Attention!!",
        content: Text(
          'Do You Want to Logout??',
          style: TextStyle(color: Colors.red),
        ),
        buttons: [
          DialogButton(
            color: Colors.white,
            onPressed: () {
              signOut();
            },
            child: Text(
              "Ok",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          ),
          DialogButton(
              color: Colors.white,
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.green, fontSize: 20),
              ),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              })
        ]).show();
  }

  Future<void> signOut() async {
    try {
      Navigator.of(context, rootNavigator: true).pop();
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Teachers Admin Page"),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                signoutConfmBox(context);
              })
        ],
      ),
      body: Container(
        color: Colors.tealAccent,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.all(20.0),
                height: 180.0,
                // width: 160.0,
                child: RaisedButton(
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () {
                    Navigator.of(context).pushNamed(AddTestPage.id);
                    //
                  },
                  color: Colors.blueAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DecoratedIcon(Icons.add,
                          color: Colors.pink,
                          size: 75.0,
                          shadows: [
                            BoxShadow(
                              blurRadius: 25.0,
                              color: Colors.pinkAccent,
                            ),
                            BoxShadow(
                              blurRadius: 15.0,
                              color: Colors.lightBlueAccent,
                            ),
                          ]),
                      Text(
                        "Add a new Test",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                height: 180.0,
                // width: 160.0,
                child: RaisedButton(
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () {
                    Navigator.of(context).pushNamed(GetStuInfo.id);
                  },
                  color: Colors.orangeAccent,
                  child: Text(
                    "Get Student details",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
