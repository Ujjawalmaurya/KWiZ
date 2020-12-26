import 'package:flutter/material.dart';
import 'package:kwiz/student/stuLoginPage.dart';
import 'package:kwiz/HomePage.dart';
import 'HomePage.dart';

class LandingPage extends StatefulWidget {
  static const String id = '/';
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return ShowCasePage();
  }
}
