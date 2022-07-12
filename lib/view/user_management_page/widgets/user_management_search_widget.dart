import 'package:flutter/material.dart';
import 'package:menskart_admin/view/core/space_constants.dart';

class UserManagementSearchWidget extends StatelessWidget {
  const UserManagementSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight10,
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Search By Name',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
