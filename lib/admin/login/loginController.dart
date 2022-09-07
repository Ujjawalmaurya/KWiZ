import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TeacherLoginController extends GetxController {
  GlobalKey<FormState> key = new GlobalKey();
  FirebaseAuth auth = FirebaseAuth.instance;

  String username, password, errorMsg;
  RxBool isLoading = false.obs;

  //SignIn with email Fxn
  Future<void> signIn(c) async {
    // Firebase.initializeApp();
    // setState(() {
    isLoading.value = true;
    // });
    try {
      UserCredential userCredential = await auth
          .signInWithEmailAndPassword(email: this.username, password: this.password)
          .whenComplete(() {
        // setState(() {
        isLoading.value = false;
        // });
      });

      final User user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // writeDeviceInfo();
        return Get.offAllNamed('/TeacherHome');
      }
    } catch (e) {
      // setState(() {
      errorMsg = e.message;
      isLoading.value = false;
      // });
      errorDialog(c);
    }
  }

  errorDialog(c) {
    showDialog(
      context: c,
      builder: (context) {
        return AlertDialog(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          title: Text(
            'Error',
            style: TextStyle(color: Colors.red),
          ),
          content: Text(errorMsg),
          actions: [
            FlatButton(
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.red, width: 2),
              ),
              onPressed: () {
                // clearFields();
                Navigator.of(context).pop();
              },
              child: Text("Ok"),
            )
          ],
        );
      },
    );
  }
} //END
