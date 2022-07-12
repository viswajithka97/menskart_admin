import 'dart:developer';
import 'package:get/get.dart';
import 'package:menskart_admin/controller/product_controller/product_services/product_services.dart';
import 'package:menskart_admin/model/product_list_model/product_list_model.dart';

class ProductController extends GetxController {
  List<Product> products = [];
  getProducts() async {
    try {
      final response = await ProductServices().getProducts();
      if (response!.statusCode == 200) {
        final data = productListModelFromJson(response.data);
        // log(data.products.toString());
        products = data.products.obs;
        update();
      }
    } catch (e) {
      log('$e');
    }
  }

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }
}
