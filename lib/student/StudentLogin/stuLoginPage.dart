import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwiz/constants.dart';
import 'package:kwiz/student/StudentLogin/studentLoginController.dart';

class StudentLoginPage extends GetWidget<StuLoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage('assets/stuLogin.jpg'),
                            ),
                          ),
                          height: 235,
                          // width: 400,
                        ),
                        Divider(
                          color: Colors.deepPurpleAccent,
                          height: 50.0,
                        ),
                        Text(
                          "Log into Your Student Account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontSize: 40.0,
                              fontFamily: manjari,
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
                              controller.username = input + "@student.kwiz";
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
                        SizedBox(height: 25),
                        Container(
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
                                color: Colors.deepOrangeAccent,
                                splashColor: Colors.deepPurpleAccent,
                                child: Text("Student Login",
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.w900,
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
