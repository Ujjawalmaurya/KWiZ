import 'package:get/get.dart';
import 'package:kwiz/selectionPage/selectionController.dart';

//! Others

class SelectionBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SelectionController());
  }
}
