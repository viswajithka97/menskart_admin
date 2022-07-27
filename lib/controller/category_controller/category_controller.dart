import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:menskart_admin/controller/category_controller/category_services/category_services.dart';
import 'package:menskart_admin/model/category_model/add_category_model.dart';
import 'package:menskart_admin/model/category_model/delete_category_model.dart';
import 'package:menskart_admin/model/category_model/update_category_model.dart';
import 'package:menskart_admin/model/product_list_model/category_list_model.dart';
import 'package:menskart_admin/view/core/color_constants.dart';

class CategoryController extends GetxController {
  List<Category>? category;
  final ImagePicker picker = ImagePicker();
  File? categoryImage;
  getAllCategory() async {
    try {
      final response = await CategoryServices().getAllCategory();
      log(response!.data);
      if (response.statusCode == 200) {
        final data = categoryListModelFromJson(response.data);
        category = data.category.obs;
        update();
      }
    } catch (e) {
      log("message   $e");
    }
  }

  addCategory(String categoryName) async {
    try {
      final response =
          await CategoryServices().addCategory(categoryName, categoryImage!);
      log(response!.data);
      if (response.statusCode == 200) {
        final data = addCategoryModelFromJson(response.data);

        if (data.admin) {
          Get.snackbar(
            "Success",
            "Category added successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: kGreen,
            snackStyle: SnackStyle.FLOATING,
          );

          getAllCategory();
          update();
          imageCache.clear();
          categoryImage = null;
        }
      }
    } catch (e) {
      log("message   $e");
    }
  }

  updateCategory(String categoryName, String categoryId) async {
    try {
      final response = await CategoryServices()
          .updateCategory(categoryName, categoryId, categoryImage!);
      log(response!.data);
      if (response.statusCode == 200) {
        final data = updateCategoryModelFromJson(response.data);

        if (data.admin) {
          Get.snackbar(
            "Success",
            "Category updated successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: kGreen,
            snackStyle: SnackStyle.FLOATING,
          );

          getAllCategory();
          update();
        }
      }
    } catch (e) {
      log("message   $e");
    }
  }

  deleteCategory(String categoryId) async {
    try {
      final response = await CategoryServices().deleteCategory(categoryId);
      log(response!.data);
      if (response.statusCode == 200) {
        final data = deleteCategoryModelFromJson(response.data);
        if (data.success) {
          Get.snackbar("Success", "Category deleted successfully",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: kGreen,
              snackStyle: SnackStyle.FLOATING);
          update();
        }
      }
    } catch (e) {
      log("message   $e");
    }
  }

  selectImage() async {
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (image != null) {
      categoryImage = File(image.path);

      update();
    }
  }

  @override
  void onInit() {
    getAllCategory();
    super.onInit();
  }
}
