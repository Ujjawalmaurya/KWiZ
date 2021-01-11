import 'package:flutter/material.dart';
import 'addTestSheet.dart';

class AddTestPage extends StatefulWidget {
  static const String id = 'addTestPage';
  @override
  _AddTestPageState createState() => _AddTestPageState();
}

class _AddTestPageState extends State<AddTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a test"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/testbg.png'),
          )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddTest.id);
        },
      ),
    );
  }
}
