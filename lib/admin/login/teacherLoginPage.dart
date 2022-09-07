import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwiz/admin/login/loginController.dart';
import 'package:kwiz/constants.dart';
import 'package:kwiz/loading.dart';

class TeachersLoginPage extends GetWidget<TeacherLoginController> {
  @override
  Widget build(BuildContext context) {
    return controller.isLoading.value == true
        ? Container(
            color: Color(0xff4834DF),
            height: Get.height * 1,
            width: Get.width * 1,
            child: Center(
              child: Loading(),
            ),
          )
        : Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/bg.png",
                  ),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              // color: Colors.white,
              child: SafeArea(
                child: Center(
                  child: Form(
                    key: controller.key,
                    child: Card(
                      elevation: 25.0,
                      margin: EdgeInsets.only(
                        left: Get.width * 0.03,
                        right: Get.width * 0.03,
                        // top: Get.height * 0.08,
                        // bottom: Get.height * 0.16
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: EdgeInsets.only(top: 5.0, bottom: 15.0, left: 15, right: 15),
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    // fit: BoxFit.contain,
                                    image: AssetImage('assets/adLogin.png'),
                                  )),
                                  height: Get.width * 0.6,
                                  width: Get.width * 0.65),
                              Divider(
                                color: Colors.deepPurpleAccent,
                                height: 20.0,
                              ),
                              Text(
                                "Log into Your Admin Account",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 40.0,
                                    color: Colors.pinkAccent,
                                    fontFamily: jost,
                                    fontWeight: FontWeight.w900),
                              ),

                              //! Username ====================
                              ListTile(
                                title: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (input) {
                                    if (input.isEmpty) {
                                      return 'Username is required';
                                    }
                                  },
                                  onChanged: (input) {
                                    controller.username = input + "@admin.kwiz";
                                  },
                                  decoration: InputDecoration(labelText: "Username"),
                                ),
                              ),

                              //! Password ===================
                              ListTile(
                                  title: TextFormField(
                                obscureText: true,
                                validator: (input) {
                                  if (input.isEmpty) {
                                    return 'Password is required';
                                  } else if (input.length < 6) {
                                    return 'Password is too short';
                                  }
                                },
                                onChanged: (input) {
                                  controller.password = input;
                                },
                                decoration: InputDecoration(labelText: "Password"),
                              )),
                              // SizedBox(height: 25),
                              Container(
                                  margin: EdgeInsets.only(top: 20.0, bottom: 35.0),
                                  height: 50.0,
                                  width: Get.width * 0.65,

                                  //!================Get-IN Button============///
                                  child: RaisedButton(
                                      onPressed: () {
                                        if (controller.key.currentState.validate()) {
                                          controller.key.currentState.save();
                                          controller.signIn(context);
                                        }
                                      },
                                      color: Colors.redAccent,
                                      splashColor: Colors.deepPurpleAccent,
                                      child: Text("Admin Login",
                                          style: TextStyle(
                                              fontSize: 25.0,
                                              color: Colors.white,
                                              fontFamily: jost)),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25.0)))),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
