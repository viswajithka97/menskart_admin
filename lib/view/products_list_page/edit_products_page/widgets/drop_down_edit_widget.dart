import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/controller/product_controller/category_lIst_controler/category_list_controller.dart';
import 'package:menskart_admin/controller/product_controller/product_controller.dart';
import 'package:menskart_admin/view/core/color_constants.dart';

String? editvalue;

class DropdowmenuEditPage extends StatelessWidget {
  final int? index;
  DropdowmenuEditPage({Key? key, this.index}) : super(key: key);

  final productcontroller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GetBuilder<CategoryListController>(
        init: CategoryListController(),
        builder: (controller) {
          return Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              width: 375,
              decoration: BoxDecoration(
                border: Border.all(
                  color: kBackgroundGrey,
                ),
              ),
              child: DropdownButton(
                  itemHeight: 60,
                  isDense: true,
                  isExpanded: true,
                  elevation: 0,
                  alignment: Alignment.centerLeft,
                  hint: Text(
                      productcontroller.products[index!].category.toString()),
                  value: editvalue,
                  items: controller.categoryList.map((category) {
                    return DropdownMenuItem(
                      value: category.category,
                      child: Text(category.category),
                    );
                  }).toList(),
                  onChanged: (value) async {
                    editvalue = value.toString();
                    controller.update();
                  }),
            ),
          );
        },
      ),
    );
  }
}
