import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kwiz/admin/addTest.dart';
import 'package:kwiz/admin/adminHomePage.dart';
import 'package:kwiz/landingPage.dart';
import 'package:kwiz/student/stuHomePage.dart';
import 'package:kwiz/student/stuLoginPage.dart';
import 'package:kwiz/admin/teacherLoginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LandingPage(),
      initialRoute: LandingPage.id,
      routes: {
        LandingPage.id: (context) => LandingPage(),
        StudentLoginPage.id: (context) => StudentLoginPage(),
        StudentHomePage.id: (ctx) => StudentHomePage(),
        TeachersLoginPage.id: (context) => TeachersLoginPage(),
        TeachersHomePage.id: (ctx) => TeachersHomePage(),
        AddTest.id: (ctx) => AddTest(),
      },
    );
  }
}
