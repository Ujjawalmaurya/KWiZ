import 'package:flutter/material.dart';
import 'package:kwiz/admin/adminHomePage.dart';
import 'package:kwiz/landingPage.dart';
import 'package:kwiz/student/stuHomePage.dart';
import 'package:kwiz/student/stuLoginPage.dart';
import 'package:kwiz/admin/teacherLoginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: LandingPage(),
      initialRoute: LandingPage.id,
      routes: {
        LandingPage.id: (context) => LandingPage(),
        StudentLoginPage.id: (context) => StudentLoginPage(),
        StudentHomePage.id: (ctx) => StudentHomePage(),
        TeachersLoginPage.id: (context) => TeachersLoginPage(),
        TeachersHomePage.id: (ctx) => TeachersHomePage(),
      },
    );
  }
}
