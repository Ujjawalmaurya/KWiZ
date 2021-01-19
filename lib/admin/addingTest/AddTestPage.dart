import 'package:flutter/material.dart';
import 'addTestSheet.dart';

class AddTestPage extends StatefulWidget {
  static const String id = 'addTestPage';
  @override
  _AddTestPageState createState() => _AddTestPageState();
}

class _AddTestPageState extends State<AddTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a test"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/testbg.png'),
            )),
            child: Card(
              margin: EdgeInsets.all(2.0),
              color: Color(0x00FFFFF),
              child: Container(
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width * 1,
              ),
              // child: ListView.builder(
              // itemCount: datakey.length,
              // itemBuilder: (context, index) {
              //   return Column(
              //     children: [
              //       ListTile(
              //           leading: FaIcon(
              //             FontAwesomeIcons.video,
              //             color: kThemeColor,
              //           ),
              //           title: Text(snapShotdata[index]['title'],
              //               style: TextStyle(fontSize: 17.0)),
              //           onTap: () {
              //             Navigator.push(context, MaterialPageRoute(
              //               builder: (context) {
              //                 return Videos(
              //                     link: snapShotdata[index]['link']);
              //               },
              //             ));
              //           }),
              //       Divider(color: kThemeColor)
              //     ],
              //   );
              // },
              // ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddTest.id);
        },
      ),
    );
  }
}
