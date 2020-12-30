import 'package:flutter/material.dart';

class StudentHomePage extends StatefulWidget {
  static const String id = 'stuHomePage';
  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Student Pannel"),
        actions: [IconButton(icon: Icon(Icons.logout), onPressed: () {})],
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
