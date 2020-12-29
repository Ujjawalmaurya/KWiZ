import 'package:flutter/material.dart';
import 'package:kwiz/admin/addTest.dart';

class TeachersHomePage extends StatefulWidget {
  static const String id = 'adminHomePage';
  @override
  _TeachersHomePageState createState() => _TeachersHomePageState();
}

class _TeachersHomePageState extends State<TeachersHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Teachers Admin Page"),
        actions: [IconButton(icon: Icon(Icons.logout), onPressed: () {})],
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
                    // Navigator.of(context).pushNamed(AddTest.id);

                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) => AddTest());
                  },
                  color: Colors.blueAccent,
                  child: Text(
                    "Add a new Test",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
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
                  onPressed: () {},
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
