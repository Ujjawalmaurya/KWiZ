import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwiz/admin/Homepage/homepageController.dart';
import 'package:kwiz/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TeachersHomePage extends GetWidget<TeacherHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Admin",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30.0,
            )),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                controller.signoutConfmBox();
              })
        ],
      ),
      body: Container(
        color: Color(0xFF4810CC),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  height: 200,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      // height: 300.0,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 700),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      // onPageChanged: callbackFunction,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              padding: EdgeInsets.all(10.0),
                              width: Get.width,
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                'Current Test $i',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 26.0, fontFamily: manjari),
                              ));
                        },
                      );
                    }).toList(),
                  )),
              AdminHomePageButtons(
                  title: 'Add a new Test',
                  onPressed: () => Get.toNamed('/AddTest'),
                  color: Colors.blueAccent),
              AdminHomePageButtons(
                title: 'Get Student Details',
                onPressed: () => Get.toNamed('/GetStudents'),
                color: Colors.yellow,
              ),
              AdminHomePageButtons(
                  title: "Add new Student",
                  onPressed: () => Get.toNamed('/AddNewStudent'),
                  color: Colors.deepPurpleAccent)
            ],
          ),
        ),
      ),
    );
  }
}

class AdminHomePageButtons extends StatelessWidget {
  const AdminHomePageButtons({
    @required this.title,
    @required this.onPressed,
    @required this.color,
  });

  final String title;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 170.0,
      // width: 160.0,
      child: RaisedButton(
        elevation: 15.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        onPressed: onPressed,
        color: color,
        child:
            // Row(
            // children: [
            // DecoratedIcon(Icons.add,
            //     color: Colors.pink,
            //     size: 75.0,
            //     shadows: [
            //       BoxShadow(
            //         blurRadius: 25.0,
            //         color: Colors.pinkAccent,
            //       ),
            //       BoxShadow(
            //         blurRadius: 15.0,
            //         color: Colors.lightBlueAccent,
            //       ),
            //     ]),
            Text(
          title,
          style: TextStyle(
            fontFamily: jost,
            fontWeight: FontWeight.w900,
            fontSize: 35.0,
            color: Colors.white,
          ),
          // ),
          // ],
        ),
      ),
    );
  }
}
