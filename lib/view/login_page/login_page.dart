import 'package:flutter/material.dart';
import 'package:menskart_admin/view/login_page/widgets/login_section.dart';
import 'package:menskart_admin/view/login_page/widgets/login_top_section.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const LoginTopSection(),
        LoginSection(),
      ],
    ));
  }
}
