import 'package:flutter/material.dart';

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
