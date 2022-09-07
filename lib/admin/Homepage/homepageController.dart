import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwiz/constants.dart';

class TeacherHomeController extends GetxController {
  //\

  signoutConfmBox() {
    Get.defaultDialog(
      title: "Attention",
      content: Text("Are you sure to logout?/??"),
      onConfirm: () => signOut(),
    );
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      closeApp;
    } catch (e) {
      print(e);
    }
  }
} // END
