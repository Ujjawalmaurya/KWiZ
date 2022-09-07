import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kwiz/constants.dart';

class StudentHomePage extends StatefulWidget {
  static const String id = 'stuHomePage';
  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  signoutConfmBox() {
    Get.defaultDialog(
      title: "Attention",
      content: Text("Are you sure to logout?/??"),
      onConfirm: () => signOut(),
    );
  }

  Future<void> signOut() async {
    try {
      closeApp;
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
                signoutConfmBox();
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        height: Get.height * 1,
        width: Get.width * 1,
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
