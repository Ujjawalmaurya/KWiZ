import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SelectionController extends GetxController {
  dynamic user;
  String userEmail;
  String userPhoneNumber;

  //
  @override
  void onInit() {
    getCurrentUserInfo();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getCurrentUserInfo() async {
    user = await FirebaseAuth.instance.currentUser;
    try {
      userEmail = user.email ?? "No-Email";
      // userPhoneNumber = user.phoneNumber ?? ;
      print("User: => $user");
      print("USER-EMAIL: => $userEmail");
      var str = user.email;
      const start = "@";
      const end = ".kwiz";

      final startIndex = str.indexOf(start);
      final endIndex = str.indexOf(end, startIndex + start.length);

      var adminOrUser = str.substring(startIndex + start.length, endIndex);

      if (adminOrUser == 'admin') {
        Get.offAllNamed('/TeacherHome');
      } else {
        Get.offAllNamed('/StudentHome');
      }
    } catch (e) {
      log(e.toString());
    }
  } //!

} // END
