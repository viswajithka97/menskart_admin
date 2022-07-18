import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/products_list_page/add_products_page/add_products_page.dart';
import 'package:menskart_admin/view/products_list_page/widgets/product_container.dart';
import 'package:menskart_admin/view/widgets/drawer.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: SafeArea(
          child: Column(
        // shrinkWrap: true,
        children:  [
          Expanded(
            child: ProductContainer(),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kBlack,
        onPressed: () {
          Get.to(const AddProductsPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
