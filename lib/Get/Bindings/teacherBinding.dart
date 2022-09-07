import 'package:get/get.dart';
import 'package:kwiz/admin/Homepage/homepageController.dart';
import 'package:kwiz/admin/addNewStudents/signupController.dart';
import 'package:kwiz/admin/login/loginController.dart';

import '../../admin/addingTest/addTestController.dart';

//! Teacher/Admin

class TeacherLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TeacherLoginController());
  }
}

class TeacherHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TeacherHomeController());
  }
}

class AddTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddTestController());
  }
}

class AddStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUPController());
  }
}

// class _Binding extends Bindings {
//   @override
//   void dependencies() {
//     Get.put();
//   }
// }

// class _Binding extends Bindings {
//   @override
//   void dependencies() {
//     Get.put();
//   }
// }

// class _Binding extends Bindings {
//   @override
//   void dependencies() {
//     Get.put();
//   }
// }

// class _Binding extends Bindings {
//   @override
//   void dependencies() {
//     Get.put();
//   }
// }
