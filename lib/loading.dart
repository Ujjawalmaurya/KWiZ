import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<Color> _kDefaultRainbowColors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
    ];
    print('RndNum ${int.parse(Random().nextInt(33).toString())}');

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: Get.height,
          width: Get.width / 2,
          child: Padding(
            padding: const EdgeInsets.all(60.0),
            child: Center(
              child: LoadingIndicator(
                colors: _kDefaultRainbowColors,
                indicatorType: Indicator.values[int.parse(Random().nextInt(33).toString())],
                strokeWidth: 2.5,
                // pause: pause,
                pathBackgroundColor: Colors.black45,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
