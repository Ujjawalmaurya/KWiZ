import 'package:flutter/material.dart';
import 'package:kwiz/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kwiz/homePage.dart';
import 'package:kwiz/loginPage.dart';
// import 'package:kwiz/student/stuHomePage.dart';
import 'HomePage.dart';

class LandingPage extends StatefulWidget {
  static const String id = '/';
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;

          if (user == null) {
            return TeachersLoginPage();
          }
          print(FirebaseAuth.instance.currentUser);
          if (user != null) {
            return TeachersHomePage();
          }
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

// return StreamBuilder<User>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           User user = snapshot.data;
//           if (user == null) {
//             return ShowCasePage();
//           }
//           print(FirebaseAuth.instance.currentUser);
//           return TeachersHomePage();
//         } else {
//           return Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//       },
//     );

// class _LandingPageState extends State<LandingPage> {
//   @override
//   Widget build(BuildContext context) {
//     var landingUser = FirebaseAuth.instance.currentUser.email;
//     print('Email: ${landingUser}');
//     const start = "@";
//     const end = ".kwiz";
//     final startIndex = landingUser.indexOf(start);
//     final endIndex = landingUser.indexOf(end, startIndex + start.length);
//     var adminOrStu = landingUser.substring(startIndex + start.length, endIndex);
//     print("LEVEL ${adminOrStu}");

//     return StreamBuilder<User>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           User user = snapshot.data;
//           if (user == null || landingUser == null) {
//             return ShowCasePage();
//           }
//           print("Email");
//           print(FirebaseAuth.instance.currentUser.email);
//           if (adminOrStu == 'admin') {
//             return TeachersHomePage();
//           } else {
//             return StudentHomePage();
//           }
//         } else {
//           return Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
