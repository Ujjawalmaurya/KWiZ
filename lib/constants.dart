//! Some Fixed values will be here
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final adminButtonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(15.0),
);

final storage = GetStorage();

//! POP-System navigator
final closeApp = SystemNavigator.pop();

//! Custom Fonts
final String manjari = "Manjari";
final String jost = "Jost";

void custSnackbar(String title, String message) => Get.snackbar(title, message);
