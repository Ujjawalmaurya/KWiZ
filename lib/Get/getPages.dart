import 'package:get/get.dart';
import 'package:kwiz/Get/Bindings/teacherBinding.dart';
import 'package:kwiz/admin/addingTest/AddTestPage.dart';
import 'package:kwiz/admin/login/teacherLoginPage.dart';
import 'package:kwiz/admin/addNewStudents/signUp.dart';
import 'package:kwiz/selectionPage/selectionPage.dart';
import 'package:kwiz/student/StudentLogin/stuLoginPage.dart';

import '../admin/Homepage/adminHomePage.dart';
import '../admin/StudentDetails/getStuDetails.dart';
import '../student/StudentHomePage/stuHomePage.dart';
import 'Bindings/othersBinding.dart';
import 'Bindings/studentBinding.dart';

class GetPages {
  static List<GetPage> pages = [
    //! Others

    GetPage(
      name: '/SelectionPage',
      binding: SelectionBindings(),
      page: () => SelectionPage(),
    ),
    // GetPage(
    //   name: '/',
    //   page: () => (),
    // ),
    // GetPage(
    //   name: '/',
    //   page: () => (),
    // ),
    // GetPage(
    //   name: '/',
    //   page: () => (),
    // ),
    // GetPage(
    //   name: '/',
    //   page: () => (),
    // ),
    // GetPage(
    //   name: '/',
    //   page: () => (),
    // ),
    // GetPage(
    //   name: '/',
    //   page: () => (),
    // ),

    //! Students =========================================
    GetPage(
      name: '/StudentLogin',
      page: () => StudentLoginPage(),
      binding: StudentLoginBinding(),
    ),
    GetPage(
      name: '/StudentHome',
      page: () => StudentHomePage(),
    ),
    // GetPage(
    //   name: '/',
    //   page: () => (),
    // ),
    // GetPage(
    //   name: '/',
    //   page: () => (),
    // ),
    // GetPage(
    //   name: '/',
    //   page: () => (),
    // ),

    //
    //! Admin ============================================
    GetPage(
      name: '/AdminLogin',
      page: () => TeachersLoginPage(),
      binding: TeacherLoginBinding(),
    ),
    GetPage(
      name: '/TeacherHome',
      page: () => TeachersHomePage(),
      binding: TeacherHomeBinding(),
    ),
    GetPage(
      name: '/AddTest',
      page: () => AddTest(),
      binding: AddTestBinding(),
    ),
    GetPage(
      name: '/GetStudents',
      page: () => GetStuDetails(),
      // binding:
    ),
    GetPage(
      name: '/AddNewStudent',
      page: () => AddNewStudents(),
      binding: AddStudentBinding(),
    ),
    // GetPage(
    //   name: '/',
    //   page: () => (),
    // ),
  ];
}
