import 'dart:developer';

import 'package:get/get.dart';
import 'package:menskart_admin/controller/product_controller/product_services/product_services.dart';
import 'package:menskart_admin/model/product_list_model/category_list_model.dart';

class CategoryListController extends GetxController {
  List<Category> categoryList = [];
  @override
  void onInit() {
    getAllCategory();
    super.onInit();
  }

  getAllCategory() async {
    try {
      final response = await ProductServices().getAllCategory();
      log(response!.data);
      if (response.statusCode == 200) {
        final data = categoryListModelFromJson(response.data);
        // log(data.products.toString());
        categoryList = data.category.obs;
        log('======={categoryList}========');
        update();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
