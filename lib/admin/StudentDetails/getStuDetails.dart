import 'package:flutter/material.dart';

class GetStuDetails extends StatefulWidget {
  @override
  _GetStuDetailsState createState() => _GetStuDetailsState();
}

class _GetStuDetailsState extends State<GetStuDetails> {
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
