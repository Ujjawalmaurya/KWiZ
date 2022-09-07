import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kwiz/admin/addNewStudents/signupController.dart';
import 'package:kwiz/constants.dart';
import 'package:kwiz/loading.dart';

class AddNewStudents extends GetWidget<SignUPController> {
  @override
  Widget build(BuildContext context) {
    return controller.isLoading.value == true
        ? Loading()
        : Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/addTest.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              child: SafeArea(
                child: Center(
                  child: Form(
                    key: controller.key,
                    child: Card(
                      margin: EdgeInsets.all(Get.width * 0.06),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.all(Get.width * 0.02)),
                            // Container(
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(20.0),
                            //       image: DecorationImage(
                            //           image:
                            //               AssetImage('assets/reg-asset.jpg'))),
                            //   width: Get.width * 0.8,
                            //   height: Get.width * 0.6,
                            // ),
                            SizedBox(height: 10.0),
                            //! Username
                            ListTile(
                              leading: FaIcon(
                                FontAwesomeIcons.userAlt,
                                color: Colors.deepPurpleAccent,
                              ),
                              title: TextFormField(
                                controller: controller.usernameController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (input) {
                                  if (input.isEmpty) {
                                    return 'Username is required';
                                  }
                                },
                                decoration: InputDecoration(labelText: "Username"),
                                onSaved: (input) {
                                  // setState(() {
                                  controller.email = input + '@student.kwiz';
                                  // });
                                  print(controller.email);
                                },
                              ),
                            ),
                            //! Password
                            ListTile(
                                leading: FaIcon(
                                  FontAwesomeIcons.userLock,
                                  color: Colors.deepPurpleAccent,
                                ),
                                title: TextFormField(
                                    controller: controller.passController,
                                    obscureText: true,
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Password is required';
                                      } else if (input.length < 6) {
                                        return 'Password is too short';
                                      }
                                    },
                                    decoration: InputDecoration(labelText: "Password"),
                                    onSaved: (input) {
                                      // setState(() {
                                      controller.pass = input;
                                      // });
                                      print(controller.pass);
                                    })),
                            //! Confirm Password
                            ListTile(
                                leading: FaIcon(
                                  FontAwesomeIcons.userLock,
                                  color: Colors.deepPurpleAccent,
                                ),
                                title: TextFormField(
                                    controller: controller.cPassController,
                                    obscureText: true,
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Confirmation Password is required';
                                      } else if (input.length < 6) {
                                        return ' Confirmed Password is too short';
                                      }
                                    },
                                    decoration: InputDecoration(labelText: "Confirm Password"),
                                    onSaved: (input) {
                                      // setState(() {
                                      controller.confPass = input;
                                      // });
                                      print(controller.confPass);
                                    })),
                            //! Selection of Branch
                            ListTile(
                              leading: FaIcon(
                                FontAwesomeIcons.sortNumericDown,
                                color: Colors.deepPurpleAccent,
                              ),
                              title: Text('Select Branch'),
                              trailing: DropdownButton<String>(
                                icon: Icon(Icons.arrow_drop_down),
                                value: (controller.branch == 'empty') ? null : controller.branch,
                                hint: Text('Branch'),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(color: Colors.deepPurpleAccent),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String newValue) {
                                  // setState(() {
                                  controller.branch = newValue;
                                  // });
                                },
                                items: <String>[
                                  'CE',
                                  'CSE',
                                  'EC',
                                  'EE',
                                  'ME(P)',
                                  'ME(A)',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            //! Selection of Branch Year
                            ListTile(
                              leading: FaIcon(
                                FontAwesomeIcons.sortNumericDown,
                                color: Colors.deepPurpleAccent,
                              ),
                              title: Text('Select Year'),
                              trailing: DropdownButton<String>(
                                icon: Icon(Icons.arrow_drop_down),
                                value: (controller.branchYear == 'empty')
                                    ? null
                                    : controller.branchYear,
                                hint: Text('Year'),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(color: Colors.deepPurpleAccent),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String newValue) {
                                  // setState(() {
                                  controller.branchYear = newValue;
                                  // });
                                },
                                items: <String>[
                                  '1',
                                  '2',
                                  '3',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(Get.height * 0.018)),
                            Container(
                                height: 50.0,
                                width: 250.0,
                                //!===========Add New Student Button======///////////
                                child: RaisedButton(
                                    onPressed: () async {
                                      print(
                                          "email: ${controller.email} and pass: ${controller.pass}");
                                      if (controller.key.currentState.validate()) {
                                        controller.key.currentState.save();
                                        if (controller.pass == controller.confPass &&
                                            controller.branch != 'empty' &&
                                            controller.branchYear != 'empty') {
                                          try {
                                            await controller.register();

                                            if (controller.tempUser != null) {
                                              controller.writeUUIdWithClass(controller.tempUser);
                                              //Message after sucessfull user creation
                                              // Fluttertoast.showToast(
                                              //   msg:
                                              //       "${tempUser.email} + Added Sucesfully in database",
                                              //   gravity: ToastGravity.CENTER,
                                              //   backgroundColor: Colors.green,
                                              //   textColor: Colors.white,
                                              // );
                                              custSnackbar('Success',
                                                  '${controller.tempUser.email} + Added Sucesfully in database');
                                              controller.clearFields();
                                              // setState(() {
                                              controller.isLoading.value = false;
                                              // });
                                            }
                                          } catch (e) {
                                            // setState(() {
                                            controller.errorMsg = e.message;
                                            controller.isLoading.value = false;
                                            // });
                                            controller.errorDialog(context);
                                          }
                                        } else {
                                          controller.errorPassDialog();
                                        }
                                      }
                                    },
                                    color: Colors.lightBlueAccent,
                                    splashColor: Colors.deepPurpleAccent,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.plus,
                                          color: Colors.deepOrangeAccent,
                                        ),
                                        SizedBox(width: 8),
                                        Text("Add New Student ",
                                            style: TextStyle(fontSize: 20.0, color: Colors.white)),
                                      ],
                                    ),
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
          );
  }
}
