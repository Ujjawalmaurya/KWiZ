import 'package:flutter/material.dart';

class StudentLoginPage extends StatefulWidget {
  @override
  _StudentLoginPageState createState() => _StudentLoginPageState();
}

class _StudentLoginPageState extends State<StudentLoginPage> {
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
              // key: _key,
              child: Card(
                elevation: 25.0,
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.03,
                  right: MediaQuery.of(context).size.width * 0.03,
                  // top: MediaQuery.of(context).size.height * 0.08,
                  // bottom: MediaQuery.of(context).size.height * 0.16
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
                            // decoration: BoxDecoration(
                            // image: DecorationImage(
                            // image: AssetImage(
                            //   "assets/logo.jpg",
                            // ),
                            // fit: BoxFit.cover,
                            // alignment: Alignment.center,
                            //   ),
                            ),
                        Text(
                          "Log into Your Stduent Account",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 40.0),
                        ),
                        //!============
                        //! Username
                        //!============
                        ListTile(
                          title: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (input) {
                              if (input.isEmpty) {
                                return 'Username is required';
                              }
                            },
                            decoration: InputDecoration(labelText: "Username"),
                          ),
                        ),

                        ///!==============
                        //! Password
                        ///!==============
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
                          decoration: InputDecoration(labelText: "Password"),
                        )),
                        SizedBox(height: 25),
                        Container(
                            height: 50.0,
                            width: MediaQuery.of(context).size.width * 0.65,

                            //!================Get-IN Button============///
                            child: RaisedButton(
                                onPressed: () {
                                  //on pressed function
                                },
                                color: Colors.redAccent,
                                splashColor: Colors.deepPurpleAccent,
                                child: Text("Get in",
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white)),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(25.0)))),
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
