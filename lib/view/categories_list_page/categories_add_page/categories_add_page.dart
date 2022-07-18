import 'package:flutter/material.dart';
import 'package:menskart_admin/view/categories_list_page/categories_add_page/widgets/category_add_bottom_section.dart';
import 'package:menskart_admin/view/categories_list_page/categories_add_page/widgets/category_add_image_select.dart';
import 'package:menskart_admin/view/core/space_constants.dart';

class CategoriesAddPage extends StatelessWidget {
  const CategoriesAddPage({Key? key}) : super(key: key);

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
            const  AddCategoryImageSelect(),
              kHeight20,
              CategoryAddBottomSection(),
            ],
          ),
        ),
      ),
    );
  }
}
