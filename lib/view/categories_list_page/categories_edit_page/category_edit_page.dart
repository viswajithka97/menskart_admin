import 'package:flutter/material.dart';
import 'package:menskart_admin/view/categories_list_page/categories_edit_page/widgets/category_edit_bottom_section.dart';
import 'package:menskart_admin/view/categories_list_page/categories_edit_page/widgets/category_edit_image_select.dart';
import 'package:menskart_admin/view/core/space_constants.dart';

class CategoriesEditPage extends StatelessWidget {
  const CategoriesEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Categories'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children:  [
              kHeight20,
              CategoryEditImageSelect(),
              kHeight20,
              CategoryEditBottomSection(),
            ],
          ),
        ),
      ),
    );
  }
}
