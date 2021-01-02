import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class StudentHomePage extends StatefulWidget {
  static const String id = 'stuHomePage';
  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
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
      drawer: Drawer(
        child: ListView(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Student Pannel"),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                signoutConfmBox(context);
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        color: Colors.amber,
        child: SafeArea(
          child: Column(),
        ),
      ),
    );
  }
}

class MainWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        //
        // Navigaion Function()
        //
      },
      color: Colors.redAccent,
      elevation: 20.0,
      splashColor: Colors.green,
      // hoverElevation: 2,
      child: Text(
        "Hello",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
