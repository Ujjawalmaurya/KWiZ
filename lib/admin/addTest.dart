import 'package:flutter/material.dart';

class AddTest extends StatefulWidget {
  static const String id = "addATest";

  @override
  _AddTestState createState() => _AddTestState();
}

class _AddTestState extends State<AddTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF276254),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0))),
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.title_outlined),
                title: TextFormField(
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
