import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/view/dashboard_page/dashboard_page.dart';
import 'package:menskart_admin/view/login_page/login_page.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashBoardPage(),
    );
  }
}
