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
      body: Container(
        padding: EdgeInsets.all(20.0),
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        color: Colors.amber,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [MainWidgets(), Text("Hello There")],
          ),
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
