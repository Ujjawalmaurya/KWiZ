import 'package:flutter/material.dart';

class GetStuInfo extends StatefulWidget {
  static const String id = 'getStudentInfo';
  @override
  _GetStuInfoState createState() => _GetStuInfoState();
}

class _GetStuInfoState extends State<GetStuInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Get student Details"),
      ),
    );
  }
}
