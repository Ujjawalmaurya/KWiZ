import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kwiz/admin/adminHomePage.dart';
import 'package:kwiz/student/stuLoginPage.dart';

class ShowCasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/landingBG.png'),
          fit: BoxFit.cover,
        )),
        padding:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 60.0, bottom: 60.0),
        // color: Colors.tealAccent,
        child: Card(
          elevation: 20,
          margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
          // shadowColor: Color(0x00000000),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          // color: Color(0x00000000),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.width * .85,
                width: MediaQuery.of(context).size.width * .85,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/schoolGirl.jpg'))),
              ),
              MainScreenButtons(
                  colour: Colors.deepPurpleAccent,
                  onPressed: () {
                    Navigator.of(context).pushNamed(StudentLoginPage.id);
                  },
                  text: "I'am a Student"),
              MainScreenButtons(
                colour: Colors.redAccent,
                onPressed: () {
                  Navigator.of(context).pushNamed(TeachersHomePage.id);
                },
                text: "I'am a Teacher",
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MainScreenButtons extends StatelessWidget {
  MainScreenButtons(
      {@required this.onPressed, @required this.text, @required this.colour});

  final Function onPressed;
  final String text;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .75,
      height: 55.0,
      child: RaisedButton(
        onPressed: onPressed,
        elevation: 20,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: colour,
        splashColor: Colors.deepOrangeAccent,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),
    );
  }
}
