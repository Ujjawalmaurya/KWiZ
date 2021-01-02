import 'package:flutter/material.dart';
import 'package:kwiz/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kwiz/admin/adminHomePage.dart';
import 'package:kwiz/student/stuHomePage.dart';
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
          // print(user.email);
          // var str = user.email;
          const start = "@";
          const end = ".kwiz";

          // final startIndex = str.indexOf(start);
          // final endIndex = str.indexOf(end, startIndex + start.length);

          // var adminOrUser = str.substring(startIndex + start.length, endIndex);

          if (user == null) {
            return ShowCasePage();
          }
          print(FirebaseAuth.instance.currentUser);
          return TeachersHomePage();

          // if (adminOrUser == 'admin') {
          //   return TeachersHomePage();
          // } else {
          //   return StudentHomePage();
          // }
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
