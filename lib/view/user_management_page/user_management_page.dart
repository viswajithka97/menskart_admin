import 'package:flutter/material.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/user_management_page/widgets/user_management_search_widget.dart';
import 'package:menskart_admin/view/user_management_page/widgets/user_widget.dart';
import 'package:menskart_admin/view/widgets/drawer.dart';

class UserManagementPage extends StatelessWidget {
  const UserManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('User Management'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [
              // UserManagementSearchWidget(),
              kHeight20,
              UsersWidget()
            ],
          ),
        ),
      ),
    );
  }
}
