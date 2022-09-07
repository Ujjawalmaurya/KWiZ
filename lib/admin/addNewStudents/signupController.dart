import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class SignUPController extends GetxController {
  //
  TextEditingController usernameController, studentClassController, passController, cPassController;
  GlobalKey<FormState> key = new GlobalKey();
  RxBool isLoading = false.obs;
  String email, pass, confPass, errorMsg;
  String branch = 'empty', branchYear = 'empty';
  User tempUser;

  //Error dialogbox
  errorDialog(context) {
    showDialog(
        context: context,
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
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok"),
                )
              ]);
        });
  }

  ///Pass Not Match dialog
  errorPassDialog() {
    Get.defaultDialog(
      title: 'Error',
      // onConfirm: () => print("Ok"),
      middleText: "fill All fields correctly",
      textConfirm: 'Retry',
    );
  }

  clearFields() async {
    cPassController.clear();
    passController.clear();
    usernameController.clear();
  }

  Future register() async {
    // setState(() {
    isLoading.value = true;
    // });

    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass);
    User user = FirebaseAuth.instance.currentUser;
    // setState(() {
    tempUser = user;
    // });
    // final storage = new FlutterSecureStorage();
    String parentEmail = storage.read('email') ?? 'null-Email';
    String parentPass = storage.read('pass') ?? 'null-Pass';
    print(parentEmail);

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: parentEmail, password: parentPass);
  }

  writeUUIdWithClass(newUser) async {
    final dRefrence = FirebaseDatabase.instance.reference();
    print(tempUser.email);
    if (tempUser != null) {
      final dbReference = dRefrence.child("studentInfos").child(tempUser.uid);
      await dbReference.set({
        "branch": branch,
        "year": branchYear,
        "userEmail": tempUser.email,
        "userUid": tempUser.uid,
      }).catchError((e) {
        print(e.toString());
      }).whenComplete(() {
        clearFields();
      });
    } else {
      // setState(() {
      isLoading.value = false;
      // });
      // Fluttertoast.showToast(
      //     msg: "Oops",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
      custSnackbar('OOps', 'Something went wrong');
    }
  }
} //END
