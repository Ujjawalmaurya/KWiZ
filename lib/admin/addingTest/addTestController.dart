import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddTestController extends GetxController {
  final firestoreInstance = FirebaseFirestore.instance;

  var now = DateTime.now();
  Map datakey = new Map();
  Map snapShotdata = new Map();

  ///
  RxBool addOrGet = false.obs;
  RxString question, questionNum;
  RxBool isBool = true.obs;
  RxBool isBoolAnswer = false.obs;
  var correctOption;
  RxString optionA, optionB, optionC, optionD;
  RxString branch = ''.obs, branchYear = ''.obs, sub = ''.obs;
  // RxString sub = 'empty'.obs;
  RxBool isUploading;

  //
} // END
