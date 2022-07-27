import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:menskart_admin/controller/product_controller/product_services/product_services.dart';
import 'package:menskart_admin/model/product_list_model/add_product_model.dart';
import 'package:menskart_admin/model/product_list_model/delete_product_model.dart';
import 'package:menskart_admin/model/product_list_model/edit_product_modal.dart';
import 'package:menskart_admin/model/product_list_model/product_list_model.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/products_list_page/edit_products_page/widgets/drop_down_edit_widget.dart';

class ProductController extends GetxController {
  List<Product> products = [];
  final ImagePicker picker = ImagePicker();
  // late Response<dynamic> response;
  // int? statusCode;

  File? imagefile1;
  File? imagefile2;
  File? imagefile3;

  getProducts() async {
    try {
      final response = await ProductServices().getProducts();
      log(response!.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = productListModelFromJson(response.data);
        // log(data.products.toString());
        products = data.products.obs;
        update();
      }
    } catch (e) {
      log('---------------------------this is-------$e');
    }
  }

  addProduct(
    String productName,
    String brand,
    String category,
    String price,
    String offerPercent,
  ) async {
    try {
      final response = await ProductServices().addProduct(productName, brand,
          category, price, offerPercent, imagefile1!, imagefile2!, imagefile3!);
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final data = addProductModelFromJson(response.data);
        if (data.success) {
          Get.back();
          Get.snackbar(
            'Success',
            'Product added successfully',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: kGreen,
            snackStyle: SnackStyle.FLOATING,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
          );
          imagefile1 = null;
          imageCache.clear();
          getProducts();
        } else {
          Get.snackbar(
            'Error',
            'Product not added',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            snackStyle: SnackStyle.FLOATING,
          );
        }
      }
    } catch (e) {
      log('message:' '$e');
    }
  }

  updateProduct(
    String productName,
    String brand,
    String category,
    String price,
    String percentage,
    String productId,
  ) async {
    try {
      final response = await ProductServices().updateProduct(productName, brand,
          category, price, percentage, productId, imagefile1!);
      log(response!.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = editProductModalFromJson(response.data);
        if (data.success) {
          Get.back();
          Get.snackbar('Success', 'Product updated successfully',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: kGreen,
              snackStyle: SnackStyle.FLOATING,
              colorText: kWhite);
          getProducts();
        } else {
          Get.snackbar(
            'Error',
            'Product not updated',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            snackStyle: SnackStyle.FLOATING,
          );
        }
      }
      imagefile1 = null;
      imageCache.clear();
      editvalue = null;
    } catch (e) {
      log('===================$e');
    }
  }

  deleteProduct(String id) async {
    try {
      final response = await ProductServices().deleteProduct(id);
      if (response!.statusCode == 200) {
        final data = deleteProductModelFromJson(response.data);
        if (data.success) {
          getProducts();
          Get.snackbar(
            'Success',
            "Product has been Deleted",
            backgroundColor: kGreen,
          );
        }
      }
    } catch (e) {
      log('message:' '$e');
    }
  }

  selectImage1() async {
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (image != null) {
      imagefile1 = File(image.path);
      log("============${imagefile2.toString()}");
      update();
    }
  }

  selectImage2() async {
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (image != null) {
      imagefile2 = File(image.path);
      log("============${imagefile2.toString()}");
      update();
    }
  }

  selectImage3() async {
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (image != null) {
      imagefile3 = File(image.path);
      log("============${imagefile2.toString()}");
      update();
    }
  }

  @override
  void onInit() {
    getProducts();

    super.onInit();
  }
}
