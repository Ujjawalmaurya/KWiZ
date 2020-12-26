import 'package:flutter/material.dart';
import 'package:kwiz/landingPage.dart';
import 'package:kwiz/stuLoginPage.dart';
import 'package:kwiz/teacherLoginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: LandingPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        'StudentLoginPage': (context) => StudentLoginPage(),
        'TeacherLoginPage': (context) => TeachersLoginPage(),
      },
    );
  }
}
