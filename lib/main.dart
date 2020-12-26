import 'package:flutter/material.dart';
import 'package:kwiz/landingPage.dart';
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
        'StudentLoginPage': (context) => StudentLoginPage(),
        'TeacherLoginPage': (context) => TeachersLoginPage(),
      },
    );
  }
}
