import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/view/categories_list_page/categories_add_page/categories_add_page.dart';
import 'package:menskart_admin/view/categories_list_page/widgets/category_list_tile_widget.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/widgets/drawer.dart';

class CategoriesListPage extends StatelessWidget {
  const CategoriesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(),
      body: SafeArea(
          child: ListView(
        children: const [
          kHeight10,
          CategoriesListtileWidget(),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(() => const CategoriesAddPage());
        },
      ),
    );
  }
}
