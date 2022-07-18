import 'package:flutter/material.dart';
import 'package:menskart_admin/view/products_list_page/add_products_page/widgets/add_products_detailsadd_section.dart';
import 'package:menskart_admin/view/products_list_page/add_products_page/widgets/add_products_top_section.dart';

class AddProductsPage extends StatelessWidget {
  const AddProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Products'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const AddProductsTopSection(),
            AddProductsDetailsSection()
          ],
        ),
      )),
    );
  }
}
