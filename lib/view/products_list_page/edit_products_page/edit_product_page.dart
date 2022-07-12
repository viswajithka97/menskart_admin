import 'package:flutter/material.dart';
import 'package:menskart_admin/view/products_list_page/edit_products_page/widgets/edit_product_top_section.dart';
import 'package:menskart_admin/view/products_list_page/edit_products_page/widgets/edit_products_details_section.dart';

class EditProductPage extends StatelessWidget {
  const EditProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: const[
            EditProductTopSection(),
            EditProductDetailSection(),
          ],
          
        ),
      ))
    );
  }
}