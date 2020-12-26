import 'package:flutter/material.dart';

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
            EdgeInsets.only(left: 25.0, right: 25.0, top: 70.0, bottom: 70.0),
        // color: Colors.tealAccent,
        child: Card(
          // elevation: 20,
          shadowColor: Color(0x00000000),
          margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          color: Color(0x00000000),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: Colors.lightBlueAccent,
                radius: 100.0,
                // child: Image(
                //   image: AssetImage('assets/logo.jpg'),
                // ),
              ),
              MainScreenButtons(
                  colour: Colors.deepPurpleAccent,
                  onPressed: () {
                    Navigator.of(context).pushNamed('StudentLoginPage');
                  },
                  text: "I'am a Student"),
              MainScreenButtons(
                colour: Colors.redAccent,
                onPressed: () {
                  Navigator.of(context).pushNamed('TeacherLoginPage');
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
      height: 50.0,
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
              fontSize: 30.0, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }
}
